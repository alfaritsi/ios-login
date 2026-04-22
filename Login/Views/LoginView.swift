//
//  LoginView.swift
//  Login
//
//  Created by el-Barbasy on 22/04/26.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var isLoggedIn: Bool
    
    @State private var username = "emilys"
    @State private var password = "emilyspass"
    @State private var message = ""
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Username", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            if isLoading {
                ProgressView()
            }
            
            CustomButton(title: "Login") {
                login()
            }
            
            Text(message)
                .foregroundColor(.red)
        }
        .padding()
    }
    
    func login() {
        isLoading = true
        
        AuthRepository.shared.login(username: username, password: password) { result, error in
            
            isLoading = false
            
            if result != nil {
                isLoggedIn = true
            } else {
                message = error ?? "Login gagal"
            }
        }
    }
}

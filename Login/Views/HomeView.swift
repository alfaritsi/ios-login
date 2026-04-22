//
//  HomeView.swift
//  Login
//
//  Created by el-Barbasy on 22/04/26.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var isLoggedIn: Bool
    @State private var name: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Welcome \(name)")
                
                CustomButton(title: "Ambil Data User", color: .green) {
                    getUser()
                }
                
                // 🔥 BUTTON KE LIST PRODUK
                NavigationLink(destination: ProductListView()) {
                    Text("List Produk")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                CustomButton(title: "Logout", color: .red) {
                    logout()
                }
            }
            .padding()
        }
    }
    
    func getUser() {
        AuthRepository.shared.getCurrentUser { user, _ in
            if let user = user {
                name = user.firstName
            }
        }
    }
    
    func logout() {
        TokenManager.shared.clear()
        isLoggedIn = false
    }
}

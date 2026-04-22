//
//  LoginApp.swift
//  Login
//
//  Created by el-Barbasy on 22/04/26.
//
import SwiftUI

@main
struct LoginApp: App {
    
    @State private var isLoggedIn: Bool = TokenManager.shared.getAccessToken() != nil
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                HomeView(isLoggedIn: $isLoggedIn)
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}


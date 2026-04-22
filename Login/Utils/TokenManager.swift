//
//  TokenManager.swift
//  Login
//
//  Created by el-Barbasy on 22/04/26.
//

import Foundation

class TokenManager {
    
    static let shared = TokenManager()
    
    func save(access: String, refresh: String) {
        UserDefaults.standard.set(access, forKey: "accessToken")
        UserDefaults.standard.set(refresh, forKey: "refreshToken")
    }
    
    func getAccessToken() -> String? {
        UserDefaults.standard.string(forKey: "accessToken")
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: "accessToken")
        UserDefaults.standard.removeObject(forKey: "refreshToken")
    }
}

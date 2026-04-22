//
//  AuthRepository.swift
//  Login
//
//  Created by el-Barbasy on 22/04/26.
//

import Foundation

class AuthRepository {
    
    static let shared = AuthRepository()
    
    func login(username: String, password: String, completion: @escaping (LoginResponse?, String?) -> Void) {
        
        guard let url = URL(string: "https://dummyjson.com/auth/login") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "username": username,
            "password": password,
            "expiresInMins": 30
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            
            DispatchQueue.main.async {
                
                guard let data = data else {
                    completion(nil, "No data")
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(LoginResponse.self, from: data)
                    
                    TokenManager.shared.save(access: result.accessToken, refresh: result.refreshToken)
                    
                    completion(result, nil)
                    
                } catch {
                    completion(nil, "Login gagal")
                }
            }
            
        }.resume()
    }
    
    func getCurrentUser(completion: @escaping (LoginResponse?, String?) -> Void) {
        
        guard let token = TokenManager.shared.getAccessToken() else {
            completion(nil, "Token tidak ada")
            return
        }
        
        guard let url = URL(string: "https://dummyjson.com/auth/me") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            
            DispatchQueue.main.async {
                
                guard let data = data else {
                    completion(nil, "Gagal ambil user")
                    return
                }
                
                let user = try? JSONDecoder().decode(LoginResponse.self, from: data)
                completion(user, user == nil ? "Decode error" : nil)
            }
            
        }.resume()
    }
}

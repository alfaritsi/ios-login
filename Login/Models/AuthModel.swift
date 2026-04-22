//
//  AuthModel.swift
//  Login
//
//  Created by el-Barbasy on 22/04/26.
//

import Foundation

struct LoginResponse: Codable {
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let gender: String
    let image: String
    let accessToken: String
    let refreshToken: String
}

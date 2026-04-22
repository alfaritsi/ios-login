//
//  ProductModel.swift
//  Login
//
//  Created by el-Barbasy on 22/04/26.
//

import Foundation

struct ProductResponse: Codable {
    let products: [Product]
}

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let thumbnail: String
}

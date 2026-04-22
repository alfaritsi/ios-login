//
//  ProductRepository.swift
//  Login
//
//  Created by el-Barbasy on 22/04/26.
//

import Foundation

class ProductRepository {
    
    static let shared = ProductRepository()
    
    func getProducts(completion: @escaping ([Product]) -> Void) {
        
        guard let url = URL(string: "https://dummyjson.com/products") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            DispatchQueue.main.async {
                
                guard let data = data else {
                    completion([])
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(ProductResponse.self, from: data)
                    completion(result.products)
                } catch {
                    print("Decode error")
                    completion([])
                }
            }
            
        }.resume()
    }
}

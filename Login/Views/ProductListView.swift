//
//  ProductListView.swift
//  Login
//
//  Created by el-Barbasy on 22/04/26.
//

import SwiftUI

struct ProductListView: View {
    
    @State private var products: [Product] = []
    
    var body: some View {
        NavigationView {
            List(products) { product in
                HStack {
                    
                    AsyncImage(url: URL(string: product.thumbnail)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.headline)
                        
                        Text("$\(product.price)")
                            .foregroundColor(.green)
                    }
                }
            }
            .navigationTitle("Produk")
            .onAppear {
                loadData()
            }
        }
    }
    
    func loadData() {
        ProductRepository.shared.getProducts { result in
            products = result
        }
    }
}

#Preview {
    ProductListView()
}

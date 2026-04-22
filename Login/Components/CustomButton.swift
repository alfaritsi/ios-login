//
//  CustomButton.swift
//  Login
//
//  Created by el-Barbasy on 22/04/26.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var color: Color = .blue
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

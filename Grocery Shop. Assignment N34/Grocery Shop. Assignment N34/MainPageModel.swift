//
//  MainPageModel.swift
//  Grocery Shop. Assignment N34
//
//  Created by tornike <parunashvili on 09.12.23.
//

import Foundation

class Products: Identifiable, ObservableObject {
    let id = UUID()
    let productName: String
    let productImageName: String
    let productPrice: Double
    var stockQuantity: Int
    @Published var quantity: Int
    
    init(productName: String, productImageName: String, productPrice: Double, quantity: Int, stockQuantity: Int) {
        self.productName = productName
        self.productImageName = productImageName
        self.productPrice = productPrice
        self.quantity = quantity
        self.stockQuantity = stockQuantity
    }
    
    func increaseQuantity() -> Bool {
        if stockQuantity > 0 {
            quantity += 1
            stockQuantity -= 1
            return true
        } else {
            print("Quantity exceeds available stock")
            return false
        }
    }
    
    func decreaseQuantity() -> Bool {
        if quantity > 0 {
            quantity -= 1
            stockQuantity += 1
            return true
        } else {
            print("Quantity is already 0")
            return false
        }
    }
}



//
//  MainPageViewModel.swift
//  Grocery Shop. Assignment N34
//
//  Created by tornike <parunashvili on 09.12.23.
//

import SwiftUI

class MainPageViewModel: ObservableObject {
    
    @Published var showAlert = false
    
    @Published var groceriesList: [Products] = [
        Products(productName: "Banana", productImageName: "Banana", productPrice: 3.14, quantity: 0, stockQuantity: 10),
        Products(productName: "Apple", productImageName: "Apple", productPrice: 2.6, quantity: 0, stockQuantity: 12),
        Products(productName: "Pineapple", productImageName: "Pineapple", productPrice: 4.6, quantity: 0, stockQuantity: 14),
        Products(productName: "Chalagaji", productImageName: "chalagaji", productPrice: 25.90, quantity: 0, stockQuantity: 5),
    ]
    
    func increaseQuantity(for index: Int) {
        guard groceriesList.indices.contains(index) else {
            return
        }
        let product = groceriesList[index]
        if product.stockQuantity > 0 {
            product.quantity += 1
            product.stockQuantity -= 1
            objectWillChange.send()
        } else {
            showAlert = true
        }
    }
    
    func decreaseQuantity(for index: Int) {
        guard groceriesList.indices.contains(index) else {
            return
        }
        let product = groceriesList[index]
        if product.quantity > 0 {
            product.quantity -= 1
            product.stockQuantity += 1
            objectWillChange.send()
        }
    }
    
    
    func totalQuantity() -> Int {
        var total = 0
        for product in groceriesList {
            total += product.quantity
        }
        return total
    }
    
    func totalPrice() -> Double {
        var totalPrice = 0.0
        for product in groceriesList {
            totalPrice += Double(product.quantity) * product.productPrice
        }
        return totalPrice
    }
    
    func removeProduct(at index: Int) {
        if groceriesList.indices.contains(index) {
            groceriesList.remove(at: index)
            objectWillChange.send()
        }
    }
    
    func removeAllProducts() {
        groceriesList.removeAll()
        objectWillChange.send()
    }
}



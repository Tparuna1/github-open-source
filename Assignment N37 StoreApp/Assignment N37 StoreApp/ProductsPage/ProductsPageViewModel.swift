//
//  ProductsPageViewModel.swift
//  Assignment N37 StoreApp
//
//  Created by tornike <parunashvili on 18.12.23.
//

import Foundation
import SwiftUI
import NetworkService


struct ProductsResponse: Decodable {
    let products: [Products]
}

class ProductsViewModel: ObservableObject {
    
    @Published var products: [Products] = []
    @Published var balance: Double = 5000
    @Published var showAlert: Bool = false
    @Published var categories: [Category] = []
    
    var balanceFormatted: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter.string(from: NSNumber(value: balance)) ?? "$0.00"
    }
    
    var cartTotalPrice: Double {
        return CartManager.shared.cartItems.reduce(0) { $0 + Double($1.price) }
    }
    
    func totalPriceOfPickedProducts() -> Double {
        var totalPrice = 0.0
        for product in CartManager.shared.cartItems {
            totalPrice += Double(product.price)
        }
        return totalPrice
    }
    
    var cartItemCount: Int {
        return CartManager.shared.cartItems.count
    }
    
    func addToCart(_ product: Products) {
        guard product.stock > 0 else {
            return
        }
        
        let productPrice = Double(product.price)
        
        guard balance >= productPrice else {
            showAlert = true
            return
        }
        
        product.stock -= 1
        CartManager.shared.add(product)
        balance -= productPrice
    }
    
    func performCheckout() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showSuccessAlert()
        }
    }
    func showSuccessAlert() {
        
    }
    
    func fetchProducts() {
        let urlString = "https://dummyjson.com/products"
        
        NetworkService.fetchData(from: urlString) { (result: Result<ProductsResponse, Error>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.products = response.products
                    self.extractCategories()
                    print("XXX")
                }
            case .failure(let error):
                print("Failed to fetch products: \(error.localizedDescription)")
                if let dataError = error as? DecodingError {
                    print("Decoding Error: \(dataError)")
                }
            }
        }
    }
    
    func extractCategories() {
        let categorySet = Set(products.map { $0.category })
        categories = categorySet.map { Category(name: $0) }
        print("\(categories)")
    }
    
}

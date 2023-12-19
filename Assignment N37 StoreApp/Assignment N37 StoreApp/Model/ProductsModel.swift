//
//  ProductsModel.swift
//  Assignment N37 StoreApp
//
//  Created by tornike <parunashvili on 18.12.23.
//

import Foundation
import SwiftUI


class Products: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double?
    let rating: Double
    var stock: Int
    let brand: String
    var category: String
    let thumbnail: String
    let images: [String]

    enum CodingKeys: String, CodingKey {
        case id, title, description, price, stock, brand, category, thumbnail, images
        case discountPercentage = "discount_percentage"
        case rating
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.price = try container.decode(Int.self, forKey: .price)
        self.discountPercentage = try container.decodeIfPresent(Double.self, forKey: .discountPercentage)
        self.rating = try container.decode(Double.self, forKey: .rating)
        self.stock = try container.decode(Int.self, forKey: .stock)
        self.brand = try container.decode(String.self, forKey: .brand)
        self.category = try container.decode(String.self, forKey: .category)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
        self.images = try container.decode([String].self, forKey: .images)
    }
}

class CartManager {
    static let shared = CartManager()
    
    private init() {}
    
    var cartItems: [Products] = []
    
    func add(_ product: Products) {
        cartItems.append(product)
    }
}


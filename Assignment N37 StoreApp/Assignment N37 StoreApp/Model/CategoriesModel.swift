//
//  CategoriesModel.swift
//  Assignment N37 StoreApp
//
//  Created by tornike <parunashvili on 19.12.23.
//

import Foundation

struct Category: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

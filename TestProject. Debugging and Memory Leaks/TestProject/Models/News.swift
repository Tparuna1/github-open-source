//
//  News.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import Foundation

// Decodable უნდა იყოს News
struct News: Decodable {
    let author: String?  // authors არა. ჯეისონს არ ემთხვევა
    let title: String?
    let urlToImage: String?
}

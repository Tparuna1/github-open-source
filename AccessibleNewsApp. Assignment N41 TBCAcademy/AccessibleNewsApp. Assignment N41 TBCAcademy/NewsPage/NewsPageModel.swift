//
//  NewsPageModel.swift
//  AccessibleNewsApp. Assignment N41 TBCAcademy
//
//  Created by tornike <parunashvili on 27.12.23.
//

import Foundation

// MARK: - NewsModel

struct NewsModel: Codable {
    let data: [Article]
}

// MARK: - Article

struct Article: Codable {
    let uuid: String
    let title: String
    let description: String
    let url: String
    let imageUrl: String
    let categories: [String]
}

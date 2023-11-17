//
//  Model.swift
//  Assignment N22 TBC Academy NetworkCalls
//
//  Created by tornike <parunashvili on 17.11.23.
//

import Foundation

struct ResultsList: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let title: String
    let posterPath: String
    let overview: String
    let voteAverage: Double
    let originalLanguage: String
    let originalTitle: String
}

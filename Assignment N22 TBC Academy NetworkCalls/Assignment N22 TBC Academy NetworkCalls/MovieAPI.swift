//
//  Movie.swift
//  Assignment N22 TBC Academy NetworkCalls
//
//  Created by tornike <parunashvili on 10.11.23.
//


import UIKit

struct resultsList: Codable {
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

let apiKey = ""

func fetchMoviesFromAPI() async throws -> [Movie] {
    let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
    let url = URL(string: urlString)!
    
    let (data, _) = try await URLSession.shared.data(from: url)
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    do {
        let decoded = try decoder.decode(resultsList.self, from: data)
        return decoded.results
    } catch {
        throw error
    }
}


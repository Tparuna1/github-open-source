//
//  ViewControllerViewModel.swift
//  Assignment N22 TBC Academy NetworkCalls
//
//  Created by tornike <parunashvili on 17.11.23.
//

import Foundation

class MovieViewModel {
    func fetchMoviesFromAPI(completion: @escaping (Result<[Movie], Error>) -> Void) {
        MovieService.fetchMovies(completion: completion)
    }
}

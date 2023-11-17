//
//  MovieDetailsViewModel.swift
//  Assignment N22 TBC Academy NetworkCalls
//
//  Created by tornike <parunashvili on 17.11.23.
//

import Foundation
import UIKit

class MovieDetailsViewModel {
    var movieDetailed: MovieDetailed?

    init(movie: Movie, image: UIImage?) {
        self.movieDetailed = MovieDetailed(title: movie.title, overview: movie.overview, movieImage: image)
    }
}









//
//  CatBreedsViewModel.swift
//  Assignment N26 TBC Academy Modularity
//
//  Created by tornike <parunashvili on 20.11.23.
//

import Foundation
import NetworkService

class CatBreedsViewModel {
    var catBreeds: [CatBreed] = []
    var onUpdate: (() -> Void)?
    
    func viewDidLoad() {
        fetchCatBreeds()
    }

    private func fetchCatBreeds() {
        let catBreedURLString = "https://catfact.ninja/breeds?limit=5"

        NetworkService.fetchData(from: catBreedURLString) { [weak self] (result: Result<CatBreedResponse, Error>) in
            switch result {
            case .success(let response):
                self?.catBreeds = response.data
                self?.onUpdate?()
            case .failure(let error):
                print("Failed to fetch cat breeds: \(error.localizedDescription)")
            }
        }
    }
}

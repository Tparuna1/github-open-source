//
//  MainPageViewModel.swift
//  Assignment N26 TBC Academy Modularity
//
//  Created by tornike <parunashvili on 19.11.23.
//

import Foundation
import NetworkService

final class CatFactsViewModel {
    var catFacts: [CatFact] = []
    var onUpdate: (() -> Void)?
    
    func fetchCatFacts() {
        let catFactURLString = "https://catfact.ninja/facts?limit=5"
        
        NetworkService.fetchData(from: catFactURLString) { [weak self] (result: Result<CatFactResponse, Error>) in
            switch result {
            case .success(let response):
                self?.catFacts = response.data
                self?.onUpdate?()
            case .failure(let error):
                print("Failed to fetch cat facts: \(error.localizedDescription)")
            }
        }
    }
}


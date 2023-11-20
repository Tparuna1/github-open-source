//
//  CatBreedsModel.swift
//  Assignment N26 TBC Academy Modularity
//
//  Created by tornike <parunashvili on 20.11.23.
//

import Foundation

//MARK: - CatBreedsModel

struct CatBreed: Decodable {
    let breed: String
}
struct CatBreedResponse: Decodable {
    let data: [CatBreed]
}

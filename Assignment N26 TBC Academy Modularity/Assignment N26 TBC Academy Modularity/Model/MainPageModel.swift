//
//  MainPageModel.swift
//  Assignment N26 TBC Academy Modularity
//
//  Created by tornike <parunashvili on 19.11.23.
//

import Foundation

//MARK: - MainPageModel

struct CatFact: Decodable {
    let fact: String
}

struct CatFactResponse: Decodable {
    let data: [CatFact]
}

//
//  Artwork.swift
//  Assignment N38 TBC Academy GestureActions
//
//  Created by Nana Jimsheleishvili on 29.12.23.
//

import Foundation

enum Artwork: CaseIterable {
    case gogh, guernica, pirosmani, michelangelo, theScream, wanderer
    
    var imageName: String {
        switch self {
        case .gogh: return "Gogh"
        case .guernica: return "guernica"
        case .pirosmani: return "Pirosmani"
        case .michelangelo: return "Michelangelo"
        case .theScream: return "TheScream"
        case .wanderer: return "Wanderer"
        }
    }
}

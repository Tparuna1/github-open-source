//
//  DailyNewsModel.swift
//  Daily Journal App , Assignment N37 TBC Academy
//
//  Created by tornike <parunashvili on 20.12.23.
//

import SwiftUI

struct JournalEntry: Identifiable {
    
    let id = UUID()
    var title: String
    var text: String
    var date: Date
    var isFavorite: Bool = false

}


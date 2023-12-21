//
//  DailyNewsSceneViewModel.swift
//  Daily Journal App , Assignment N37 TBC Academy
//
//  Created by tornike <parunashvili on 20.12.23.
//

import SwiftUI


class JournalViewModel: ObservableObject {
    
    @Published var entries: [JournalEntry] = []
    
    func addEntry(title: String, text: String) {
        let entry = JournalEntry(title: title, text: text, date: Date())
        entries.append(entry)
    }
    
    func removeArticle(at index: IndexSet) {
        entries.remove(atOffsets: index)
    }
    
    func moveArticles(fsafsf: IndexSet, toOffset: Int) {
        entries.move(fromOffsets: fsafsf, toOffset: toOffset)
    }
    func toggleFavorite(for entry: JournalEntry) {
        if let index = entries.firstIndex(where: { $0.id == entry.id }) {
            entries[index].isFavorite.toggle()
        }
    }
}



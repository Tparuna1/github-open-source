//
//  DailyNewsScene.swift
//  Daily Journal App , Assignment N37 TBC Academy
//
//  Created by tornike <parunashvili on 20.12.23.
//

import SwiftUI

struct DailyNewsScene: View {
    @EnvironmentObject var journalViewModel: JournalViewModel

    @State private var isAddArticleViewPresented = false
    
    var body: some View {
        NavigationStack {
            Section(header: Text("Articles")) {
                List {
                    ForEach(journalViewModel.entries) { entry in
                        VStack(alignment: .leading) {
                            Text(entry.title)
                                .font(.headline)
                            Text(entry.text)
                                .font(.body)
                            
                            HStack {
                                Text(entry.date, style: .date)
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                Spacer()
                                Button(action: {
                                    journalViewModel.toggleFavorite(for: entry)
                                }) {
                                    Image(systemName: entry.isFavorite ? "star.fill" : "star")
                                        .foregroundColor(entry.isFavorite ? .yellow : .gray)
                                }
                            }
                        }
                    }
                    .onDelete(perform: journalViewModel.removeArticle)
                    .onMove(perform: journalViewModel.moveArticles)
                    
                }
                .overlay(Group{
                    if journalViewModel.entries.isEmpty{
                        NavigationLink(destination: AddArticleView(journalViewModel: journalViewModel)) {
                            Text("დაწერ რამეს?!")
                        }
                    }
                })
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AddArticleView(journalViewModel: journalViewModel)) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
}








#Preview {
    DailyNewsScene()
}

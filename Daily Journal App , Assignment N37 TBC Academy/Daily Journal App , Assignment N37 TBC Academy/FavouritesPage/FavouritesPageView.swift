//
//  FavouritesPageView.swift
//  Daily Journal App , Assignment N37 TBC Academy
//
//  Created by tornike <parunashvili on 20.12.23.
//

import SwiftUI


struct FavoritesPage: View {
    @EnvironmentObject var viewModel: JournalViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.entries.filter { $0.isFavorite }) { entry in
                    VStack(alignment: .leading) {
                        Text(entry.title)
                            .font(.headline)
                        Text(entry.text)
                            .font(.body)
                        Text(entry.date, style: .date)
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}


//
//  TabView.swift
//  Daily Journal App , Assignment N37 TBC Academy
//
//  Created by tornike <parunashvili on 20.12.23.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = JournalViewModel()


    var body: some View {
        TabView {
            DailyNewsScene()
                .tabItem {
                    Image(systemName: "doc.plaintext.fill")
                    Text("News")
                }
            FavoritesPage()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favourites")
                }
        }
        .environmentObject(viewModel)
    }
}





#Preview {
    ContentView()
}


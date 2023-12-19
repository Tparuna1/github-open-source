//
//  ButtonViews.swift
//  Assignment N34 TravelApp
//
//  Created by tornike <parunashvili on 14.12.23.
//

import SwiftUI

// MARK: - HomePage Navigating Button

struct MainPageButton: View {
    let destination: Destination
    @Binding var path: NavigationPath

    
    var body: some View {
        NavigationLink(destination: ContentView()) {
            Button("Main Page") {
                path = NavigationPath()
            }
            .padding()
            .background(Color.cyan)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity)
    }
}


    



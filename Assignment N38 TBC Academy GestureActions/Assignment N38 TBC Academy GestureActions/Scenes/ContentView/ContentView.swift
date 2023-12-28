//
//  ContentView.swift
//  Assignment N38 TBC Academy GestureActions
//
//  Created by tornike <parunashvili on 22.12.23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @StateObject private var viewModel = ContentViewModel()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            ScrollView {
                VStack {
                    Text("Synesthesia")
                        .font(.title)
                        .foregroundColor(.cyan)
                        .padding()
                    
                    ForEach(Artwork.allCases, id: \.self) { artwork in
                        styledImage(artwork.imageName)
                            .applyGesture(artwork, using: viewModel)
                    }
                }
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Oops"),
                message: Text("Stop trying to find some actions here. It's just Giorgi searching for Lobiani"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    // MARK: - Method
    func styledImage(_ imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: 300, maxHeight: 150)
            .cornerRadius(8)
    }
}

#Preview {
    ContentView()
}

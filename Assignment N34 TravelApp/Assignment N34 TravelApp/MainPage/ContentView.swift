//
//  ContentView.swift
//  Assignment N34 TravelApp
//
//  Created by tornike <parunashvili on 14.12.23.
//

import SwiftUI

//MARK: - MainPage View

struct ContentView: View {
    
    let destinations: [Destination] = DestinationService.getMockDestinations()
    @State private var path = NavigationPath()
    @State private var showAlert = false
    
    var body: some View {
        
        NavigationStack (path: $path) {
            List(destinations, id: \.self) { destination in
                NavigationLink(value: destination) {
                    ZStack(alignment: .bottomLeading) {
                        Image(destination.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: 150)
                            .cornerRadius(8)
                        
                        Text(destination.name)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(8)
                            .offset(x: 8, y: -8)
                        
                        
                    }
                    .padding(.vertical, 5)
                }
                .buttonStyle(PlainButtonStyle())
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Destinations")
            .navigationDestination(for: Destination.self) { destination in
                DetailsPageView(destination: destination, path: $path)
            }
            RandomTipButton(showAlert: $showAlert)
                .alert(isPresented: $showAlert) {
                    TravelAlerts.randomAlert()
            }
        }
    }
}

// MARK: - RandomTipButton
struct RandomTipButton: View {
    @Binding var showAlert: Bool
    
    var body: some View {
        Button(action: {
            showAlert = true
        }) {
            Text("Travel Tips")
                .padding()
                .background(Color.cyan)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .padding()
    }
}


#Preview {
    ContentView()
}





//
//  HotelsPageView.swift
//  Assignment N34 TravelApp
//
//  Created by tornike <parunashvili on 14.12.23.
//

import SwiftUI

//MARK: - Hotels Page View

struct HotelsPageView: View {
    
    var destination: Destination
    @Binding var path: NavigationPath

    
    var body: some View {
        VStack {
            List(destination.hotelInfo, id: \.self) { info in
                VStack(alignment: .leading) {
                    Text(info.name)
                        .font(.headline)
                    Text(info.description)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 8)
            }
            .listStyle(.plain)
            .padding()
            .navigationTitle("Places For Accommodation")
            
            MainPageButton(destination: destination, path: $path)
            .padding()
        }
    }
}


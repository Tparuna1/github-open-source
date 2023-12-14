//
//  DetailsPageView.swift
//  Assignment N34 TravelApp
//
//  Created by tornike <parunashvili on 14.12.23.
//

import SwiftUI

//MARK: - Details Page View

struct DetailsPageView: View {
    var destination: Destination
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Image(destination.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 200)
            
            Text(destination.name)
                .font(.headline)
                .padding()
            
            Text(destination.description)
            
            HStack {
                TransportButtonView(destination: destination, path: $path)
                MustSeeButtonView(destination: destination, path: $path)
                HotelsButtonView(destination: destination, path: $path)
            }
        }
        Spacer()
    }
}


// MARK: - DetailsPage ButtonViews

struct TransportButtonView: View {
    let destination: Destination
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink(destination: TransporPageView(destination: destination, path: $path)) {
            Text("Transport")
                .padding()
                .background(Color.cyan)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .frame(maxWidth: .infinity)
    }
}

struct MustSeeButtonView: View {
    let destination: Destination
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink(destination: MustSeeView(destination: destination, path: $path)) {
            Text("Must See")
                .padding()
                .background(Color.cyan)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .frame(maxWidth: .infinity)

    }
}

struct HotelsButtonView: View {
    let destination: Destination
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink(destination: HotelsPageView(destination: destination, path: $path)) {
            Text("Hotels")
                .padding()
                .background(Color.cyan)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .frame(maxWidth: .infinity)
    }
}


//
//  ImageConfig.swift
//  Assignment N37 StoreApp
//
//  Created by tornike <parunashvili on 18.12.23.
//

import SwiftUI
import Foundation
import UIKit

struct RemoteImage: View {
    @StateObject private var imageLoader: ImageLoader
    private let placeholder: Image
    
    init(url: String, placeholder: Image = Image(systemName: "photo")) {
        self._imageLoader = StateObject(wrappedValue: ImageLoader(urlString: url))
        self.placeholder = placeholder
    }
    
    var body: some View {
        if let image = imageLoader.image {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)

        } else {
            placeholder
                .resizable()
                .aspectRatio(contentMode: .fit)

        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: Image?
    
    init(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = Image(uiImage: uiImage)
                }
            }
        }.resume()
    }
}

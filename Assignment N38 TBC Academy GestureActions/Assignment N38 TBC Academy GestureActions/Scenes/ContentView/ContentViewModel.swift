//
//  ContentViewModel.swift
//  Assignment N38 TBC Academy GestureActions
//
//  Created by Nana Jimsheleishvili on 29.12.23.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    // MARK: - Properties
    @Published var offsetSize = CGSize.zero
    @Published var zoomScale = 1.0
    @Published var position = Angle(degrees: 0)
    @Published var scale = 1.0
    @Published var isShaking = false
    @Published var showAlert = false
    
    // MARK: - Methods
    func handleTapGesture() {
        withAnimation {
            scale *= 0.9
            isShaking = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation {
                self.isShaking = false
            }
        }
    }
    
    func resetRotationOnEnd(_ angle: Angle) {
        withAnimation {
            position = Angle(degrees: 0)
        }
    }
    
    func playSoundOnLongPress() {
        AudioPlayer.playSound(fileName: "Goat", fileExtension: "mp3")
    }
}

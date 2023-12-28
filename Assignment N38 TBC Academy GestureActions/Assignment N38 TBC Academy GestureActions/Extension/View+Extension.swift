//
//  View+Extension.swift
//  Assignment N38 TBC Academy GestureActions
//
//  Created by Nana Jimsheleishvili on 29.12.23.
//

import SwiftUI

extension View {
    func applyGesture(_ artwork: Artwork, using viewModel: ContentViewModel) -> some View {
        switch artwork {
        case .gogh:
            return self.scaleEffect(viewModel.scale)
                .rotationEffect(viewModel.isShaking ? Angle(degrees: 5) : .zero)
                .onTapGesture { viewModel.handleTapGesture() }
                .eraseToAnyView()
        case .guernica:
            return self.offset(viewModel.offsetSize)
                .gesture(
                    DragGesture()
                        .onChanged { viewModel.offsetSize = $0.translation }
                )
                .eraseToAnyView()
        case .pirosmani:
            return self.scaleEffect(viewModel.zoomScale)
                .gesture(
                    MagnificationGesture()
                        .onChanged { amount in
                            viewModel.zoomScale = amount.magnitude
                        }
                )
                .eraseToAnyView()
        case .michelangelo:
            return self.rotationEffect(viewModel.position)
                .gesture(
                    RotationGesture()
                        .onChanged { angle in
                            viewModel.position = angle
                        }
                        .onEnded { angle in
                            viewModel.resetRotationOnEnd(angle)
                        }
                )
                .eraseToAnyView()
        case .theScream:
            return self.onLongPressGesture(minimumDuration: 3) {
                viewModel.playSoundOnLongPress()
            }
            .eraseToAnyView()
        case .wanderer:
            return self.onTapGesture {
                viewModel.showAlert = true
            }
            .eraseToAnyView()
        }
    }
}

// MARK: - AnyView Eraser
extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}

//
//  ITAcademyAnimationView.swift
//  XmasTreeAnimation
//
//  Created by tornike <parunashvili on 23.12.23.
//

import SwiftUI

struct ITAcademyAnimationView: View {
    @State private var scale: CGFloat = 1.0
    @State private var yOffset: CGFloat = 0.0
    
    var body: some View {
        
        ZStack {
            Text("TBC iOS Academy")
                .font(.system(size: 30, weight: .bold, design: .default))
                .foregroundColor(.clear)
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .mask(Text("TBC iOS Academy")
                                .font(.system(size: 15, weight: .bold, design: .default))
                                .scaleEffect(scale)
                        )
                )
                .scaleEffect(scale)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                        scale = 1.5
                        yOffset = -30

                    }
                }
                .offset(x: 0, y: yOffset)
        }
    }
}
#Preview {
    ITAcademyAnimationView()
}

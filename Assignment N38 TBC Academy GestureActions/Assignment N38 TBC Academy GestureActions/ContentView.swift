//
//  ContentView.swift
//  Assignment N38 TBC Academy GestureActions
//
//  Created by tornike <parunashvili on 22.12.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var offsetSize = CGSize.zero
    @State private var zoomScale = 1.0
    @State private var position: Angle = Angle(degrees: 0)
    @State private var scale = 1.0
    @State private var isShaking = false
    @State private var showAlert = false
    
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            ScrollView{
                VStack {
                    Text("Synesthesia")
                        .font(.title)
                        .foregroundColor(.cyan)
                        .padding()
                    
                    styledImage("Gogh")
                        .scaleEffect(scale)
                        .rotationEffect(isShaking ? Angle(degrees: 5) : .zero)
                        .onTapGesture(count: 1) {
                            print("1 tap")
                            withAnimation {
                                scale = scale * 0.9
                                isShaking = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation {
                                    isShaking = false
                                }
                            }
                        }
                    
                    styledImage("guernica")
                        .offset(offsetSize)
                        .gesture(
                            DragGesture()
                                .onChanged { offsetSize = $0.translation }
                        )
                    
                    styledImage("Pirosmani")
                        .scaleEffect(zoomScale)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { amount in
                                    zoomScale = amount.magnitude
                                }
                        )
                    
                    styledImage("Michelangelo")
                        .rotationEffect(position)
                        .gesture(
                            RotationGesture()
                                .onChanged({ angle in
                                    position = angle
                                })
                                .onEnded({ angle in
                                    withAnimation {
                                        position = Angle(degrees: 0)
                                    }
                                })
                        )
                    
                    styledImage("TheScream")
                        .onLongPressGesture(minimumDuration: 3) {
                            AudioPlayer.playSound(fileName: "Goat", fileExtension: "mp3")
                        }
                    
                    styledImage("Wanderer")
                        .onTapGesture {
                            showAlert = true
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Oops"),
                                message: Text("Stop trying to find some actions here. It's just Giorgi searching for Lobiani"),
                                dismissButton: .default(Text("OK"))

                            )
                        }
                }
            }
        }
    }
    
    func styledImage(_ imageName: String) -> some View {
        return Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: 300, maxHeight: 150)
            .cornerRadius(8)
    }
    
}

#Preview {
    ContentView()
}

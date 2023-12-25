//
//  Snow.swift
//  XmasTreeAnimation
//
//  Created by tornike <parunashvili on 23.12.23.
//


import SwiftUI

struct SnowfallView: View {
    @Binding var snowflakes: [Snowflake]
    
    var body: some View {
        ZStack {
            ForEach(snowflakes.indices, id: \.self) { index in
                SnowflakeView(snowflake: $snowflakes[index])
                    .onAppear {
                        animateSnowflake(index)
                    }
            }
        }
    }
    
    func animateSnowflake(_ index: Int) {
        withAnimation(Animation.linear(duration: Double.random(in: 2...6)).repeatForever(autoreverses: false)) {
            snowflakes[index].y += 500
        }
    }
}

struct SnowflakeView: View {
    @Binding var snowflake: Snowflake
    
    var body: some View {
        Image(systemName: "snowflake")
            .resizable()
            .frame(width: 10, height: 10)
            .foregroundColor(.blue)
            .position(x: snowflake.x, y: snowflake.y)
    }
}

struct Snowflake {
    var x: Double
    var y: Double
}



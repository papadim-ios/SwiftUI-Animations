//
//  PulsatingCircle.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 08/12/2022.
//

import SwiftUI

struct PulsatingCircle: View {
    @State private var animationAmount = 1.0

    var body: some View {
        Button("Alert!") {
            // animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

struct PulsatingCircle_Previews: PreviewProvider {
    static var previews: some View {
        PulsatingCircle()
    }
}

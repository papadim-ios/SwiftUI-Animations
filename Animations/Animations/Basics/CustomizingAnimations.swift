//
//  CustomizingAnimations.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 08/12/2022.
//

import SwiftUI

struct CustomizingAnimations: View {
    @State private var animationAmount1 = 1.0
    @State private var animationAmount2 = 1.0
    @State private var animationAmount3 = 1.0
    @State private var animationAmount4 = 1.0
    @State private var animationAmount5 = 1.0

    var body: some View {
        Button("1") {
            animationAmount1 += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount1)
        .blur(radius: (animationAmount1 - 1) * 3)
        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount1)
        
        Button("2") {
            animationAmount2 += 1
        }
        .padding(50)
        .background(.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount2)
        .animation(.easeOut(duration: 2.0), value: animationAmount2)
        
        Button("3") {
            animationAmount3 += 1
        }
        .padding(50)
        .background(.green)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount3)
        .blur(radius: (animationAmount3 - 1) * 3)
        .animation(
            .easeInOut(duration: 2)
                .delay(1),
            value: animationAmount3
        )
        
        Button("4") {
            animationAmount4 += 1
        }
        .padding(50)
        .background(.orange)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount4)
        .blur(radius: (animationAmount4 - 1) * 3)
        .animation(
            .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true),    // We must be careful with repeat counts! (e.g. try 2 instead of 3)
            value: animationAmount4
        )
        
        Button("5") {
            animationAmount5 += 1
        }
        .padding(50)
        .background(.purple)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount5)
        .blur(radius: (animationAmount5 - 1) * 3)
        .animation(
            .easeInOut(duration: 1)
                .repeatForever(autoreverses: true),
//                .repeatForever(autoreverses: false),
            value: animationAmount5
        )
    }
}

struct CustomizingAnimations_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingAnimations()
    }
}

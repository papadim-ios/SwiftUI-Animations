//
//  SimpleAnimations.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 08/12/2022.
//

import SwiftUI

struct SimpleAnimations: View {
    @State private var animationAmount1 = 1.0
    @State private var animationAmount2 = 1.0
    @State private var animationAmount3 = 1.0
    @State private var animationAmount4 = 1.0

    var body: some View {
        Button("1") {
            animationAmount1 += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount1)
        .blur(radius: (animationAmount1 - 1) * 3)            // Because we want to be zero at first
        .animation(.default, value: animationAmount1)        // Implicit animation
        
        Button("2") {
            animationAmount2 += 1
        }
        .padding(50)
        .background(.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount2)
        .animation(.easeOut, value: animationAmount2)
    }
}

struct SimpleAnimations_Previews: PreviewProvider {
    static var previews: some View {
        SimpleAnimations()
    }
}

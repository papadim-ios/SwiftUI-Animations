//
//  SimpleAnimations.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 08/12/2022.
//

import SwiftUI

/*
    In SwiftUI, the simplest type of animation is an implicit one:
    We tell our views “if someone wants to animate you, here’s how you should respond”
 */
struct SimpleAnimations: View {
    @State private var animationAmount1 = 1.0
    @State private var animationAmount2 = 1.0

    // Implicit animations
    var body: some View {
        Button("1") {
            animationAmount1 += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount1)
//        .blur(radius: (animationAmount1 - 1) * 3)           // Because we want to be zero at first
        .animation(.default, value: animationAmount1)       // .default = “ease in, ease out”
        
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

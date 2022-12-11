//
//  ExplicitAnimations.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 09/12/2022.
//

import SwiftUI

// https://www.hackingwithswift.com/books/ios-swiftui/creating-explicit-animations

struct ExplicitAnimations: View {
    @State private var animationAmount = 0.0

    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ExplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimations()
    }
}

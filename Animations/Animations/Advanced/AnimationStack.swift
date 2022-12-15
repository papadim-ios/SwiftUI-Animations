//
//  AnimationStack.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 11/12/2022.
//

import SwiftUI

struct AnimationStack: View {
    @State private var enabled = false

    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(.default, value: enabled)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
    }
}

struct AnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        AnimationStack()
    }
}

/*
    The order of modifiers matters!
    You can attach the animation() modifier several times, and the order in which you use it matters.
 */

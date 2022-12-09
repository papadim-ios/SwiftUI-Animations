//
//  AnimatingBindings.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 09/12/2022.
//

import SwiftUI

struct AnimatingBindings: View {
    @State private var animationAmount = 1.0

    var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct AnimatingBindings_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingBindings()
    }
}

/*
    What’s actually happening here is that SwiftUI is examining the state of our view before the binding changes,
    examining the target state of our views after the binding changes, then applying an animation to get from point A to point B.
 
    This is why we can animate a Boolean changing: Swift isn’t somehow inventing new values between false and true,
    but just animating the view changes that occur as a result of the change.
 
    Tip: With this variant of the animation() modifier, we don’t need to specify which value we’re watching for changes.
    It’s literally attached to the value it should watch!

    These binding animations effectively turn the tables on implicit animations:
    Rather than setting the animation on a view and implicitly animating it with a state change,
    we now set nothing on the view and explicitly animate it with a state change. In the former,
    the state change has no idea it will trigger an animation, and in the latter the view has no idea it will be animated.
    Both work and both are important!
 */

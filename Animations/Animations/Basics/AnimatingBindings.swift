//
//  AnimatingBindings.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 09/12/2022.
//

import SwiftUI

struct AnimatingBindings: View {
    @State private var animationAmount = 1.0
    @State private var showingWelcome = false

    var body: some View {
        print(animationAmount)
        
        return VStack {
            // The stepper is bound to $animationAmount.animation(), which means SwiftUI will automatically animate its changes.
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
        
//        return VStack {
//            Toggle("Toggle label", isOn: $showingWelcome.animation())
//
//            if showingWelcome {
//                Text("Hello World")
//            }
//        }
    }
}

struct AnimatingBindings_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingBindings()
    }
}

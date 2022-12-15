//
//  CustomTransitions.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 11/12/2022.
//

import SwiftUI

// Building custom transitions using ViewModifier

struct CornerRotateModifier: ViewModifier {
    let amount: Double      // How much rotation should be applied
    let anchor: UnitPoint   // Where the rotation should take place

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped() // Means that when the view rotates the parts that are lying outside its natural rectangle don’t get drawn.
    }
}

// Wrap that in an extension to AnyTransition, making it rotate from -90 to 0 on its top leading corner
extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct CustomTransitions: View {
    @State private var isShowingRed = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

struct CustomTransitions_Previews: PreviewProvider {
    static var previews: some View {
        CustomTransitions()
    }
}

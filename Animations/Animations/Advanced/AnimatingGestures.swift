//
//  AnimatingGestures.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 11/12/2022.
//

import SwiftUI

struct AnimatingGestures: View {
    @State private var dragAmount = CGSize.zero
    
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }  // tells us how far it’s moved from the start point
                    .onEnded { _ in
                        withAnimation {                         // Explicit animation
                            dragAmount = .zero
                        }
                    }
            )
//            .animation(.spring(), value: dragAmount)            // Implicit animation
        
        // Drag gestures + offset + delay
        HStack(spacing: 0) {
            ForEach(0 ..< letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
            // Both of those closures are given a single parameter, which describes the drag operation.
            // Where it started, where it is currently, how far it moved
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

struct AnimatingGestures_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingGestures()
    }
}

//
//  AnimatingSimpleShapes.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 13/12/2022.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: Double

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }
}

struct AnimatingSimpleShapes: View {
    @State private var insetAmount = 50.0

    var body: some View {
        return Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    insetAmount = Double.random(in: 10...90)
                }
            }
    }
}

struct AnimatingSimpleShapes_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingSimpleShapes()
    }
}

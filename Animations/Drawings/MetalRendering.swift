//
//  MetalRendering.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 13/12/2022.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0 ..< steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
//                    .strokeBorder(
//                        LinearGradient(
//                            gradient: Gradient(colors: [color(for: value, brightness: 1), color(for: value, brightness: 0.5)]),
//                            startPoint: .top,
//                            endPoint: .bottom
//                        ),
//                        lineWidth: 2
//                    )
            }
        }
//        .drawingGroup()
    }

    /*
        To figure out the hue for a particular circle we can take our circle number (e.g. 25),
        divide that by how many circles there are (e.g. 100), then add our color cycle amount (e.g. 0.5).
        So, if we were circle 25 of 100 with a cycle amount of 0.5, our hue would be 0.75.
     */
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }
        
//        print("Value = \(value)")
//        print("Steps = \(steps)")
//        print("Amount = \(amount) \n")

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct MetalRendering: View {
    @State private var colorCycle = 0.0

    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)

            Slider(value: $colorCycle)
                .padding(.horizontal)
        }
    }
}

struct MetalRendering_Previews: PreviewProvider {
    static var previews: some View {
        MetalRendering()
    }
}

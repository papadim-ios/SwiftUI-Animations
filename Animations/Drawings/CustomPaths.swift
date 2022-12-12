//
//  CustomPaths.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 12/12/2022.
//

import SwiftUI

struct CustomPaths: View {
    var body: some View {
        Path { path in
            // Fixed paths!
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.closeSubpath()
        }
//        .fill(.blue)
//        .stroke(.blue, lineWidth: 10)
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))

    }
}

struct CustomPaths_Previews: PreviewProvider {
    static var previews: some View {
        CustomPaths()
    }
}

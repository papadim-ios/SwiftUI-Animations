//
//  PathsAndShapes.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 12/12/2022.
//

import SwiftUI

/*
    SwiftUI implements Shape as a protocol with a single required method:
    given the following rectangle, what path do you want to draw?
 
    This will still create and return a path just like using a raw path directly,
    but because we’re handed the size the shape will be used at we know exactly how big to draw our path.
    We no longer need to rely on fixed coordinates.
 */
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

/*
    - In SwiftUI 0 degrees is not straight upwards, but instead directly to the right.
 
    - Shapes measure their coordinates from the bottom-left corner rather than the top-left corner,
        which means SwiftUI goes the other way around from one angle to the other.
 */
struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    var insetAmount = 0.0

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()

        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.width / 2 - insetAmount,
                    startAngle: modifiedStart,
                    endAngle: modifiedEnd,
                    clockwise: !clockwise)

        return path
    }
}

struct PathsAndShapes: View {
    var body: some View {
        Path { path in
            // Fixed paths(using absolute coordinates)!
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.closeSubpath()
        }
//        .fill(.blue)
//        .stroke(.blue, lineWidth: 10)
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        
        Triangle()
//            .fill(.red)
            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
        
        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
            .stroke(.blue, lineWidth: 10)
            .frame(width: 300, height: 300)
    }
}

struct PathsAndShapes_Previews: PreviewProvider {
    static var previews: some View {
        PathsAndShapes()
    }
}

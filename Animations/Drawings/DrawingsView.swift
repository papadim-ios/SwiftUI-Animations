//
//  DrawingsView.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 12/12/2022.
//

import SwiftUI

struct DrawingsView: View {
    var body: some View {
        List {
            NavigationLink(destination: PathsAndShapes()) {
                ListContents(title: "Custom Paths", imageNumber: 1)
            }
            
            NavigationLink(destination: CGAffineTransformAndEvenOddFills()) {
                ListContents(title: "CGAffineTransform and Even-odd fills", imageNumber: 2)
            }
            
            NavigationLink(destination: MetalRendering()) {
                ListContents(title: "High performance rendering with Metal", imageNumber: 3)
            }
        }
        .navigationBarTitle("Animations")
    }
}

struct DrawingsView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingsView()
    }
}

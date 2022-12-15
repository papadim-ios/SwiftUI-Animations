//
//  AnimatingShapesView.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 15/12/2022.
//

import SwiftUI

struct AnimatingShapesView: View {
    var body: some View {
        List {
            NavigationLink(destination: AnimatingSimpleShapes()) {
                ListContents(title: "Animating Simple Shapes", imageNumber: 1)
            }
        }
        .navigationBarTitle("Animations")
    }
}

struct AnimatingShapesView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingShapesView()
    }
}

//
//  AnimationsView.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 12/12/2022.
//

import SwiftUI

struct AnimationsView: View {
    var body: some View {
        List {
            NavigationLink(destination: SimpleAnimations()) {
                ListContents(title: "Simple animations", imageNumber: 1)
            }
            
            NavigationLink(destination: CustomizingAnimations()) {
                ListContents(title: "Customizing animations", imageNumber: 2)
            }
            
            NavigationLink(destination: PulsatingCircle()) {
                ListContents(title: "Pulsating circle", imageNumber: 3)
            }
            
            NavigationLink(destination: AnimatingBindings()) {
                ListContents(title: "Animating Bindings", imageNumber: 4)
            }
            
            NavigationLink(destination: ExplicitAnimations()) {
                ListContents(title: "Explicit Animations", imageNumber: 5)
            }
            
            NavigationLink(destination: AnimationStack()) {
                ListContents(title: "Animation Stack", imageNumber: 6)
            }
            
            NavigationLink(destination: AnimatingGestures()) {
                ListContents(title: "Animating Gestures", imageNumber: 7)
            }
            
            NavigationLink(destination: ShowingHidingViews()) {
                ListContents(title: "Showing and Hiding Views", imageNumber: 8)
            }
            
            NavigationLink(destination: CustomTransitions()) {
                ListContents(title: "Custom transitions using ViewModifier", imageNumber: 9)
            }
        }
        .navigationBarTitle("Animations")
    }
}

struct AnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsView()
    }
}

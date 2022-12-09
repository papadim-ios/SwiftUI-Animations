//
//  ContentView.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 08/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
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
            }
            .navigationBarTitle("Animations")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListContents: View {
    let title: String
    let imageNumber: Int

    var body: some View {
        HStack {
            Image(systemName: "\(imageNumber).square")
                .padding()
                .font(.largeTitle)
            Text(title)
                .font(.headline)
        }
    }
}
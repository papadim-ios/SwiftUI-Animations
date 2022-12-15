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
                NavigationLink(destination: AnimationsView()) {
                    ListContents(title: "Animations", imageNumber: 1)
                }
                
                NavigationLink(destination: DrawingsView()) {
                    ListContents(title: "Drawings", imageNumber: 2)
                }
                
                NavigationLink(destination: AnimatingShapesView()) {
                    ListContents(title: "Animating Shapes", imageNumber: 3)
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

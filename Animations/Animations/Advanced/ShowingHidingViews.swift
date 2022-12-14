//
//  ShowingHidingViews.swift
//  Animations
//
//  Created by Dimitris Papaioannou on 11/12/2022.
//

import SwiftUI

struct ShowingHidingViews: View {
    @State private var isShowingRed = false

    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.scale)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct ShowingHidingViews_Previews: PreviewProvider {
    static var previews: some View {
        ShowingHidingViews()
    }
}

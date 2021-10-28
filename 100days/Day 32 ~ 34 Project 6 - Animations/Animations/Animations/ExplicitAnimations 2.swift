//
//  ExplicitAnimations.swift
//  Animations
//
//  Created by Ryan J. W. Kim on 2021/10/06.
//

import SwiftUI

struct ExplicitAnimations: View {
    // MARK: - Properties
    @State private var animationAmount3 = 0.0
    
    // MARK: - Body
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount3 += 360
            }
        } //: Button
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount3), axis: (x:0, y:1, z:0))
    }
}

struct ExplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimations()
    }
}

//
//  ImplicitAnimations.swift
//  Animations
//
//  Created by Ryan J. W. Kim on 2021/10/06.
//

import SwiftUI

struct ImplicitAnimations: View {
    // MARK: - Properties
    @State private var animationAmount: CGFloat = 1
    
    // MARK: - Body
    var body: some View {
        Button {
            self.animationAmount += 1
        } label: {
            Text("Tap Me")
        } //: Button
        .padding(50)
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default)
    }
}


// MARK: - Preview
struct ImplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimations()
            .previewDevice("iPhone 13")
    }
}

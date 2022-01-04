//
//  AnimationBindings.swift
//  Animations
//
//  Created by Ryan J. W. Kim on 2021/10/06.
//

import SwiftUI

struct AnimationBindings: View {
    // MARK: - Properties
    @State private var animationAmount2: CGFloat = 1
    
    
    // MARK: - Body
    var body: some View {
        print(animationAmount2)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount2.animation(
                .easeInOut(duration: 1).repeatCount(3, autoreverses:true)
            ), in: 1...10)
            
            Spacer()
            
            Button {
                self.animationAmount2 += 1
            } label: {
                Text("Tap me")
            } //: Button
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount2)

        }
    }
}
// MARK: - Preview
struct AnimationBindings_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBindings()
    }
}

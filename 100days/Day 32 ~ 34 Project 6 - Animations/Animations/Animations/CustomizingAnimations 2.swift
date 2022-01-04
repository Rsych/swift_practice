//
//  CustomizingAnimations.swift
//  Animations
//
//  Created by Ryan J. W. Kim on 2021/10/06.
//

import SwiftUI

struct CustomizingAnimations: View {
    // MARK: - Properties
    @State private var animationAmount: CGFloat = 1
    // MARK: - Body
    var body: some View {
        VStack {
            //            Button {
            //                self.animationAmount += 1
            //            } label: {
            //                Text("Tap me")
            //            } //: Button 1
            //            .padding(50)
            //            .background(Color.gray)
            //            .foregroundColor(.white)
            //            .clipShape(Circle())
            //            .scaleEffect(animationAmount)
            //            //        .animation(.interpolatingSpring(stiffness: 50, damping: 1))
            //            .animation(.easeInOut(duration: 2)
            //                        .delay(1)
            //                        .repeatCount(3, autoreverses: true)
            //        ) //: animation effect
            
            Button {
                self.animationAmount += 1
            } label: {
                Text("Tap me")
            } //: Button 2
            .padding(50)
            .background(Color.gray)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(Circle()
                        .stroke(Color.red)
                        .scaleEffect(animationAmount)
                        .opacity(Double(2 - animationAmount))
                        .animation(.easeInOut(duration: 1)
                                    .repeatForever(autoreverses: false)
                                  ) //: animation
            ) //: overlay
            .onAppear(perform: {
                self.animationAmount = 2
            })
        }
    }
}

struct CustomizingAnimations_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingAnimations()
    }
}

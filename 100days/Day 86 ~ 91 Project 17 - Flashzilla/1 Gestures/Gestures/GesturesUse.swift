//
//  GesturesUse.swift
//  GesturesHaptic
//
//  Created by Ryan J. W. Kim on 2021/11/07.
//

import SwiftUI

struct GesturesUse: View {
    // MARK: - Properties
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    
    @State private var currentAngle: Angle = .degrees(0)
    @State private var finalAngle: Angle = .degrees(0)
    // MARK: - body
    var body: some View {
        VStack {
            Text("Tap 2 times")
                .onTapGesture(count: 3) {
                    print("Pressed 3times")
                }
            
        Text("Long Press")
            .onLongPressGesture {
                print("Long pressed!")
            }
            
            Text("LongPressure 2")
                .onLongPressGesture(minimumDuration: 1, pressing: { inProgress in
                    print("In progress: \(inProgress)")
                }) {
                    print("Long pressed")
                }
            
            Text("Scale or rotate")
                

        } //: VStack
        .scaleEffect(finalAmount + currentAmount)
        
        .gesture(
            MagnificationGesture()
                .onChanged{ amount in
                    currentAmount = amount - 1
                }
                .onEnded{ amount in
                    finalAmount += currentAmount
                    currentAmount = 0
                }
        ) //: Scale gesture
        .rotationEffect(finalAngle + currentAngle)
        .gesture(
            RotationGesture()
                .onChanged{ angle in
                    currentAngle = angle
                }
                .onEnded{ angle in
                    finalAngle += currentAngle
                    currentAngle = .degrees(0)
                }
        ) //: rotation gesture
    }
}

struct GesturesUse_Previews: PreviewProvider {
    static var previews: some View {
        GesturesUse()
    }
}

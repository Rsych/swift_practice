//
//  DiableUserInteractAllowsHitTesting.swift
//  Haptics
//
//  Created by Ryan J. W. Kim on 2021/11/08.
//

import SwiftUI

struct DisableUserInteractAllowsHitTesting: View {
    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill()
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Rectangle tapped!")
//                }
//            Circle()
//                .fill(Color.red)
//                .frame(width: 300, height: 300)
//                .contentShape(Rectangle())
//                .onTapGesture {
//                    print("Circle tapped")
//                }
////                .allowsHitTesting(false)
//        }
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("Vstack tapped")
        }
    }
}

struct DisableUserInteractAllowsHitTesting_Previews: PreviewProvider {
    static var previews: some View {
        DisableUserInteractAllowsHitTesting()
    }
}

//
//  Gesturespriorities.swift
//  GesturesHaptic
//
//  Created by Ryan J. W. Kim on 2021/11/07.
//

import SwiftUI

struct Gesturespriorities: View {
    var body: some View {
        VStack {
            Text("Hello")
                .onTapGesture {
                    print("Text tapped")
                } //: tap
        }
//        .highPriorityGesture(
        .simultaneousGesture(
            TapGesture()
                .onEnded({ _ in
                    print("VStack Tapped")
                })
        )
        
        
    }
}

struct Gesturespriorities_Previews: PreviewProvider {
    static var previews: some View {
        Gesturespriorities()
    }
}

//
//  FooterView.swift
//  Touchdown
//
//  Created by Ryan J.W. Kim on 2021/09/17.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(spacing: 10, content: {
            Text("We offer the most cutting edge, comfortable, lightweight and durable football helmets in the market at affordable prices.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
            Image("logo-lineal")
                .renderingMode(.template)
                .foregroundColor(.gray)
                .layoutPriority(0)
            Text("Copyright © Ryan\nAll right reserved")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(1
                )
        }) //: VSTACK
        .padding()
        
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}

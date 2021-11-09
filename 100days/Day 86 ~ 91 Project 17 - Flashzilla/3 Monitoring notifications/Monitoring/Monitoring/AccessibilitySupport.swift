//
//  AccessibilitySupport.swift
//  Monitoring
//
//  Created by Ryan J. W. Kim on 2021/11/08.
//

import SwiftUI

struct AccessibilitySupport: View {
    // MARK: - Properties
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    // MARK: - Body
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? Color.black : .green)
        .foregroundColor(.white)
        .clipShape(Capsule())
    }
}

struct AccessibilitySupport_Previews: PreviewProvider {
    static var previews: some View {
        AccessibilitySupport()
    }
}

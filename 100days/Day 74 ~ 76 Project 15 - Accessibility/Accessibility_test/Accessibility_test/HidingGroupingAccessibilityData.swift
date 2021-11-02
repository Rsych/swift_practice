//
//  HidingGroupingAccessibilityData.swift
//  Accessibility_test
//
//  Created by Ryan J. W. Kim on 2021/11/02.
//

import SwiftUI

struct HidingGroupingAccessibilityData: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("Your score is 1000"))
    }
}

struct HidingGroupingAccessibilityData_Previews: PreviewProvider {
    static var previews: some View {
        HidingGroupingAccessibilityData()
    }
}

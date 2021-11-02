//
//  CenterModifier.swift
//  Africa
//
//  Created by Ryan J. W. Kim on 2021/09/16.
//

import SwiftUI

struct Centermodifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

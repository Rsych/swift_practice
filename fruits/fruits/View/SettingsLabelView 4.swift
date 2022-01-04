//
//  SettingsLabelView.swift
//  fruits
//
//  Created by Ryan J.W. Kim on 2021/09/09.
//  Copyright © 2021 Naolin.net. All rights reserved.
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK: - PROPERTIES
    
    var labelText: String
    var labelImage: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Text(labelText.uppercased()).fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

// MARK: - PREVIEW
struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Fruits", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  LabelsVoicdOver.swift
//  Accessibility_test
//
//  Created by Ryan J. W. Kim on 2021/11/02.
//

import SwiftUI

struct LabelsVoicdOver: View {
    // MARK: - Properties
    let pictures = ["ales-krivec-15949", "galina-n-189483", "kevin-horstmann-141705", "nicolas-tissot-335096"]
    
    let labels = ["Tulips", "Frozen tree buds", "Sunflowers", "Fireworks"]
    @State private var selectedPictures = Int.random(in: 0...3)
    // MARK: - Body
    var body: some View {
        Image(pictures[selectedPictures])
            .resizable()
            .scaledToFit()
            .accessibilityLabel(Text(labels[selectedPictures]))
            .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
            .onTapGesture {
                selectedPictures = Int.random(in: 0...3)
            }
    }
}

struct LabelsVoicdOver_Previews: PreviewProvider {
    static var previews: some View {
        LabelsVoicdOver()
    }
}

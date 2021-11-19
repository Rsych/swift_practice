//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Ryan J. W. Kim on 2021/11/17.
//

import SwiftUI

struct SkiDetailsView: View {
    // MARK: - Properties
    let resort: Resort
    
    // MARK: - Body
    var body: some View {
        Group {
            Text("Elevation: \(resort.elevation)m")
                .layoutPriority(1) //: to make sure text is displayed in a single line
            Spacer().frame(height: 0)
            Text("snow: \(resort.snowDepth)cm")
                .layoutPriority(1)
        } //: Vstack
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resort: Resort.example)
            .previewLayout(.sizeThatFits)
    }
}

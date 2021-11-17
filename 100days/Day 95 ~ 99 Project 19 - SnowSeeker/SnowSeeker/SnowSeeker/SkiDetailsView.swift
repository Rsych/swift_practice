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
        VStack {
            Text("Elevation: \(resort.elevation)m")
            Text("snow: \(resort.snowDepth)cm")
        } //: Vstack
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resort: Resort.example)
    }
}

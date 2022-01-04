//
//  AlignmentAndGuide.swift
//  LayoutAndGeometry
//
//  Created by Ryan J. W. Kim on 2021/11/12.
//

import SwiftUI

struct AlignmentAndGuide: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(0..<10) { position in
                Text("number \(position)")
                    .alignmentGuide(.leading) { _ in
                        CGFloat(position) * -10
                    } //: alignment guide
            } //: Loop
        } //: Vstack
        .background(Color.red)
        .frame(width: 400, height: 400)
        .background(Color.blue)
    } //: body
} //: contentview

struct AlignmentAndGuide_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentAndGuide()
    }
}

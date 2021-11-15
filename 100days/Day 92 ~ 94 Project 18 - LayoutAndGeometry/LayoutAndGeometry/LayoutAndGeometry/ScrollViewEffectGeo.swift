//
//  ScrollViewEffectGeo.swift
//  LayoutAndGeometry
//
//  Created by Ryan J. W. Kim on 2021/11/15.
//

import SwiftUI

struct ScrollViewEffectDNA: View {
    // MARK: - Properties
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    // MARK: - Body
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(width: fullView.size.width)
                            .background(colors[index % 7])
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    } //: Geo index
                    .frame(height: 40)
                } //: Loop text row
            } //: ScrollView in vertical
        } //: Geo fullView
    } //: body
} //: contentview

struct ScrollViewEffectDNA_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewEffectDNA()
    }
}

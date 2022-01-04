//
//  CoverFlowScrollView.swift
//  LayoutAndGeometry
//
//  Created by Ryan J. W. Kim on 2021/11/15.
//

import SwiftUI

struct CoverFlowScrollView: View {
    // MARK: - Properties
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            GeometryReader { fullView in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<50) { index in
                            GeometryReader { geo in
                                Rectangle()
                                    .fill(colors[index % 7])
                                    .frame(height: 150)
                                    .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).midX - fullView.size.width / 2) / 10), axis: (x: 0, y: 1, z: 0))
                            } //: Geo rectangle
                            .frame(width: 150)
                        } //: Loop rectangle
                    } //: Hstack
                    .padding(.horizontal, (fullView.size.width - 150) / 2)
                } //: ScrollView
            } //: Geo fullview
            .edgesIgnoringSafeArea(.all)
        } //: VStack
    } //: body
} //: contentview

struct CoverFlowScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CoverFlowScrollView()
    }
}

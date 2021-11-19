//
//  CustomAlignment.swift
//  LayoutAndGeometry
//
//  Created by Ryan J. W. Kim on 2021/11/12.
//

import SwiftUI

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
//    enum MidAccountAndName: AlignmentID { // usage same
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomAlignment: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@naolin")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                Image("example")
                    .resizable()
                    .frame(width: 64, height: 64)
            } //: VStack
            
            VStack {
                Text("Those two will be aligned no matter what")
                Text("Even you add more text")
                Text("Full name")
                Text("Ryan J. W. Kim")
                    .alignmentGuide(.midAccountAndName, computeValue: { d in
                        d[VerticalAlignment.center]
                    })
                    .font(.largeTitle)
            } //: VStack
        } //: HStack
    }
}

struct CustomAlignment_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlignment()
    }
}

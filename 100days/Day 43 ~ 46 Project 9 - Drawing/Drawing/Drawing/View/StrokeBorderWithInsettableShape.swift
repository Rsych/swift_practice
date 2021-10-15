//
//  StrokeBorderWithInsettableShape.swift
//  Drawing
//
//  Created by Ryan J.W. Kim on 2021/10/14.
//

import SwiftUI


struct StrokeBorderWithInsettableShape: View {
    var body: some View {
        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true, insetAmount: 10)
            .strokeBorder(.blue, lineWidth: 40)
    }
}

struct StrokeBorderWithInsettableShape_Previews: PreviewProvider {
    static var previews: some View {
        StrokeBorderWithInsettableShape()
    }
}

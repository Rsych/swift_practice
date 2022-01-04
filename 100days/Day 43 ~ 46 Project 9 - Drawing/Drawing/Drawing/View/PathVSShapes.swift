//
//  PathVSShapes.swift
//  Drawing
//
//  Created by Ryan J.W. Kim on 2021/10/14.
//

import SwiftUI

struct PathVSShapes: View {
    // MARK: - Properties
    
    
    // MARK: - Body
    var body: some View {
        VStack {
            Triangle()
                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 300, height: 300)
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(.blue, lineWidth: 10)
                .frame(width: 300, height: 300)
            
        } //: Vstack
    } //: Body
}

struct PathVSShapes_Previews: PreviewProvider {
    static var previews: some View {
        PathVSShapes()
    }
}

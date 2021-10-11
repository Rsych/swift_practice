//
//  ResizingGeometryReader.swift
//  Geo&Scroll&NavLink
//
//  Created by Ryan J. W. Kim on 2021/10/10.
//

import SwiftUI

struct ResizingGeometryReader: View {
    var body: some View {
        VStack{
            GeometryReader { geo in
            Image("example")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geo.size.width)
                
        } //: Vstack
        }
    }
}

struct ResizingGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        ResizingGeometryReader()
    }
}

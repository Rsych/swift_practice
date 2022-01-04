//
//  FramesAndCoordinates.swift
//  LayoutAndGeometry
//
//  Created by Ryan J. W. Kim on 2021/11/14.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(Color.green)
            Text("Bottom")
        } //: Vstack
    } //: body
} //: OuterView

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .position(x: geo.size.width / 2, y: geo.size.height / 2)
                
                    .background(Color.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                    } //: ontap
            } //: Geo
            .background(Color.orange)
            Text("Right")
        } //: Hstack
    } //: body
} //: InnerView

struct FramesAndCoordinates: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        OuterView()
            .background(Color.red)
            .coordinateSpace(name: "Custom")
    } //: body
} //: contentview

struct FramesAndCoordinates_Previews: PreviewProvider {
    static var previews: some View {
        FramesAndCoordinates()
    }
}

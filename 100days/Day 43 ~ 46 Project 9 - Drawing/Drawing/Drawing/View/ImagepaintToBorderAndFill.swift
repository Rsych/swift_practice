//
//  ImagepaintBorderAndFill.swift
//  Drawing
//
//  Created by Ryan J.W. Kim on 2021/10/15.
//

import SwiftUI

struct ImagepaintToBorderAndFill: View {
    var body: some View {
        VStack{
        Text("Background")
                .frame(width: 100, height: 100)
                .background(Color.red)
            Text("Border")
                .frame(width: 100, height: 100)
                .border(.red, width: 10)
            Text("BackgroundImage")
                .frame(width: 100, height: 100)
                .background(Image("Sample").resizable())
            Text("ImagePaint")
                .frame(width: 100, height: 100)
                .border(ImagePaint(image: Image("Sample"), scale: 0.2), width: 10)
            Text("ImagePaint with rect")
                .frame(width: 100, height: 100)
                .border(ImagePaint(image: Image("Sample"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 1), scale: 0.1), width: 10)
            Capsule()
                .strokeBorder(ImagePaint(image: Image("Sample"), scale: 0.1), lineWidth: 10)
                .frame(width: 300, height: 200)
    }
    }
}

struct ImagepaintToBorderAndFill_Previews: PreviewProvider {
    static var previews: some View {
        ImagepaintToBorderAndFill()
    }
}

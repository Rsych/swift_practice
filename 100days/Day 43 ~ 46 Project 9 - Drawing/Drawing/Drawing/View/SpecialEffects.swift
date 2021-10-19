//
//  SpecialEffects.swift
//  Drawing
//
//  Created by Ryan J.W. Kim on 2021/10/15.
//

//Special effects in SwiftUI: Blurs, Blending, and more
import SwiftUI

struct SpecialEffects: View {
    
    var body: some View {
        ScrollView{
            VStack{
                ZStack {
                    Image("Sample")
                        .resizable()
                        .scaledToFit()
                    
                    Rectangle()
                        .fill(Color.red)
                        .blendMode(.multiply)
                } //: Zstack
                .frame(width: 200, height: 300)
                .clipped()
                
                Image("Sample")
                    .colorMultiply(.red)
                
            }
        }
    }
}
struct SpecialEffects_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffects()
    }
}

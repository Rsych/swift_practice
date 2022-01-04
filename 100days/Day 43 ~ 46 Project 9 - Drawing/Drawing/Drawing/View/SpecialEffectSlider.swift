//
//  SpecialEffectSlider.swift
//  Drawing
//
//  Created by Ryan J.W. Kim on 2021/10/17.
//

import SwiftUI

struct SpecialEffectSlider: View {
    // MARK: - Properties
    @State private var amount: CGFloat = 0.0
    // MARK: - Body
    var body: some View {
        ScrollView{
            VStack {
                Image("Sample")
                    .resizable()
                    .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)
                
                Slider(value: $amount)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        VStack {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 350, height: 400)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}
}
struct SpecialEffectSlider_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffectSlider()
    }
}

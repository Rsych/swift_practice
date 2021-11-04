//
//  FruitNeutrientsView.swift
//  fruits
//
//  Created by Ryan J.W. Kim on 2021/09/07.
//  Copyright © 2021 Naolin.net. All rights reserved.
//

import SwiftUI

struct FruitNeutrientsView: View {
    // MARK: - PROPERTIES
    
    var fruit: Fruit
    let neutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    @State var isExpanded = false
    // MARK: - BODY
    var body: some View {
        
        GroupBox(){
            DisclosureGroup("Nutritional value per 100g", isExpanded: $isExpanded){
                ForEach(0..<neutrients.count, id: \.self) { item in
                    Divider().padding(.vertical,2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(neutrients[item])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(.system(.body).bold())
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            
        }//:BOX
    }
}
// MARK: - PREVIEW
struct FruitNeutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNeutrientsView(fruit: fruitsData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}

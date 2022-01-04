//
//  CateroryItemView.swift
//  Touchdown
//
//  Created by Ryan J. W. Kim on 2021/09/21.
//

import SwiftUI

struct CateroryItemView: View {
    // MARK: - property
    let category: Category
    
    // MARK: - body
    var body: some View {
        Button(action: {}, label: {
            HStack(alignment: .center, spacing: 6, content: {
                Image(category.image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.gray)
                
                Text(category.name.uppercased())
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                
                Spacer()
                
            }) //: HSTACK
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            )
        })//:Button
    }
}

// MARK: - preview
struct CateroryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CateroryItemView(category: categories[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}

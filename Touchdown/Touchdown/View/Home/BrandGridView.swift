//
//  BrandGridView.swift
//  Touchdown
//
//  Created by Ryan J. W. Kim on 2021/09/21.
//

import SwiftUI

struct BrandGridView: View {
    // MARK: - property
    
    // MARK: - body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                ForEach(brands) {brand in
                    BrandItemView(brand: brand)
                }
            }) //: GRID
            .frame(height:200)
            .padding(15)
        })
    }
}

// MARK: - preview
struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}

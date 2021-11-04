//
//  CategoryGridView.swift
//  Touchdown
//
//  Created by Ryan J. W. Kim on 2021/09/21.
//

import SwiftUI

struct CategoryGridView: View {
    // MARK: - property
    // MARK: - body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                Section(header: SectionView(rotateClockwise: false),
                        footer: SectionView(rotateClockwise: true)
                ) {
                    ForEach(categories) { category in
                        CateroryItemView(category: category)
                    }
                }
            }) //: GRID
            .frame(height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }) //: Scroll
    }
}
// MARK: - preview
struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}

//
//  TitleView.swift
//  Touchdown
//
//  Created by Ryan J. W. Kim on 2021/09/21.
//

import SwiftUI

struct TitleView: View {
    // MARK: - property
    var title: String
    // MARK: - body
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            Text("Helmet")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Spacer()
        }) //: Hstack
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
    }
}

// MARK: - preview
struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Helmet")
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
    
}

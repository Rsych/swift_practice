//
//  FeatureditemView.swift
//  Touchdown
//
//  Created by Ryan J. W. Kim on 2021/09/21.
//

import SwiftUI

struct FeatureditemView: View {
    // MARK: - property
    let player:Player
    
    
    // MARK: - body
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}


// MARK: - preview
struct FeatureditemView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureditemView(player: players[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}

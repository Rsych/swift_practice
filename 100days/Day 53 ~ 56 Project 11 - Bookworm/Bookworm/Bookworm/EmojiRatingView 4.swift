//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Ryan J. W. Kim on 2021/10/23.
//

import SwiftUI

struct EmojiRatingView: View {
    // MARK: - Properties
    let rating: Int16
    
    // MARK: - Body
    var body: some View {
        switch rating {
        case 1: return Text("😪")
        case 2: return Text("😧")
        case 3: return Text("🙂")
        case 4: return Text("😄")
        default: return Text("🥳")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}

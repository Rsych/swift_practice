//
//  ContentView.swift
//  memorize
//
//  Created by Ryan J. W. Kim on 2021/10/25.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @ObservedObject var GameVM: EmojiMemoryGame
    
    // MARK: - Body
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(GameVM.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                GameVM.choose(card)
                            }
                    } //: emoji loop
                } //: LazyVGrid
            } //: ScrollView
            .foregroundColor(.red)
        .padding(.horizontal)
    } //: Body
} //: Contentview

struct CardView: View {
    // MARK: - Properties
    let card: MemoryGame<String>.Card
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }//: ZStack
        
    }
} //: CardView Body


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(GameVM: game)
            .preferredColorScheme(.dark)
        
        ContentView(GameVM: game)
            .preferredColorScheme(.light)
    }
}

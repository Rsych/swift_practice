//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Ryan J. W. Kim on 2021/10/26.
//

import SwiftUI

//func makeCardContent(index: Int) -> String {
//    return "😀"
//}

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["✈️", "🚓", "🚁", "🚲", "🚌", "🚎", "🏎", "🛻", "🛵", "🏍",
                  "🛺", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃",
                  "🚋", "🚞", "🚄", "🚇", "🚊", "🚉", "🛫", "🛬", "🛩", "💺"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            emojis[pairIndex] }
    }
    
    
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.pick(card)
    }
}


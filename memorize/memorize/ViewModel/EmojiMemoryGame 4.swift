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

class EmojiMemoryGame {
    static let emojis = ["✈️", "🚓", "🚁", "🚲", "🚌", "🚎", "🏎", "🛻", "🛵", "🏍",
                  "🛺", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃",
                  "🚋", "🚞", "🚄", "🚇", "🚊", "🚉", "🛫", "🛬", "🛩", "💺"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex] }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}


//
//  MemoryGame.swift
//  memorize
//
//  Created by Ryan J. W. Kim on 2021/10/26.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func pick(card: Card) {
        
    } //: pick func
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent //"don't care type"
    } //: MemoryGame.Card nested struct
}

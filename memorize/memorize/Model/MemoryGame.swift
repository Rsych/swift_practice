//
//  MemoryGame.swift
//  memorize
//
//  Created by Ryan J. W. Kim on 2021/10/26.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    func pick(_ card: Card) {
        print("card chosen")
    } //: pick func
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent //"don't care type"
        
        var id: UUID = UUID()
    } //: MemoryGame.Card nested struct
}

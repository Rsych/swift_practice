//
//  Card.swift
//  FlashZilla
//
//  Created by Ryan J. W. Kim on 2021/11/09.
//

import Foundation

struct Card {
    let prompt: String
    var answer: String
    
    static var example: Card {
        Card(prompt: "Who played 13th doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}

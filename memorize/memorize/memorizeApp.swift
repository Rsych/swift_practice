//
//  memorizeApp.swift
//  memorize
//
//  Created by Ryan J. W. Kim on 2021/10/25.
//

import SwiftUI

@main
struct memorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(GameVM: game)
        }
    }
}

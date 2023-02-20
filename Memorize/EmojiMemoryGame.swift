//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by John Alban on 2/20/23.
//
//  This is the Model for a memory game using emojis
//

import SwiftUI


class EmojiMemoryGame {
    
    
    static let emojis = ["⚽️","🏀","🏈","⚾️","🥎","🏐","🏉","🥏","🏓","🥊","🎱","🏒"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
        
    }
    
    
    private(set) var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}

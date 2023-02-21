//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by John Alban on 2/20/23.
//
//  This is the ViewModel for a memory game using emojis
//

import SwiftUI


class EmojiMemoryGame {
    
    
    static let emojis = ["⚽️","🏀","🏈","⚾️","🥎","🏐","🏉","🥏","🏓","🥊","🎱","🏒"]
    
    //global func for creating memory game
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
        
    }
    
    
    private(set) var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
         model.cards
    }
    
    
    
    //MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

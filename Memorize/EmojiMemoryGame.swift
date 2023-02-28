//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by John Alban on 2/20/23.
//
//  This is the ViewModel for a memory game using emojis
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["⚽️","🏀","🏈","⚾️","🥎","🏐","🏉","🥏","🏓","🥊","🎱","🏒"]
    
    //global func for creating memory game
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
        
    }
    
    //published allows viewmodel to recognize changes being made
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<Card> {
         model.cards
    }
    
    //MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
}

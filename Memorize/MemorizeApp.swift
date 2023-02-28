//
//  MemorizeApp.swift
//  Memorize
//
//  Created by John Alban on 2/19/23.
//

import SwiftUI

;@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

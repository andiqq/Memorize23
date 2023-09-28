//
//  EmojiMemoryGame.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 26.08.23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            let usedEmojis = theme.emojis.shuffled()
            if usedEmojis.indices.contains(pairIndex) { return usedEmojis[pairIndex] }
            else { return "⁉️" }
        }
    }
    
    @Published private var model: MemoryGame<String>
        
    var cards: Array<MemoryGame<String>.Card> { model.cards }
    
    var theme: Theme
    
    init() {
        theme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    // MARK: - Intents
    
    func newGame() {
        theme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

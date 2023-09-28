//
//  EmojiMemoryGame.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 26.08.23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static func createMemoryGame(theme: Theme, usedEmojis: [String]) -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            if usedEmojis.indices.contains(pairIndex) { return usedEmojis[pairIndex] }
            else { return "⁉️" }
        }
    }
    
    @Published private var model: MemoryGame<String>
        
    var cards: Array<MemoryGame<String>.Card> { model.cards }
    
    var usedEmojis: [String]
    
    var theme: Theme
    
    init() {
        theme = themes.randomElement()!
        usedEmojis = theme.emojis.shuffled()
        model = EmojiMemoryGame.createMemoryGame(theme: theme, usedEmojis: usedEmojis)
    }
    
    // MARK: - Intents
    
    func newGame() {
        theme = themes.randomElement()!
        usedEmojis = theme.emojis.shuffled()
        model = EmojiMemoryGame.createMemoryGame(theme: theme, usedEmojis: usedEmojis)
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

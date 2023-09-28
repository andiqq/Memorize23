//
//  EmojiMemoryGame.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 26.08.23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let shuffledEmojis = theme.emojis.shuffled()
        return MemoryGame(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            if shuffledEmojis.indices.contains(pairIndex) { return shuffledEmojis.shuffled()[pairIndex] }
            else { return "⁉️" }
        }
    }
    
    @Published private var model: MemoryGame<String>
        
    var cards: Array<MemoryGame<String>.Card> { model.cards }
    
    var theme: Theme
    
    init() {
        theme = themes.randomElement() ?? themes[0]
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    // MARK: - Intents
    
    func newGame() {
        theme = themes.randomElement() ?? themes[0]
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

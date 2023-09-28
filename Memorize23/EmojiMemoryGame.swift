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
        
        var numberOfPairs = theme.numberOfPairs ?? Int.random(in: 2...theme.emojis.count)
        if numberOfPairs < 2 { numberOfPairs = theme.emojis.count }
        
        return MemoryGame(numberOfPairsOfCards: numberOfPairs <= shuffledEmojis.count ? numberOfPairs : shuffledEmojis.count) { pairIndex in
            if shuffledEmojis.indices.contains(pairIndex) { return shuffledEmojis[pairIndex] }
            else { return "⁉️" }
        }
    }
    
    @Published private var model: MemoryGame<String>
        
    var cards: Array<MemoryGame<String>.Card> { model.cards }
    
    var theme: Theme
    
    init() {
        repeat {
            theme = themes.randomElement()!
        } while theme.emojis.count < 2
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    // MARK: - Intents
    
    func newGame() {
        repeat {
            theme = themes.randomElement()!
        } while theme.emojis.count < 2
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

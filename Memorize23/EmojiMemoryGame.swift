//
//  EmojiMemoryGame.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 26.08.23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let numberOfPairs: Int
        let shuffledEmojis = theme.emojis.shuffled()
        if let getPairs = theme.numberOfPairs {
            numberOfPairs = getPairs >= 2 ? getPairs : theme.emojis.count
        } else {
            numberOfPairs = Int.random(in: 2...theme.emojis.count)
        }
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
            theme = themes.randomElement() ?? themes[0]
        } while theme.emojis.count < 2
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    // MARK: - Intents
    
    func newGame() {
        repeat {
            theme = themes.randomElement() ?? themes[0]
        } while theme.emojis.count < 2
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
        print(cards)
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

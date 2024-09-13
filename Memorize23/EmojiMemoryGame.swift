//
//  EmojiMemoryGame.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 26.08.23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    @Published private var model: MemoryGame<String>?
    
    var score: Int { model!.score }

    var cards: [MemoryGame<String>.Card] { model!.cards }

    var theme: Theme = Theme.selectedTheme.randomElement()!

    init() { newGame() }

    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {

        let shuffledEmojis = theme.emojis.shuffled()

        var numberOfPairs = theme.numberOfPairs ?? Int.random(in: 3...theme.emojis.count)
        if numberOfPairs > 8 { numberOfPairs = 8 }
        if numberOfPairs < 2 { numberOfPairs = theme.emojis.count }

        return MemoryGame(numberOfPairsOfCards: min(numberOfPairs, shuffledEmojis.count)) { pairIndex in
            shuffledEmojis.indices.contains(pairIndex) ? shuffledEmojis[pairIndex] : "⁉️"
        }
    }

    // MARK: - Intents

    func newGame() {
        repeat {
            theme = Theme.selectedTheme.randomElement()!
        } while theme.emojis.count < 2
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }

    func choose(_ card: MemoryGame<String>.Card) {
        model!.choose(card)
    }
}

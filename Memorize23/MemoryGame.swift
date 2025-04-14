//
//  MemoryGame.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 26.08.23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {

    private(set) var cards: [Card]

    var score = 0
    let penalty = 100
    var maxAward = 200
    var timer = TimeInterval(0)
    var adjust = 0.7
    var minAward = 20
    var decreasePerSecond = 20

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
        shuffle()
    }

    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }

    mutating func choose(_ card: Card) {
        if indexOfTheOneAndOnlyFaceUpCard == nil {
            timer = Date().timeIntervalSince1970
        }
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        timer -= Date().timeIntervalSince1970
                        score += max(maxAward + Int(timer + adjust) * decreasePerSecond, minAward)
                        print(timer, Int(timer))
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    } else {
                        if cards[chosenIndex].alreadyBeenSeen {
                            score -= penalty
                        }
                        if cards[potentialMatchIndex].alreadyBeenSeen {
                            score -= penalty
                        }
                        cards[chosenIndex].alreadyBeenSeen = true
                        cards[potentialMatchIndex].alreadyBeenSeen = true
                    }
                } else {
                    for index in cards.indices {
                        cards[index].isFaceUp = false
                    }
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }

    mutating func shuffle() {
        cards.shuffle()
    }

    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        var alreadyBeenSeen = false
        let content: CardContent

        var id: String
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down")\(isMatched ? " matched" : "")"
        }
    }
}

extension Array {
    var only: Element? { count == 1 ? first : nil }
}

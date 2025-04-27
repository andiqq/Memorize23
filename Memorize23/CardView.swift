//
//  CardView.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 20.04.25.
//

import SwiftUI

typealias Card = MemoryGame<String>.Card

struct CardView: View {
    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        TimelineView(.animation) { timeline in
            if card.isFaceUp || !card.isMatched {
                Pie(endAngle: .degrees(card.bonusPercentRemaining * 360))
                    .opacity(Constants.Pie.opacity)
                    .overlay(cardContents.padding(Constants.Pie.inset))
                    .padding(Constants.inset)
                    .cardify(isFaceUp: card.isFaceUp)
                    .transition(.scale)
            } else {
                Color.clear
            }
        }
    }
    
    var cardContents: some View {
        Text(card.content)
            .font(.system(size: Constants.FontSize.largest))
            .minimumScaleFactor(Constants.FontSize.scaleFactor)
            .aspectRatio(1, contentMode: .fit)
            .multilineTextAlignment(.center)
            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
            .animation(.spin(duration: 1), value: card.isMatched)
    }
    
    private struct Constants {
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: 1).repeatForever(autoreverses: false)
    }
}

#Preview {
    VStack {
        HStack {
            CardView(Card(content: "X",id: "test1"))
            CardView(Card(isFaceUp: true, content: "X",id: "test1"))
                .aspectRatio(4/3, contentMode: .fit)
        }
        HStack {
            CardView(Card(isMatched: true, content: "X",id: "test1"))
            CardView(Card(isFaceUp: true, isMatched: true, content: "This is a longer string that should fit",id: "test1"))
        }
    }
    .padding()
    .foregroundColor(.green)
}




//
//  CardView.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 10.09.24.
//

import SwiftUI

struct CardView: View {

    private let card: MemoryGame<String>.Card

    private let colors: [Color]

    init(_ card: MemoryGame<String>.Card, colors: String) {
        self.card = card
        self.colors = Theme.getColors(themeColor: colors)
    }

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(Gradient(colors: colors), lineWidth: 2)

                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)

            base.fill(Gradient(colors: colors))
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

//
//  EmojiMemoryGameView.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 19.08.23.
//
//  This is the Memorize game as demonstrated in the CS193P lectures of Spring 2023
//  (see https://cs193p.sites.stanford.edu )
//
//  NOTE: other than in the lecture, Xcode 15 beta / Swift 5.8 / iOS 17.0 beta was used here
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(viewModel.theme.name)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(getColors(themeColor: viewModel.theme.color)[0])
                
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("New Game") { viewModel.newGame() }
                .padding(.bottom, -20.0)
                .padding(.top, 10)
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach (viewModel.cards) { card in
                CardView(card, colors: viewModel.theme.color)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(getColors(themeColor: viewModel.theme.color)[0])
    }
    
}

struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    let colors: [Color]
    
    init(_ card: MemoryGame<String>.Card, colors: String) {
        self.card = card
        self.colors = getColors(themeColor: colors)
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

func getColors(themeColor: String) -> [Color] {
    switch themeColor {
    case "yellow": return [.yellow, .orange]
    case "brown": return [.brown]
    case "pink": return [.pink, .orange]
    case "redblue": return [.red, .blue]
    case "orange": return [.orange]
    default: return [.purple, .black]
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

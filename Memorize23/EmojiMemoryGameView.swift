//
//  EmojiMemoryGameView.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 19.08.23.
//
//  This is the Memorize game as demonstrated in the CS193P lectures of Spring 2023
//  (see https://cs193p.sites.stanford.edu )
//
//  NOTE: other than in the lecture, Xcode 15 / Swift 5.9 / iOS 17 (or later) was used here 
//

import SwiftUI

struct EmojiMemoryGameView: View {

    @ObservedObject var viewModel = EmojiMemoryGame()

    var body: some View {

        Text(viewModel.theme.name)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(Theme.getColors(themeColor: viewModel.theme.color)[0])

        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {

            ForEach(viewModel.cards) { card in

                CardView(card, colors: viewModel.theme.color)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture { viewModel.choose(card) }
                    .padding(4)
            }
        }
        .animation(.default, value: viewModel.cards)
        
        Spacer()

        HStack {
            Button("New Game") { viewModel.newGame() }
                .padding(5)
            Spacer()
            Text("Score: \(viewModel.score)")
        }
        .padding(.horizontal)
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

//
//  Memorize23App.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 19.08.23.
//

import SwiftUI

@main
struct Memorize23App: App {
    
  @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

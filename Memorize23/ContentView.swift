//
//  ContentView.swift
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

struct ContentView: View {
    
    let emojis = ["👻", "🎃", "🕷️", "😈" ]
    
    var body: some View {
        HStack {
            ForEach (emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    
    let content: String
    
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture { isFaceUp.toggle() }
    }
}

#Preview {
    ContentView()
}

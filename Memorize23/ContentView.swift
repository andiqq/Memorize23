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
      
    struct theme {
        var symbols: [String]
        var color: Color
        var icon: String
        var textDescription: String
    }

    let animals = theme(
        symbols: ["🐌","🐞","🐳","🐅","🦣","🦧","🦏","🦒","🦘","🐄"],
        color: .brown,
        icon: "pawprint.fill",
        textDescription: "Animals")

    let sports = theme(
        symbols: ["⚽️","🥎","🏈","🏀","🏸","🥊","⛷️","🏋️‍♀️","🏄","🧗‍♂️","🚴"],
        color: .blue,
        icon: "sportscourt.fill",
        textDescription: "Sports")

    let food = theme(
        symbols: ["🍎","🍊","🥯","🥨","🍔","🌮","🥫","🧁","🍪","🍩","🍰","🍝","🌯"],
        color: .purple,
        icon: "fork.knife",
        textDescription: "Food")
    
    @State var symbols: [String] = []
    @State var themeColor: Color = .clear
    @State var numberOfCards: Int = 0
    
    var body: some View {
        VStack {
            title
            ScrollView { cards }
            Spacer()
            themeChosingButtons
        }
        .padding()
    }
    
    var title: some View {
        Text("Memorize !")
            .font(.largeTitle)
            .fontWeight(.heavy)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: CGFloat(320 / sqrt(Double(numberOfCards)*1.4+1))))]) {
            ForEach (0..<numberOfCards, id: \.self) { index in
                CardView(content: symbols[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(themeColor)
    }
    
    var themeChosingButtons: some View {
        HStack(alignment: .bottom) {
            themeChosingButton(theme: animals)
            Spacer()
            themeChosingButton(theme: sports)
            Spacer()
            themeChosingButton(theme: food)
        }
    }
    
    func themeChosingButton(theme: theme) -> some View {
        Button(
            action: {
                let numberOfPairs = Int.random(in: 2...theme.symbols.count)
                symbols = Array(theme.symbols.shuffled().prefix(numberOfPairs))
                symbols = (symbols + symbols).shuffled()
                themeColor = theme.color
                numberOfCards = symbols.count
            },
            label: {
                VStack {
                    Image(systemName: theme.icon)
                    Text(theme.textDescription).font(.subheadline)
                }
            } )
        .font(.largeTitle)
        .imageScale(.large)
        .foregroundColor(theme.color)
    }
}

struct CardView: View {
    
    let content: String
    
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture { isFaceUp.toggle() }
    }
}

#Preview {
    ContentView()
}

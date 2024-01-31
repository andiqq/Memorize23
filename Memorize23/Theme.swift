//
//  Theme.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 23.09.23.
//

import Foundation

struct Theme {
    let name: String
    let emojis: [String]
    let numberOfPairs: Int?
    let color: String
}

let themes: [Theme] = [
    Theme(name: "Halloween", emojis: HalloweenEmojis, numberOfPairs: 16, color: "violet"),
    Theme(name: "Smileys", emojis: SmileyEmojis, numberOfPairs: 8, color: "yellow"),
    Theme(name: "Animal Faces", emojis: AnimalFaceEmojis, numberOfPairs: 10, color: "brown"),
    Theme(name: "Animals", emojis: AnimalEmojis, numberOfPairs: nil, color: "pink"),
    Theme(name: "Fruits", emojis: FruitEmojis, numberOfPairs: 7, color: "redblue"),
    Theme(name: "Food", emojis: FoodEmojis, numberOfPairs: 8, color: "orange"),
    Theme(name: "Cars", emojis: CarEmojis, numberOfPairs: 1, color: "gray")
]

let HalloweenEmojis = ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♀️","🙀","👹","😱","☠️","🍭"]
let SmileyEmojis = ["😀","😆","🤣","😇","☺️","😎","🥳","🤩","🥸","🫥","😬","🙄","🫡","🙄","🤢","🤮","🤧","😷"]
let AnimalFaceEmojis = ["🐶","🐭","🐯","🐵","🐷","🐔","🐣","🦊","🐼","🐻","🐸","🐮"]
let AnimalEmojis = ["🦆","🐦‍⬛","🦅","🐺","🦋","🐞","🐌","🐢","🐳","🐅","🦍","🐘","🦏","🐫","🦒","🐖","🦌"]
let FruitEmojis = ["🍎","🍐","🍊","🍋","🍌","🍇","🍓","🫐","🍒","🍑","🥭","🥥","🥝","🍍"]
let FoodEmojis = ["🥐","🥯","🍞","🥖","🥨","🧀","🍳","🥩","🌭","🍔","🍟","🌮","🥪","🍕","🍦","🍩"]
let CarEmojis = ["🏎️"]

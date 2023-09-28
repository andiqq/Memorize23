//
//  Theme.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 23.09.23.
//

import Foundation

struct Theme {
    let name: String
    var emojis: [String]
    let numberOfPairs: Int
    let color: String
}

let themes: [Theme] = [
    Theme(name: "Halloween", emojis: HalloweenEmojis, numberOfPairs: 10, color: "violet"),
    Theme(name: "Smileys", emojis: SmileyEmojis, numberOfPairs: 8, color: "yellow"),
    Theme(name: "Animal Faces", emojis: AnimalFaceEmojis, numberOfPairs: 10, color: "brown"),
    Theme(name: "Animals", emojis: AnimalEmojis, numberOfPairs: 9, color: "pink"),
    Theme(name: "Fruits", emojis: FruitEmojis, numberOfPairs: 7, color: "red"),
    Theme(name: "Food", emojis: FoodEmojis, numberOfPairs: 8, color: "orange")
]

let HalloweenEmojis = ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♀️","🙀","👹","😱","☠️","🍭"]
let SmileyEmojis = ["😀","😆","🤣","😇","☺️","😎","🥳","🤩","🥸","🫥","😬","🙄","🫡","🙄","🤢","🤮","🤧","😷"]
let AnimalFaceEmojis = ["🐶","🐭","🐯","🐵","🐷","🐔","🐣","🦊","🐼","🐻","🐸","🐮"]
let AnimalEmojis = ["🦆","🐦‍⬛","🦅","🐺","🦋","🐞","🐌","🐢","🐳","🐅","🦍","🐘","🦏","🐫","🦒","🐖","🦌"]
let FruitEmojis = ["🍎","🍐","🍊","🍋","🍌","🍇","🍓","🫐","🍒","🍑","🥭","🥥","🥝","🍍"]
let FoodEmojis = ["🥐","🥯","🍞","🥖","🥨","🧀","🍳","🥩","🌭","🍔","🍟","🌮","🥪","🍕","🍦","🍩"]

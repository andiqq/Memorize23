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
    let numberOfPairs: Int
    let color: String
}

let themes: [Theme] = [
    Theme(name: "Halloween", emojis: HalloweenEmojis.shuffled(), numberOfPairs: 10, color: "violet"),
    Theme(name: "Smileys", emojis: SmileyEmojis.shuffled(), numberOfPairs: 8, color: "yellow"),
    Theme(name: "Animal Faces", emojis: AnimalFaceEmojis.shuffled(), numberOfPairs: 10, color: "brown"),
    Theme(name: "Animals", emojis: AnimalEmojis.shuffled(), numberOfPairs: 9, color: "pink"),
    Theme(name: "Fruits", emojis: FruitEmojis.shuffled(), numberOfPairs: 7, color: "red"),
    Theme(name: "Food", emojis: FoodEmojis.shuffled(), numberOfPairs: 8, color: "orange")
]

let HalloweenEmojis = ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♀️","🙀","👹","😱","☠️","🍭"]
let SmileyEmojis = ["😀","😆","🤣","😇","☺️","😎","🥳","🤩","🥸","🫥","😬","🙄","🫡","🙄","🤢","🤮","🤧","😷"]
let AnimalFaceEmojis = ["🐶","🐭","🐯","🐵","🐷","🐔","🐣","🦊","🐼","🐻","🐸","🐮"]
let AnimalEmojis = ["🦆","🐦‍⬛","🦅","🐺","🦋","🐞","🐌","🐢","🐳","🐅","🦍","🐘","🦏","🐫","🦒","🐖","🦌"]
let FruitEmojis = ["🍎","🍐","🍊","🍋","🍌","🍇","🍓","🫐","🍒","🍑","🥭","🥥","🥝","🍍"]
let FoodEmojis = ["🥐","🥯","🍞","🥖","🥨","🧀","🍳","🥩","🌭","🍔","🍟","🌮","🥪","🍕","🍦","🍩"]

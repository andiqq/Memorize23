//
//  Theme.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 23.09.23.
//

import Foundation
import SwiftUI

struct Theme {

    let name: String
    let emojis: [String]
    let numberOfPairs: Int?
    let color: String

    static let selectedTheme = [
        Theme(name: "Halloween", emojis: halloweenEmojis, numberOfPairs: 16, color: "violet"),
        Theme(name: "Smileys", emojis: smileyEmojis, numberOfPairs: 8, color: "yellow"),
        Theme(name: "Animal Faces", emojis: animalFaceEmojis, numberOfPairs: 10, color: "brown"),
        Theme(name: "Animals", emojis: animalEmojis, numberOfPairs: nil, color: "pink"),
        Theme(name: "Fruits", emojis: fruitEmojis, numberOfPairs: 7, color: "redblue"),
        Theme(name: "Food", emojis: foodEmojis, numberOfPairs: 8, color: "orange"),
        Theme(name: "Cars", emojis: carEmojis, numberOfPairs: 1, color: "gray")
    ]

    static let halloweenEmojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    static let smileyEmojis = ["😀", "😆", "🤣", "😇", "☺️", "😎", "🥳", "🤩", "🥸", "🫥", "😬", "🙄", "🫡", "🙄", "🤢", "🤮", "🤧", "😷"]
    static let animalFaceEmojis = ["🐶", "🐭", "🐯", "🐵", "🐷", "🐔", "🐣", "🦊", "🐼", "🐻", "🐸", "🐮"]
    static let animalEmojis = ["🦆", "🐦‍⬛", "🦅", "🐺", "🦋", "🐞", "🐌", "🐢", "🐳", "🐅", "🦍", "🐘", "🦏", "🐫", "🦒", "🐖", "🦌"]
    static let fruitEmojis = ["🍎", "🍐", "🍊", "🍋", "🍌", "🍇", "🍓", "🫐", "🍒", "🍑", "🥭", "🥥", "🥝", "🍍"]
    static let foodEmojis = ["🥐", "🥯", "🍞", "🥖", "🥨", "🧀", "🍳", "🥩", "🌭", "🍔", "🍟", "🌮", "🥪", "🍕", "🍦", "🍩"]
    static let carEmojis = ["🏎️"]

    static func getColors(themeColor: String) -> [Color] {
        switch themeColor {
        case "yellow": return [.yellow, .orange]
        case "brown": return [.brown, .black, .brown]
        case "pink": return [.pink]
        case "redblue": return [.red, .blue]
        case "orange": return [.red, .yellow]
        default: return [.purple, .black]
        }
    }
}

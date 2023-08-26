//
//  Themes.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 26.08.23.
//

import Foundation
import SwiftUI

struct theme {
    var symbols: [String]
    var color: Color
    var icon: String
    var textDescription: String
}

let animals = theme(
    symbols: ["🐌","🐞","🐳","🐅","🦣","🦧","🦏","🦒","🦘","🐄"],
    color: .brown,
    icon: "pawprint",
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

//
//  EmojiMemoryGame.swift
//  week3-practice
//
//  Created by Mohamed Abdelkhalek Salah on 04/10/2021.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let vehicleThemeEmojis = Array("🚗🚕🚙🚌🚑🚓🏎🚎🚒🚐🛻🚚🚛🚜🛵🏍🛺🚨🚔🚡🚖🚘🚍").map {
        String($0)
    }
    
    static let sportThemeEmojis = Array("⚽️🏀⚾️🏉🏐🎾🥎🥏🎱🪀🏓🥍🏑🏒🏸🏏🪃🥅⛳️🤿🎣🏹🪁🥊🥋🎽🛹").map {
        String($0)
    }

    static let foodThemeEmojis = Array("🍏🍎🍐🍊🍇🍉🍌🍋🍓🫐🍈🍒🥥🍍🥭🍑🥝🍅🍆🥑🌶🥒🥬🥦🫑🌽🥕🫒🍠🥔🧅").map {
        String($0)
    }
    
    static let animalThemeEmojis = Array("🐶🐱🐭🐹🐰🦊🐻🐼🐻‍❄️🐨🐯🦁🐮🐷🐽🐸🐵🙈🙉🙊🐒🐔🐧🐦").map {
        String($0)
    }
    
    static let flagThemeEmojis = Array("🇩🇿🇦🇸🇦🇩🇦🇴🇦🇮🇦🇶🇦🇬🇦🇷🇦🇲🇦🇼🇦🇺🇦🇹🇦🇿🇧🇧🇧🇩🇧🇭🇧🇸🇧🇾🇧🇪🇧🇿🇧🇯🇧🇦🇧🇴🇧🇹🇧🇲🇪🇬").map {
        String($0)
    }

    static let objectThemeEmojis = Array("⌚️📱📲💻⌨️🖥🖨🖱💽🗜🕹🖲💾💿📀📼🎥📹📸📷📽🎞📞☎️📻📺").map {
        String($0)
    }
    
    
    static let vehicleTheme = Theme(name: "vehicle", numberOfPairs: 6, cardColor: "red", setOfEmoji: vehicleThemeEmojis)
    static let sportTheme = Theme(name: "sport", numberOfPairs: 8, cardColor: "orange", setOfEmoji: sportThemeEmojis)
    static let foodTheme = Theme(name: "food", numberOfPairs: 10, cardColor: "green", setOfEmoji: foodThemeEmojis)
    static let animalTheme = Theme(name: "animal", numberOfPairs: 12, cardColor: "purple", setOfEmoji: animalThemeEmojis)
    static let flagTheme = Theme(name: "flag", numberOfPairs: 4, cardColor: "yellow", setOfEmoji: flagThemeEmojis)
    static let objectTheme = Theme(name: "object", numberOfPairs: 2, cardColor: "blue", setOfEmoji: objectThemeEmojis)
    
    static let themes = [vehicleTheme, sportTheme, foodTheme,
                         animalTheme, flagTheme, objectTheme]
    
    static var themeChosen = themes.randomElement()!
    
    @Published private var model: MemoryGame<String> =
        MemoryGame<String>(numbersOfPairsOfCard: themeChosen.numberOfPairs) { pairIndex in
            themeChosen.setOfEmoji[pairIndex]
        }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    var themeColor: Color {
        switch EmojiMemoryGame.themeChosen.cardColor {
        case "red": return .red
        case "green": return .green
        case "blue": return .blue
        case "orange": return .orange
        case "purple": return .purple
        case "yellow": return .yellow
        default: return .red
        }
    }
    
    var score: Int {
        model.score
    }
    
    var themeName: String {
        EmojiMemoryGame.themeChosen.name.capitalized
    }
}

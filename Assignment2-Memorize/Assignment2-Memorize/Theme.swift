//
//  Theme.swift
//  week3-practice
//
//  Created by Mohamed Abdelkhalek Salah on 06/10/2021.
//

import Foundation


struct Theme {
    private(set) var name: String
    private(set) var numberOfPairs: Int
    private(set) var cardColor: String
    private(set) var setOfEmoji: [String]
    
    init(name: String, numberOfPairs: Int, cardColor: String, setOfEmoji: [String]) {
        self.name = name
        self.cardColor = cardColor
        self.setOfEmoji = Array(Set(setOfEmoji)).shuffled()
        if numberOfPairs > Int(self.setOfEmoji.count / 2) {
            self.numberOfPairs = self.setOfEmoji.count
        } else {
            self.numberOfPairs = numberOfPairs
        }
    }
}

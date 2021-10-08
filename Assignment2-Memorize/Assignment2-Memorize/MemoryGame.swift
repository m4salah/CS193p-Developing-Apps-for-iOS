//
//  MemoryGame.swift
//  week3-practice
//
//  Created by Mohamed Abdelkhalek Salah on 04/10/2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var score: Int = 0
    
    private var indexOfTheOnlyFacedUpCard: Int?
    private var cardSeen: [Card] = []

    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potintialMatchIndex = indexOfTheOnlyFacedUpCard {
                if cards[chosenIndex].content == cards[potintialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potintialMatchIndex].isMatched = true
                }
                indexOfTheOnlyFacedUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOnlyFacedUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print(card)
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if card.id == cards[index].id {
                return index
            }
        }
        return nil
    }
    
    init(numbersOfPairsOfCard: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numbersOfPairsOfCard {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))

        }
        cards.shuffle()
    }
    
    struct Card: Identifiable, Equatable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}


//mutating func choose(_ card: Card) {
//    if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
//       !cards[chosenIndex].isFaceUp,
//       !cards[chosenIndex].isMatched
//    {
//        if cardSeen.contains(cards[chosenIndex]) {
//            if let potintialMatchIndex = indexOfTheOnlyFacedUpCard {
//                if cards[chosenIndex].content == cards[potintialMatchIndex].content {
//                    cards[chosenIndex].isMatched = true
//                    cards[potintialMatchIndex].isMatched = true
//                    cardSeen = cardSeen.filter({
//                        $0 != cards[chosenIndex]
//                    })
//                    score += 2
//                }
//                indexOfTheOnlyFacedUpCard = nil
//            } else {
//                for index in cards.indices {
//                    cards[index].isFaceUp = false
//                }
//                indexOfTheOnlyFacedUpCard = chosenIndex
//                score += 1
//            }
//        } else {
//            cardSeen.append(cards[chosenIndex])
//            indexOfTheOnlyFacedUpCard = chosenIndex
//            for index in cards.indices {
//                cards[index].isFaceUp = false
//            }
//        }
//        cards[chosenIndex].isFaceUp.toggle()
//    }
//    print(cardSeen)
//}

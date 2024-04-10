//
//  Cards.swift
//  Recall
//
//  Created by stamoulis nikolaos on 6/4/24.
//

import UIKit

struct Card {
    
    let animalName: String?
    let animalImage: UIImage?
    var isMatched: Bool
    var isFlipped: Bool
    
    mutating func flip() {
        isFlipped.toggle()
    }
    
  
}


class GameController {
    
   static var mockedCards =  [Card(animalName: "Luna", animalImage: nil, isMatched: false, isFlipped: false),
                               Card(animalName: "Monkey", animalImage: nil, isMatched: false, isFlipped: false),
                               Card(animalName: "nikos", animalImage: nil, isMatched: false, isFlipped: false),
                               Card(animalName: "mike", animalImage: nil, isMatched: false, isFlipped: false),
                               Card(animalName: "vasilis", animalImage: nil, isMatched: false, isFlipped: false),
                               Card(animalName: "cat", animalImage: nil, isMatched: false, isFlipped: false),
                               Card(animalName: "dog", animalImage: nil, isMatched: false, isFlipped: false),
                               Card(animalName: "fofi", animalImage: nil, isMatched: false, isFlipped: false),
                               Card(animalName: "lion", animalImage: nil, isMatched: false, isFlipped: false),
                               Card(animalName: "zebra", animalImage: nil, isMatched: false, isFlipped: false),
                               Card(animalName: "pig", animalImage: nil, isMatched: false, isFlipped: false),
                               Card(animalName: "chicken", animalImage: nil, isMatched: false, isFlipped: false)]
    
    
    func generateCards(level: Int) -> [Card] {
        
        var cards: [Card] = []
        
        
        for i in 0...level - 1 {
            let card = GameController.mockedCards[i]
            cards.append(card)
            cards.append(card)
        }
        
        return cards.shuffled()
        
//        switch level {
//        case 1:
//            
//            print("level 1")
//        case 2:
//            print("level 2")
//        case 3:
//            print("level 3")
//        case 4:
//            print("level 4")
//        default:
//            break
//            
//        }
    }
}

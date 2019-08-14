//
//  Concetration.swift
//  Concetration
//
//  Created by Ben Durmishllari on 10/07/2019.
//  Copyright © 2019 Ben Durmishllari. All rights reserved.
//

import Foundation


class Concetration
{
    var cards = [Card] ()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    {
        get
        {
            var foundIndex: Int?
            
            for index in cards.indices
            {
                if cards[index].isFaceUp
                {
                    if foundIndex == nil
                    {
                        foundIndex = index
                    }
                    else
                    {
                        return nil
                    }
                }
                
            }
            return foundIndex
        }
        set
        {
            for index in cards.indices
            {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int)
    {
        if !cards[index].isMatched
        {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index
            {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                //indexOfOneAndOnlyFaceUpCard = nil
            }
            else
            {
                // either no cards or 2 cards are face up
//                for flipDownIndex in cards.indices
//                {
//                    cards[flipDownIndex].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
    
    init(numberOfPairsOfCards: Int)
    {
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
        cards.shuffle()
    }
}

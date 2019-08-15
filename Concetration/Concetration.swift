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
    private(set) var cards = [Card] ()
    
    private var indexOfOneAndOnlyFaceUpCard: Int?
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
        // assert it cheking on the range of
        // the index if its contains before to run the method
        assert(cards.indices.contains(index),
               "Concetration.chooseCard(at:\(index): chosen index not in the cards")
        
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
        assert(numberOfPairsOfCards > 0,
               "Concetation.init(\(numberOfPairsOfCards)): you must have at least pn [aor pf cards")
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
        cards.shuffle()
    }
}

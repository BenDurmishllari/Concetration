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
    
    func chooseCard(at index: Int)
    {
        
    }
    
    init(numberOfPairsOfCards: Int)
    {
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        // ToDo: Shuffle the cards
        
    }
}

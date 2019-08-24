//
//  ViewController.swift
//  Concetration
//
//  Created by Ben Durmishllari on 25/06/2019.
//  Copyright © 2019 Ben Durmishllari. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    private lazy var game: Concetration =
        Concetration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int
    {
        get{return (cardButtons.count + 1) / 2}
    }

    private(set) var flipCounter = 0
    {
        didSet
        {
            flipCountLabel.text = "Flip: \(flipCounter)"
        }
    }

    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    
    @IBAction private func touchCard(_ sender: UIButton)
    {
        flipCounter += 1
        
        // if statment that it manage the choosing cards
        if let cardNumber = cardButtons.firstIndex(of: sender)
        {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else
        {
            print("chosen card was not in cardButtons")
        }
    }
    
    private func updateViewFromModel()
    {
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp
            {
                button.setTitle(emoji(for: card),
                                for: UIControl.State.normal)
                button.backgroundColor  = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else
            {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor  = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    
    
    
    
    // array with emoji
    private var emojiChoices = ["🐶", "🐸", "🐸",
                                "🐯", "🐶", "🐷",
                                "🐰", "🐰", "🐼",
                                "🐼", "🐷", "🐯"]
    
    private var emoji = [Card:String]()
    
    
    
    private func emoji(for card: Card) -> String
    {
        if emoji[card] == nil
        {
            if emojiChoices.count > 0
            {
                emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4randon)
            }
        }
        return emoji[card] ?? "?"
    }
    
}
extension Int 
{
    var arc4randon: Int
    {
        if self > 0
        {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0
        {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else
        {
            return 0
        }
    }
}


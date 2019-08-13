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
    
    lazy var game: Concetration =
        Concetration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int
    {
        get {return (cardButtons.count + 1) / 2}
    }

    var flipCounter = 0
    {
        didSet
        {
            flipCountLabel.text = "Flip: \(flipCounter)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    @IBAction func touchCard(_ sender: UIButton)
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
    
    func updateViewFromModel()
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
    var emojiChoices = ["🐶", "🐸", "🐸",
                        "🐯", "🐶", "🐷",
                        "🐰", "🐰", "🐼",
                        "🐼", "🐷", "🐯"]
    
    var emoji = [Int:String]()
    
    
    
    func emoji(for card: Card) -> String
    {
        if emoji[card.identifier] == nil
        {
            if emojiChoices.count > 0
            {
                let randonIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randonIndex)
            }
        }
        return emoji[card.identifier] ?? "?"
    }
    
    
//    func flipCard(withEmoji emoji: String, on button: UIButton)
//    {
//        //print ("flipCard(withEmoji: \(emoji))")
//        if button.currentTitle == emoji
//        {
//            button.setTitle("", for: UIControl.State.normal)
//            button.backgroundColor  = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//        }
//        else
//        {
//            button.setTitle(emoji, for: UIControl.State.normal)
//            button.backgroundColor  = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        }
//    }
    
}


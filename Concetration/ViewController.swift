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
    
    lazy var game = Concetration(numberOfPairsOfCards: cardButtons.count / 2)

    var flipCounter = 0
    {
        didSet
        {
            flipCountLablel.text = "Flip: \(flipCounter)"
        }
    }

    @IBOutlet weak var flipCountLablel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    // array with emoji
    var emojiChoices = ["🐶", "🐸", "🐸",
                        "🐯", "🐶", "🐷",
                        "🐰", "🐰", "🐼",
                        "🐼", "🐷", "🐯"]
    
    @IBAction func touchCard(_ sender: UIButton)
    {
        flipCounter += 1
        if let cardNumber = cardButtons.firstIndex(of: sender)
        {
            game.chooseCard(at: cardNumber)
        }
        else
        {
            print("chosen card was not in cardButtons")
        }
    }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton)
    {
        //print ("flipCard(withEmoji: \(emoji))")
        if button.currentTitle == emoji
        {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor  = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else
        {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor  = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}


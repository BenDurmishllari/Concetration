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
                        "🐯","🐶", "🐷",
                        "🐰", "🐰","🐼",
                        "🐼", "🐷", "🐯"]
    
    @IBAction func touchCard(_ sender: UIButton)
    {
        flipCounter += 1
        if let cardNumber = cardButtons.index(of: sender)
        {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
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
            button.backgroundColor  = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        else
        {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor  = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}


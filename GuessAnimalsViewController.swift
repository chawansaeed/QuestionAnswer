//
//  GuessAnimalsViewController.swift
//  kidsQuestions
//
//  Created by Chawan Saeed on 10/10/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class GuessAnimalsViewController: UIViewController {
    
    // Variables:
    var question: Questions!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Have fun 😊"
        quizImage.image = UIImage(named: question.animalImages)
        questionLabel.text = "What animal is that above?"
        buttonOne.setTitle(question.firstAnswer, forState: .Normal)
        buttonTwo.setTitle(question.secondAnswer, forState: .Normal)
        buttonFour.setTitle(question.thirdAnswer, forState: .Normal)
        buttonThree.setTitle(question.trueAnswer ,forState: .Normal)
    }
    
    // Outlets
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    
    // Actions
    @IBAction func firstButton(sender: UIButton) {
        
        if buttonOne.titleLabel?.text == question.trueAnswer {
                let alertController = UIAlertController(title: "Great Job", message: "Your answer was correct.", preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                presentViewController(alertController, animated: true, completion: nil)
                print("true")
            } else {
                let alertController = UIAlertController(title: "Try Another One", message: "Your answer was incorrect.", preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                presentViewController(alertController, animated: true, completion: nil)
                print("false")
        }
    }
    @IBAction func secondButton(sender: UIButton) {
        
        if buttonTwo.titleLabel?.text == question.trueAnswer {
            let alertController = UIAlertController(title: "Great Job", message: "Your answer was correct.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            print("true")
        } else {
            let alertController = UIAlertController(title: "Try Another One", message: "Your answer was incorrect.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            print("false")
        }
    }
    @IBAction func thirdButton(sender: UIButton) {
        
        if buttonThree.titleLabel?.text == question.trueAnswer {
            let alertController = UIAlertController(title: "Great Job", message: "Your answer was correct.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            print("true")
        } else {
            let alertController = UIAlertController(title: "Try Another One", message: "Your answer was incorrect.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            print("false")
        }
    }
    @IBAction func fourthButton(sender: UIButton) {
        
        if buttonFour.titleLabel?.text == question.trueAnswer {
            let alertController = UIAlertController(title: "Great Job", message: "Your answer was correct.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            print("true")
        } else {
            let alertController = UIAlertController(title: "Try Another One", message: "Your answer was incorrect.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            print("false")
        }
    }
}
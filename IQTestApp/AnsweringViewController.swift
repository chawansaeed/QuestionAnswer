//
//  AnweringViewController.swift
//  kidsQuestions
//
//  Created by Chawan Saeed on 9/27/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class AnsweringViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var backgroungImage: UIImageView!
    @IBOutlet var revealButton: UIButton!
    var question: Questions!

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = question.listOfQuestions
        backgroungImage.image = UIImage(named: "marble")
        title = "Have fun 😊"
    }
    
    @IBAction func answerTextField(sender: UITextField) {
        
        if sender.text == question.answer {
            let alertController = UIAlertController(title: "Good Job", message: "Your answer was correct.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            print("true")

        } else {
            let alertController = UIAlertController(title: "Try Again", message: "Your answer was incorrect.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            print("false")
        }
    }
    
    @IBAction func checkingAnswer(sender: UIButton) {
        revealButton.setTitle(question.answer, forState: .Normal)
    }
}
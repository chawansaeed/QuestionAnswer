//
//  GuessingImageTableViewController.swift
//  kidsQuestions
//
//  Created by Chawan Saeed on 10/9/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class GuessingAnimalsCollectionViewController: UICollectionViewController {

    // Variable:
    var questions = [Questions]()

    // Functions:
    override func viewDidLoad() {
        super.viewDidLoad()
        readJsonFile("JsonFile")
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1

    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count

    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("listOfQuestions", forIndexPath: indexPath) as! CollectionViewCell
        cell.questionList.text = questions[indexPath.row].indexOfAnimals
        return cell
    }
    
    // Helping functions:
    
    func readJsonFile(path: String) {
        if let filePath = NSBundle.mainBundle().pathForResource(path, ofType: "json") {
            let data = NSData(contentsOfFile: filePath)
            parseJsonData(data!)
        }
    }
    
    func parseJsonData(data: NSData) -> [Questions] {
        do {
            let decodedData = try NSJSONSerialization.JSONObjectWithData(data, options: [ ]) as? NSDictionary
            
            // Parse JSON data
            let jsonquestions = decodedData?["guessAnimals"] as! [AnyObject]
            
            for jsonquestion in jsonquestions {
                let question = Questions()
                question.indexOfAnimals = jsonquestion["index"] as! String
                question.animalImages = jsonquestion["quizImage"] as! String
                question.firstAnswer = jsonquestion["firstAnswer"] as! String
                question.secondAnswer = jsonquestion["secondAnswer"] as! String
                question.thirdAnswer = jsonquestion["thirdAnswer"] as! String
                question.trueAnswer = jsonquestion["trueAnswer"] as! String
                questions.append(question)
            }
            return questions
        }
        catch { print("Can not parse, \(error)") }
        return questions
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "guessTheAnimal" {
            if let indexPath = collectionView?.indexPathsForSelectedItems() {
                
            let destinationVC = segue.destinationViewController as! GuessAnimalsViewController
            destinationVC.question = questions[indexPath[0].row]
            }
        }
    }
}

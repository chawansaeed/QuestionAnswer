//
//  QuestionsTableViewController.swift
//  kidsQuestions
//
//  Created by Chawan Saeed on 9/26/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class QuestionsCollectionViewController: UICollectionViewController {
    
    // Variables
    var questions = [Questions]()

    override func viewDidLoad() {
        super.viewDidLoad()
        readJsonFile("JsonFile")
    }
    
    // Functions
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1

    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count

    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("questionsCell", forIndexPath: indexPath) as! QuestionCollectionViewCell
        cell.questionList.text = questions[indexPath.row].indexOfQuestions
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
            let jsonquestions = decodedData?["questionList"] as! [AnyObject]
            
            for jsonquestion in jsonquestions {
                let question = Questions()
                question.indexOfQuestions = jsonquestion["index"] as! String
                question.listOfQuestions = jsonquestion["question"] as! String
                question.answer = jsonquestion["answer"] as! String
                questions.append(question)
            }
            return questions
        }
        catch { print("Can not parse, \(error)") }
        return questions
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "answerTheQuestions" {
            if let indexPath = collectionView?.indexPathsForSelectedItems() {
            let destinationController = segue.destinationViewController as! AnsweringViewController
            destinationController.question = questions[indexPath[0].row]
            }
        }
    }
}

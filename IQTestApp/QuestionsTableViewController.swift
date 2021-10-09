//
//  QuestionsTableViewController.swift
//  kidsQuestions
//
//  Created by Chawan Saeed on 9/26/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class QuestionsTableViewController: UITableViewController {
    
    var questions = [Questions]()
   // var question: Questions!

    override func viewDidLoad() {
        super.viewDidLoad()
        readJsonFile("JsonFile")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("questionsCell", forIndexPath: indexPath) as! QuestionTableViewCell
        cell.questionList.text = questions[indexPath.row].indexOfQuestions
        return cell
    }
    
    func readJsonFile(path: String) {
        if let filePath = NSBundle.mainBundle().pathForResource(path, ofType: "json") {  
            let data = NSData(contentsOfFile: filePath)
            //  print("value of data \(data)")
            parseJsonData(data!)
        }
    }
    
    func parseJsonData(data: NSData) -> [Questions] {
        do {
            let decodedData = try NSJSONSerialization.JSONObjectWithData(data, options: [ ]) as? NSDictionary
            
            // Parse JSON data
            let jsonquestions = decodedData?["questionList"] as! [AnyObject]
//                print("json questions: \(jsonquestions)")
            
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
            if let indexPath = tableView.indexPathForSelectedRow {
            let destinationController = segue.destinationViewController as! AnsweringViewController
            destinationController.question = questions[indexPath.row]
            }
        }
    }
}

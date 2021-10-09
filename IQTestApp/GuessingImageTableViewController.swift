//
//  GuessingImageTableViewController.swift
//  kidsQuestions
//
//  Created by Chawan Saeed on 10/9/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class GuessingImageTableViewController: UITableViewController {

    var questions = [Questions]()

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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("listOfQuestions", forIndexPath: indexPath) as! TableViewCell
        cell.questionList.text = questions[indexPath.row].indexOfImages
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
            let jsonquestions = decodedData?["guessImages"] as! [AnyObject]
            //                print("json questions: \(jsonquestions)")
            
            for jsonquestion in jsonquestions {
                let question = Questions()
                question.indexOfImages = jsonquestion["index"] as! String
                questions.append(question)
            }
            return questions
        }
        catch { print("Can not parse, \(error)") }
        return questions
    }

}

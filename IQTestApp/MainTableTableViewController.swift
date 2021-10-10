//
//  MainTableTableViewController.swift
//  BrainTeaser
//
//  Created by Chawan Saeed on 9/22/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class MainTableTableViewController: UITableViewController {

    // Variables:
    var questions = [Questions]()
    var question: Questions!

    override func viewDidLoad() {
        super.viewDidLoad()

//         Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        readJsonFile("JsonFile")
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("Questions", forIndexPath: indexPath) as! FirstTableViewCell
            cell.categoryLabel.text = questions[indexPath.row].categoryName
            cell.categoryImageView.image = UIImage(named: questions[indexPath.row].categoryImage)
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("guessImages", forIndexPath: indexPath) as! GuessingImageTableViewCell
            cell.shapeImage.image = UIImage(named: questions[indexPath.row].categoryImage)
            cell.titleLabel.text = questions[indexPath.row].categoryName
            return cell
        }
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
            let jsonquestions = decodedData?["mainView"] as! [AnyObject]
            
            for jsonquestion in jsonquestions {
                let question = Questions()
                question.categoryName = jsonquestion["categoryName"] as! String
                question.categoryImage = jsonquestion["categoryImage"] as! String                
                questions.append(question)
            }
            return questions 
        }
        catch { print("Can not parse, \(error)") }
        return questions
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showListOfQuestions" {
            let destinationViewController = segue.destinationViewController as! QuestionsTableViewController
            destinationViewController.questions = questions
        }
    }
}

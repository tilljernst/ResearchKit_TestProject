//
//  ViewController.swift
//  ResearchKit_TestProject
//
//  Created by Till J. Ernst on 11.05.17.
//  Copyright © 2017 Till J. Ernst. All rights reserved.
//

import ResearchKit
import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBAction func helloWorldTapped(_ sender: Any) {
        // Research-Taskaufruf direct und simple
        showHelloWorld()
    }
    @IBAction func consentTapped(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func surveyTapped(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    @IBAction func microTapped(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: MicrophoneTask, taskRun: nil)
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] , isDirectory: true) as URL
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func softwareititsTapped(_ sender: Any) {
        self.showSurvey()
    }
    
    // Mark: TableView
    @IBOutlet weak var tableView: UITableView!
    
    let entries = ["iOS mit Swift", "Swift Tutorial", "Swift lernen"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath as IndexPath) 
        cell.textLabel?.text = entries[indexPath.row]
        
        return cell
    }
    
    // -----------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // example from researchkit book from gregi
    func showHelloWorld(){
        let step1 = ORKInstructionStep(identifier: "step1")
        step1.text = "Hello World"
        let step2 = ORKInstructionStep(identifier: "step 2")
        step2.text = "Bye"
        let task = ORKOrderedTask(identifier: "task", steps: [step1, step2])
        let taskViewController = ORKTaskViewController(task: task, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }

}

//MARK: - ORKTaskViewController Delegate Methods
extension ViewController : ORKTaskViewControllerDelegate {
    
    // wird aufgerufen, wenn task beendet wurde
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        
        //Handle results with taskViewController.result
        processSurveyResults(taskViewController.result)
        
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
}


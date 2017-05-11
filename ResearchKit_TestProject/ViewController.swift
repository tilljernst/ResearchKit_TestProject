//
//  ViewController.swift
//  ResearchKit_TestProject
//
//  Created by Till J. Ernst on 11.05.17.
//  Copyright © 2017 Till J. Ernst. All rights reserved.
//

import ResearchKit
import UIKit

extension ViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
}

class ViewController: UIViewController {

    @IBAction func consentTapped(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func HelloWorld(){
//        let step1 = ORKInstructionStep(identifier: "step1")
//        step1.text = "Hello World"
//        let step2 = ORKInstructionStep(identifier: "step 2")
//        step2.text = "Bye"
//        let task = ORKOrderedTask(identifier: "task", steps: [step1, step2])
//        let taskViewController = ORKTaskViewController(task: task, taskRun: nil)
//        taskViewController.delegate = self
//        //presentedViewController(
//    }

}


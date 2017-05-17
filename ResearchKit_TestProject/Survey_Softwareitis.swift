//
//  Survey_Softwareitis.swift
//  ResearchKit_TestProject
//
//  Created by Till J. Ernst on 17.05.17.
//  Copyright © 2017 Till J. Ernst. All rights reserved.
//

import Foundation
import ResearchKit

extension ViewController{
    func showSurvey()
    {
        let instStep = ORKInstructionStep(identifier: "Instruction Step")
        instStep.title = "Softwareitis Survey"
        instStep.detailText = "This survey demonstrates different question types."
        
        let question1 = ORKQuestionStep(identifier: "question 1", title: "Have you ever been diagnosed with Softwareitis?", answer: ORKAnswerFormat.booleanAnswerFormat())
        
        let question2 = ORKQuestionStep(identifier: "question 2", title: "How many apps do you download per week?", answer: ORKAnswerFormat.integerAnswerFormat(withUnit: "Apps per week"))
        
        let answerFormat3 = ORKNumericAnswerFormat.scale(withMaximumValue: 10, minimumValue: 0, defaultValue: 5, step: 1, vertical: false, maximumValueDescription: nil, minimumValueDescription: nil)
        let question3 = ORKQuestionStep(identifier: "question 3", title: "How many apps do you download per week (range)?", answer: answerFormat3)
        
        let textChoice1 = ORKTextChoice(text: "Games", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
        let textChoice2 = ORKTextChoice(text: "Lifestyle", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
        let textChoice3 = ORKTextChoice(text: "Utility", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
        let answerFormat4 = ORKNumericAnswerFormat.choiceAnswerFormat(with: ORKChoiceAnswerStyle.singleChoice, textChoices: [textChoice1, textChoice2, textChoice3])
        let question4 = ORKQuestionStep(identifier: "question 4", title: "Which category of apps do you download the most?", answer: answerFormat4)
        
        let answerFormat5 = ORKNumericAnswerFormat.dateAnswerFormat()
        let question5 = ORKQuestionStep(identifier: "question 5", title: "When did you last download an app?", answer: answerFormat5)
        
        let answerFormat6 = ORKNumericAnswerFormat.timeIntervalAnswerFormat()
        let question6 = ORKQuestionStep(identifier: "question 6", title: "When did you last open an app?", answer: answerFormat6)
        
        let completionStep = ORKCompletionStep(identifier: "Completion Step")
        completionStep.title = "Thank you for taking this survey!"
        
        let task = ORKOrderedTask(identifier: "first survey", steps: [instStep, question1, question2, question3, question4, question5, question6, completionStep])
        
        let taskViewController = ORKTaskViewController(task: task, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
}


extension ViewController
{
    func processSurveyResults(_ taskResult: ORKTaskResult?)
    {
        if let taskResultValue = taskResult
        {
            print("Task Run UUID : " + taskResultValue.taskRunUUID.uuidString)
            print("Survey started at : \(taskResultValue.startDate)     Ended at : \(taskResultValue.endDate)")
            
            if let instStepResult = taskResultValue.stepResult(forStepIdentifier: "Instruction Step")
            {
                print("Instruction Step started at : \(instStepResult.startDate)   Ended at : \(instStepResult.endDate)")
            }
            
            if let question1Result = taskResultValue.stepResult(forStepIdentifier: "question 1")?.results?.first as? ORKBooleanQuestionResult
            {
                if question1Result.booleanAnswer != nil
                {
                    let answerString = question1Result.booleanAnswer!.boolValue ? "Yes" : "No"
                    print("Answer to question 1 is \(answerString)")
                }
                else
                {
                    print("question 1 was skipped")
                }
            }
            
            if let question2Result = taskResultValue.stepResult(forStepIdentifier: "question 2")?.results?.first as? ORKNumericQuestionResult
            {
                if question2Result.numericAnswer != nil
                {
                    print("Answer to question 2 is \(question2Result.numericAnswer!)")
                }
                else
                {
                    print("question 2 was skipped")
                }
            }
            
            if let question3Result = taskResultValue.stepResult(forStepIdentifier: "question 3")?.results?.first as? ORKScaleQuestionResult
            {
                if question3Result.scaleAnswer != nil
                {
                    print("Answer to question 3 is \(question3Result.scaleAnswer!)")
                }
                else
                {
                    print("question 3 was skipped")
                }
            }
            
            if let question4Result = taskResultValue.stepResult(forStepIdentifier: "question 4")?.results?.first as? ORKChoiceQuestionResult
            {
                if question4Result.choiceAnswers != nil
                {
                    print("Answer to question 4 is \(question4Result.choiceAnswers!)")
                }
                else
                {
                    print("question 4 was skipped")
                }
            }
            
            if let question5Result = taskResultValue.stepResult(forStepIdentifier: "question 5")?.results?.first as? ORKDateQuestionResult
            {
                if question5Result.dateAnswer != nil
                {
                    print("Answer to question 5 is \(question5Result.dateAnswer!)")
                }
                else
                {
                    print("question 5 was skipped")
                }
            }
            
            if let question6Result = taskResultValue.stepResult(forStepIdentifier: "question 6")?.results?.first as? ORKTimeIntervalQuestionResult
            {
                if question6Result.intervalAnswer != nil
                {
                    print("Answer to question 6 is \(question6Result.intervalAnswer!)")
                }
                else
                {
                    print("question 6 was skipped")
                }
            }
            
            if let compStepResult = taskResultValue.stepResult(forStepIdentifier: "Completion Step")
            {
                print("Completion Step started at : \(compStepResult.startDate)   Ended at : \(compStepResult.endDate)")
            }
        }
    }
}




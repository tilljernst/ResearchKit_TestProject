//
//  ConsentTask.swift
//  ResearchKit_TestProject
//
//  Created by Till J. Ernst on 11.05.17.
//  Copyright © 2017 Till J. Ernst. All rights reserved.
//

import ResearchKit
import Foundation

public var ConsentTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    //Add VisualConsentStep
    let consentDocument = ConsentDocument
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
    steps += [visualConsentStep]
    
    //Add ConsentReviewStep
    let signature = consentDocument.signatures!.first! as ORKConsentSignature
    
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, in: consentDocument)
    
    reviewConsentStep.text = "Review Consent!"
    reviewConsentStep.reasonForConsent = "Consent to join study"
    
    steps += [reviewConsentStep]
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}

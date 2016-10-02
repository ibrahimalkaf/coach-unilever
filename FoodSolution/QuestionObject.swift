//
//  QuestionObject.swift
//  FoodSolution
//
//  Created by baim alkaf on 9/2/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
//
//  UserObject.swift
//  FoodSolution
//
//  Created by baim alkaf on 9/1/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
/*
 "columnID" : "Column 1",
 "questionID" : "Question1",
 "textAnswer" : "Right",
 "tickAnswer" : false
 */

struct QuestionObject {
    
    let key: String!
    let columnID: String!
    let questionID : String!
    let textAnswer: String!
    let tickAnswer: Bool!
    let ref: FIRDatabase!
    
    init(columnID:String, questionID:String, textAnswer:String, tickAnswer:Bool, key: String = ""){
        
        self.columnID = columnID
        self.questionID = questionID
        self.textAnswer = textAnswer
        self.tickAnswer  = tickAnswer
        self.ref = nil
        self.key = key
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        ref = snapshot.ref.database
        
        columnID = snapshot.value!["columnID"] as! String
        questionID = snapshot.value!["questionID"] as! String
        textAnswer = snapshot.value!["textAnswer"] as! String
        tickAnswer  = snapshot.value!["tickAnswer"] as! Bool
        
    }
    
    func toAnyObject() -> AnyObject {
        return [
            "columnID": columnID,
            "questionID": questionID,
            "textAnswer": textAnswer,
            "tickAnswer ": tickAnswer
        ]
    }
    
}
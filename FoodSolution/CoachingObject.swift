//
//  CoachingObject.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/30/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct CoachingObject {
    
    let key: String!
    let action: String!
    let area: String!
    let cdCapabilityTeamEmail: String!
    let cdCapabilityTeamName: String!
    let cdCapabilityTeamPosition: String!
    let coacheePosition : String!
    let coacheeEmail: String!
    let coacheeName: String!
    let coachID: String!
    let coachingGuideline: Int!
    let coachName: String!
    let date: NSTimeInterval!
    let dateCreated: NSTimeInterval!
    let distributor: String!
    let firstManagerEmail: String!
    let firstManagerName: String!
    let firstManagerPosition: String!
    let secondManagerEmail: String!
    let secondManagerName: String!
    let secondManagerPosition: String!
    let store: String!
    let ref: FIRDatabase!
    
    init(action: String, area: String, store: String,  distributor: String, coachID: String,coachName: String,coachingGuideline: Int, date: NSTimeInterval, dateCreated: NSTimeInterval, coacheeName: String, coacheePosition: String, coacheeEmail: String, firstManagerName: String, firstManagerEmail: String, firstManagerPosition: String, secondManagerName: String, secondManagerEmail: String, secondManagerPosition: String, cdCapabilityTeamName: String,cdCapabilityTeamEmail: String, cdCapabilityTeamPosition: String, key: String = ""){
        
        self.action = action
        self.area = area
        self.coachID  = coachID
        self.coachName = coachName
        self.coachingGuideline = coachingGuideline
        self.date = date
        self.dateCreated = dateCreated
        self.distributor = distributor
        self.store = store
        self.coacheeName = coacheeName
        self.coacheePosition = coacheePosition
        self.coacheeEmail = coacheeEmail
        self.firstManagerName = firstManagerName
        self.firstManagerEmail = firstManagerEmail
        self.firstManagerPosition = firstManagerPosition
        self.secondManagerName = secondManagerName
        self.secondManagerEmail = secondManagerEmail
        self.secondManagerPosition = secondManagerPosition
        self.cdCapabilityTeamName = cdCapabilityTeamName
        self.cdCapabilityTeamEmail = cdCapabilityTeamEmail
        self.cdCapabilityTeamPosition = cdCapabilityTeamPosition
        self.ref = nil
        self.key = key
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        ref = snapshot.ref.database
        
        action = snapshot.value!["action"] as! String
        area = snapshot.value!["area"] as! String
        coachID  = snapshot.value!["coachID"] as! String
        coachName = snapshot.value!["coachName"] as! String
        coachingGuideline = snapshot.value!["coachingGuideline"] as! Int
        date = snapshot.value!["date"] as! NSTimeInterval
        dateCreated = snapshot.value!["dateCreated"] as! NSTimeInterval
        distributor = snapshot.value!["distributor"] as! String
        store = snapshot.value!["store"] as! String
        coacheeName = snapshot.value!["coacheeName"] as! String
        coacheePosition = snapshot.value!["coacheePosition"] as! String
        coacheeEmail = snapshot.value!["coacheeEmail"] as! String
        firstManagerName = snapshot.value!["firstManagerName"] as! String
        firstManagerEmail = snapshot.value!["firstManagerEmail"] as! String
        firstManagerPosition = snapshot.value!["firstManagerPosition"] as! String
        secondManagerName = snapshot.value!["secondManagerName"] as! String
        secondManagerEmail = snapshot.value!["secondManagerEmail"] as! String
        secondManagerPosition = snapshot.value!["secondManagerPosition"] as! String
        cdCapabilityTeamName = snapshot.value!["cdCapabilityTeamName"] as! String
        cdCapabilityTeamEmail = snapshot.value!["cdCapabilityTeamEmail"] as! String
        cdCapabilityTeamPosition = snapshot.value!["cdCapabilityTeamPosition"] as! String
        
    }
    
    func toAnyObject() -> AnyObject {
        return [
            "action": action,
            "area": area,
            "coachID": coachID,
            "coachName": coachName,
            "coachingGuideline": coachingGuideline,
            "date": date,
            "dateCreated": dateCreated,
            "distributor": distributor,
            "store": store,
            "coacheeName": coacheeName,
            "coacheePosition": coacheePosition,
            "coacheeEmail": coacheeEmail,
            "firstManagerName": firstManagerName,
            "firstManagerEmail": firstManagerEmail,
            "firstManagerPosition": firstManagerPosition,
            "secondManagerName": secondManagerName,
            "secondManagerEmail": secondManagerEmail,
            "secondManagerPosition": secondManagerPosition,
            "cdCapabilityTeamName": cdCapabilityTeamName,
            "cdCapabilityTeamEmail": cdCapabilityTeamEmail,
            "cdCapabilityTeamPosition": cdCapabilityTeamPosition
        ]
    }
    
}
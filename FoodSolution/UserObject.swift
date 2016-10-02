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

struct UserObject {
    
    let key: String!
    let email: String!
    let name: String!
    let position: String!
    let ref: FIRDatabase!
    
    init(email:String, name:String, position:String, key: String = ""){
        
        self.email = email
        self.name = name
        self.position  = position
        self.ref = nil
        self.key = key
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        ref = snapshot.ref.database
        
        email = snapshot.value!["email"] as! String
        name = snapshot.value!["name"] as! String
        position  = snapshot.value!["position"] as! String
        
    }
    
    func toAnyObject() -> AnyObject {
        return [
            "email": email,
            "name": name,
            "position ": position
        ]
    }
    
}
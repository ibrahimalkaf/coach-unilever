//
//  DataService.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/31/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class DataService {
    static let dataService = DataService()
    
    private var _BASE_REF = FIRDatabase.database().reference()
        
    var BASE_REF: FIRDatabaseReference {
        return _BASE_REF
    }
    
    
}
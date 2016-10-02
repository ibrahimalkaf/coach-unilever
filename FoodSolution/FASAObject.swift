//
//  FASAObject.swift
//  FoodSolution
//
//  Created by baim alkaf on 9/2/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation

class FASAObject{
    var fa_1a : Bool = false
    var fa_1b : Bool = false
    var fa_2a : Bool = false
    var fa_2b : Bool = false
    var fa_3a : Bool = false
    var fa_4a : Bool = false
    var fa_5a : Bool = false
    var fa_6a : String = ""
    var fa_6b : String = ""
    var fa_6c : String = ""
    var fa_6d : String = ""
    var fa_7a : String = ""
    var fa_7b : String = ""
    var fa_7c : Bool = false
    
    init(fa_1a:Bool, fa_1b:Bool, fa_2a : Bool,fa_2b : Bool, fa_3a : Bool, fa_4a : Bool,fa_5a : Bool, fa_6a:String, fa_6b : String, fa_6c : String, fa_6d : String, fa_7a : String ,fa_7b : String, fa_7c : Bool){
        self.fa_1a = fa_1a
        self.fa_1b = fa_1b
        self.fa_2a = fa_2a
        self.fa_2b = fa_2b
        self.fa_3a = fa_3a
        self.fa_4a = fa_4a
        self.fa_5a = fa_5a
        self.fa_6a = fa_6a
        self.fa_6b = fa_6b
        self.fa_6c = fa_6c
        self.fa_6d = fa_6d
        self.fa_7a = fa_7a
        self.fa_7b = fa_7b
        self.fa_7c = fa_7c
    }
    
    
    init(fa_1a:Bool){
        self.fa_1a = fa_1a
    }
    
    init(){
    }
}
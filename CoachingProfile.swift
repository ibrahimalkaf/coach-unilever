//
//  CoachingProfile.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/30/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import Eureka
import FirebaseDatabase
import Firebase
import CoreData


class CoachingProfile : FormViewController {
    
    var userid : String = ""
    var coachName : String = ""
    var coachEmail : String = ""
    var coachPosition : String = ""
    
    var coacheeName : String = ""
    var coacheeEmail : String = ""
    var coacheePosition : String = ""
    
    var stManagerName : String = ""
    var stManagerEmail : String = ""
    var stManagerPosition : String = ""
    
    var ndManagerName : String = ""
    var ndManagerEmail : String = ""
    var ndManagerPosition : String = ""
    
    var cdName : String = ""
    var cdEmail : String = ""
    var cdPosition : String = ""
    
    var rootRef: FIRDatabaseReference!
    
    override func viewDidLoad() {
        
        let cUserID:String = (FIRAuth.auth()?.currentUser?.uid)!
        self.userid = cUserID
        let cUSerEmail:String = (FIRAuth.auth()?.currentUser?.email)!
        if let coachName = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coachname){
            self.coachName = coachName
        }


        super.viewDidLoad()
        
        ButtonRow.defaultCellSetup = { cell, row in
            let orangeView = UIView()
            orangeView.backgroundColor = .orangeColor()
            cell.selectedBackgroundView = orangeView
            cell.backgroundColor = .orangeColor()
            cell.textLabel?.textColor = .whiteColor()
        }
        
        form =
            
            Section()
            
            <<< SegmentedRow<String>("CoachingProfile"){
                $0.options = ["PROFILE"]
                $0.value = "PROFILE"
                }.cellUpdate({ (cell, row) in
                    cell.tintColor = .orangeColor()
                    cell.textLabel?.font = UIFont.systemFontOfSize(15)
                })
            
            +++ Section("Coach")
            
            <<< NameRow(){
                $0.tag = "coachName"
                $0.value = self.coachName
                }.cellUpdate { cell, row in
                cell.textField.placeholder = "Name"
            }
            <<< EmailRow(){
                $0.value = cUSerEmail
                $0.disabled = true
                }.cellUpdate { cell, row in
                row.tag = "coachEmail"
            }
            
            <<< AlertRow<String>() {
                $0.title = "Position"
                $0.selectorTitle = "Position"
                $0.options = ["Managing Director","NSM Push","NSM Pull","NSM Chain","NSM Hotel","CD Capability Building Manager","RSM Pull","RSM Push","ASM Pull","ASM Push","Asst. CD Capability Building Manager","DTS Push","SR Pull Bareca","SR Pull Hotel","OM Dist.","DSS","DSR","CD Ops Manager","Asst. CD Ops Manager","Supply Chain","Marketing","Finance","Chef","R&D"]
                $0.value = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.position
                )
                }.onChange { row in
                    self.coachPosition = row.value!
                    print(row.value)
                }
                .onPresent{ _, to in
                    to.view.tintColor = .orangeColor()
            }
        
            +++ Section("Coachee")
           
            <<< NameRow().cellUpdate { cell, row in
                row.tag = "coacheeName"
                cell.textField.placeholder = "Name"
            }
            <<< NameRow().cellUpdate { cell, row in
                row.tag = "coacheeEmail"
                cell.textField.placeholder = "Email"
            }
            <<< AlertRow<String>() {
                $0.title = "Position"
                $0.selectorTitle = "Position"
                $0.options = ["Managing Director","NSM Push","NSM Pull","NSM Chain","NSM Hotel","CD Capability Building Manager","RSM Pull","RSM Push","ASM Pull","ASM Push","Asst. CD Capability Building Manager","DTS Push","SR Pull Bareca","SR Pull Hotel","OM Dist.","DSS","DSR","CD Ops Manager","Asst. CD Ops Manager","Supply Chain","Marketing","Finance","Chef","R&D"]
                $0.value = "Select Position"
                }.onChange { row in
                    self.coacheePosition = row.value!
                    print(row.value)
                }
                .onPresent{ _, to in
                    to.view.tintColor = .orangeColor()
            }

            +++ Section("1st Line Manager")
            
            <<< NameRow().cellUpdate { cell, row in
                row.tag = "stManagerName"
                cell.textField.placeholder = "Name"
            }
            <<< NameRow().cellUpdate { cell, row in
                row.tag = "stManagerEmail"
                cell.textField.placeholder = "Email"
            }
            <<< AlertRow<String>() {
                $0.title = "Position"
                $0.selectorTitle = "Position"
                $0.options = ["Managing Director","NSM Push","NSM Pull","NSM Chain","NSM Hotel","CD Capability Building Manager","RSM Pull","RSM Push","ASM Pull","ASM Push","Asst. CD Capability Building Manager","DTS Push","SR Pull Bareca","SR Pull Hotel","OM Dist.","DSS","DSR","CD Ops Manager","Asst. CD Ops Manager","Supply Chain","Marketing","Finance","Chef","R&D"]
                $0.value = "Select Position"
                }.onChange { row in
                    self.stManagerPosition = row.value!
                    print(row.value)
                }
                .onPresent{ _, to in
                    to.view.tintColor = .orangeColor()
            }
            +++ Section("2nd Line Manager")
            
            <<< NameRow().cellUpdate { cell, row in
                row.tag = "ndManagerName"
                cell.textField.placeholder = "Name"
            }
            <<< NameRow().cellUpdate { cell, row in
                row.tag = "ndManagerEmail"
                cell.textField.placeholder = "Email"
            }
            <<< AlertRow<String>() {
                $0.title = "Position"
                $0.selectorTitle = "Position"
                $0.options = ["Managing Director","NSM Push","NSM Pull","NSM Chain","NSM Hotel","CD Capability Building Manager","RSM Pull","RSM Push","ASM Pull","ASM Push","Asst. CD Capability Building Manager","DTS Push","SR Pull Bareca","SR Pull Hotel","OM Dist.","DSS","DSR","CD Ops Manager","Asst. CD Ops Manager","Supply Chain","Marketing","Finance","Chef","R&D"]
                $0.value = "Select Position"
                }.onChange { row in
                    self.ndManagerPosition = row.value!
                    print(row.value)
                }
                .onPresent{ _, to in
                    to.view.tintColor = .orangeColor()
            }
        
            +++ Section("CD Capability Team")
            
            <<< NameRow().cellUpdate { cell, row in
                row.tag = "cdCapabilityName"
                cell.textField.placeholder = "Name"
            }
            <<< NameRow().cellUpdate { cell, row in
                row.tag = "cdCapabilityEmail"
                cell.textField.placeholder = "Email"
            }
            <<< AlertRow<String>() {
                $0.title = "Position"
                $0.selectorTitle = "Position"
                $0.options = ["Managing Director","NSM Push","NSM Pull","NSM Chain","NSM Hotel","CD Capability Building Manager","RSM Pull","RSM Push","ASM Pull","ASM Push","Asst. CD Capability Building Manager","DTS Push","SR Pull Bareca","SR Pull Hotel","OM Dist.","DSS","DSR","CD Ops Manager","Asst. CD Ops Manager","Supply Chain","Marketing","Finance","Chef","R&D"]
                $0.value = "Select Position"
                }.onChange { row in
                    self.cdPosition = row.value!
                    print(row.value)
                }
                .onPresent{ _, to in
                    to.view.tintColor = .orangeColor()
            }
            
            +++ Section()
            <<< ButtonRow("save") {row in
                row.title = "Save"
                row.onCellSelection(self.savetoCoreData)
            }
    }
    
    func saveProfile(cell: ButtonCellOf<String>, row: ButtonRow) {
        
        
        rootRef = FIRDatabase.database().reference()
        let itemsRef = rootRef.child("coachingSession")
        let coachingItemRef = itemsRef.childByAutoId()
        
        let userRef = rootRef.child("userData")
        let userItemRef = userRef.child((FIRAuth.auth()?.currentUser?.uid)!)
        
        print("generateID")
        print(coachingItemRef.key)
        NSUserDefaults.standardUserDefaults().setValue(coachingItemRef.key, forKey: KeyLocal.coachingSession)
        

        let dict = form.values()
        
        if let nama = dict["coachName"] as? String
        {
            self.coachName = nama
        }
        if let nama = dict["coachEmail"] as? String
        {
            self.coachEmail = nama
        }
        
        if let nama = dict["coacheeName"] as? String
        {
            self.coacheeName = nama
            //print(nama) //should print only "Comments"
        }
        if let email = dict["coacheeEmail"] as? String
        {
            self.coacheeEmail = email
        }
        
        if let nama = dict["stManagerName"] as? String
        {
            self.stManagerName = nama
        }
        if let email = dict["stManagerEmail"] as? String
        {
            self.stManagerEmail = email
        }
        
        if let nama = dict["ndManagerName"] as? String
        {
            self.ndManagerName = nama
        }
        
        if let email = dict["ndManagerEmail"] as? String
        {
            self.ndManagerEmail = email
        }
        
        if let nama = dict["cdCapabilityName"] as? String
        {
            self.cdName = nama
        }
        if let email = dict["cdCapabilityEmail"] as? String
        {
            self.cdEmail = email
        }

        
        let unixTime = NSDate().timeIntervalSince1970
            
        if self.coacheeName != "" && self.coacheeEmail != "" && self.stManagerName != "" && self.stManagerEmail != "" && self.ndManagerName != "" && self.ndManagerEmail != "" && self.cdName != "" && self.cdEmail != "" && self.coacheePosition != "Select Position" && self.stManagerPosition != "Select Position" && self.ndManagerPosition != "Select Position" && self.cdPosition != "Select Position" {
        
        //simpan ke database coaching
        // 2
        let coachingItem = CoachingObject(action: "", area: "", store: "", distributor: "", coachID: (FIRAuth.auth()?.currentUser?.uid)!, coachName: self.coachName, coachingGuideline: 0, date: unixTime, dateCreated: unixTime, coacheeName: self.coacheeName, coacheePosition: self.coacheePosition, coacheeEmail: self.coacheeEmail, firstManagerName: self.stManagerName, firstManagerEmail: self.stManagerEmail, firstManagerPosition: self.stManagerPosition, secondManagerName: self.ndManagerName, secondManagerEmail: self.ndManagerEmail, secondManagerPosition: self.ndManagerPosition, cdCapabilityTeamName: self.cdName, cdCapabilityTeamEmail: self.cdEmail, cdCapabilityTeamPosition: self.cdPosition)

        
        // 4
        //print(coachingItem.toAnyObject())
           
        let coachingProfilefirebase = coachingItem.toAnyObject()
        
        //simpan ke firebase
        //coachingItemRef.setValue(coachingItem.toAnyObject())
        
        //simpan ke database user
        NSUserDefaults.standardUserDefaults().setObject(self.coachName, forKey: KeyLocal.coachname)
        NSUserDefaults.standardUserDefaults().setObject(self.coacheeName, forKey: KeyLocal.coacheename)
        NSUserDefaults.standardUserDefaults().setObject(self.coachPosition, forKey: KeyLocal.position)
            
            
        let userItem = UserObject(email: self.coachEmail, name: self.coachName, position: self.coachPosition)
        let userupdatefirebase = userItem.toAnyObject()
          
        //simpen ke firebase
        //userItemRef.updateChildValues(userItem.toAnyObject() as! [NSObject : AnyObject])
        
        self.performSegueWithIdentifier("profileToMainmenu", sender: nil)
        
        }
        else{
            errorAlert("Oops!", message: "Please fill all the field")
        }
        
    }
    
    
    func savetoCoreData(cell: ButtonCellOf<String>, row: ButtonRow){
        
        // Baca Input dari form
        
        let dict = form.values()
        
        if let nama = dict["coachName"] as? String
        {
            self.coachName = nama
        }
        if let nama = dict["coachEmail"] as? String
        {
            self.coachEmail = nama
        }
        
        if let nama = dict["coacheeName"] as? String
        {
            self.coacheeName = nama
        }
        if let email = dict["coacheeEmail"] as? String
        {
            self.coacheeEmail = email
        }
        
        if let nama = dict["stManagerName"] as? String
        {
            self.stManagerName = nama
        }
        if let email = dict["stManagerEmail"] as? String
        {
            self.stManagerEmail = email
        }
        
        if let nama = dict["ndManagerName"] as? String
        {
            self.ndManagerName = nama
        }
        
        if let email = dict["ndManagerEmail"] as? String
        {
            self.ndManagerEmail = email
        }
        
        if let nama = dict["cdCapabilityName"] as? String
        {
            self.cdName = nama
        }
        if let email = dict["cdCapabilityEmail"] as? String
        {
            self.cdEmail = email
        }
        let unixTime = NSDate().timeIntervalSince1970
        let unixTimeS = String(unixTime)
        
        
        //cek apakah form sudah komplit
        
        if self.coacheeName != "" && self.coacheeEmail != "" && self.stManagerName != "" && self.stManagerEmail != "" && self.ndManagerName != "" && self.ndManagerEmail != "" && self.cdName != "" && self.cdEmail != "" && self.coacheePosition != "" && self.stManagerPosition != "" && self.ndManagerPosition != "" && self.cdPosition != "" {
            print("pencet")
            
            // setting key session buat id coaching
            rootRef = FIRDatabase.database().reference()
            let itemsRef = rootRef.child("coachingSession")
            let coachingItemRef = itemsRef.childByAutoId()
            
            print("generateID")
            print(coachingItemRef.key)
            NSUserDefaults.standardUserDefaults().setValue(coachingItemRef.key, forKey: KeyLocal.coachingSession)
            
            
            // Setting Core Object
            
            let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedObjectContext = delegate.managedObjectContext
            let entity = NSEntityDescription.entityForName("CoachingSession", inManagedObjectContext: managedObjectContext)
            let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
            
            
            
            managedObject.setValue(self.coachName, forKey: "coachName")
            managedObject.setValue(self.userid, forKey: "coachID")
            managedObject.setValue(self.coacheeName, forKey: "coacheeName")
            managedObject.setValue(self.coacheeEmail, forKey: "coacheeEmail")
            managedObject.setValue(self.coacheePosition, forKey: "coacheePosition")
            managedObject.setValue(self.stManagerName, forKey: "firstManagerName")
            managedObject.setValue(self.stManagerEmail, forKey: "firstManagerEmail")
            managedObject.setValue(self.stManagerPosition, forKey: "firstManagerPosition")
            
            managedObject.setValue(self.ndManagerName, forKey: "secondManagerName")
            managedObject.setValue(self.ndManagerEmail, forKey: "secondManagerEmail")
            managedObject.setValue(self.ndManagerPosition, forKey: "secondManagerPosition")
            
            managedObject.setValue(self.cdName, forKey: "cdCapabilityTeamName")
            managedObject.setValue(self.cdEmail, forKey: "cdCapabilityTeamEmail")
            managedObject.setValue(self.cdPosition, forKey: "cdCapabilityTeamPosition")
            
            managedObject.setValue("", forKey: "distributor")
            managedObject.setValue("", forKey: "area")
            managedObject.setValue("", forKey: "store")
            
            managedObject.setValue(unixTimeS, forKey: "dateCreated")
            managedObject.setValue(coachingItemRef.key, forKey: "id")
            
            NSUserDefaults.standardUserDefaults().setObject(self.coachName, forKey: KeyLocal.coachname)
            NSUserDefaults.standardUserDefaults().setObject(self.coacheeName, forKey: KeyLocal.coacheename)
            NSUserDefaults.standardUserDefaults().setValue(coachingItemRef.key, forKey: KeyLocal.coachingSession)
            
            self.clearCookies()
            
            do {
                try managedObjectContext.save()
                self.performSegueWithIdentifier("profileToMainmenu", sender: nil)
            }
                
            catch let error as NSError {
                print(error)
                self.errorAlert("Oops!", message: "profile not save")
            }
            
        }
        else{
            self.errorAlert("Oops!", message: "Please fill all the field")
        }
    }
    
    func clearCookies(){
        
        NSUserDefaults.standardUserDefaults().removeObjectForKey("store")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("area")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("distributor")
        
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_1a")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_1b")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_2a")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_2b")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_3a")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_4a")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_5a")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_6a")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_6b")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_6c")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_6d")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_7a")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_7b")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_7c")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1fa_done")
        
    }
    
    
    func errorAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
}
//
//  coachingSummary.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/31/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import Eureka
import FirebaseAuth
import FirebaseDatabase
import CoreData


class CoachingSummary : FormViewController {
    
    var summary1 : String = ""
    var summary2 : String = ""
    var summary3 : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
        }
        ButtonRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            let orangeView = UIView()
            orangeView.backgroundColor = .orangeColor()
            cell.selectedBackgroundView = orangeView
            cell.backgroundColor = .orangeColor()
            cell.textLabel?.textColor = .whiteColor()
        }
        
        
        form = Section(){
            section in
            var footer = HeaderFooterView<UITableViewHeaderFooterView>(.Class)
            footer.onSetupView = {view in
                view.view.textLabel!.text = "**The following questions is a guidelines for you to coach the team to develop better"
                view.view.textLabel!.textColor = UIColor.orangeColor()
                view.view.textLabel?.numberOfLines = 2
                view.view.textLabel?.textAlignment = NSTextAlignment.Center
                view.view.textLabel!.font = UIFont.italicSystemFontOfSize(9)
            }
            footer.height = {30}
            section.footer = footer
            }
            <<< SegmentedRow<String>("segments"){
                $0.options = ["Coaching History"]
                $0.value = "Coaching History"
                }.cellUpdate({ (cell, row) in
                    cell.tintColor = .orangeColor()
                })
            +++ Section()
            <<< LabelRow(){
                $0.title = "Coach\t: \(NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coachname) as String! )"
            }
            <<< LabelRow(){
                $0.title = "Coachee\t: \(NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coacheename) as String! )"
            }
            <<< LabelRow(){
                $0.title = "Distributor\t:\(NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.distributor) as String! )"

            }
            <<< LabelRow(){
                $0.title = "Area\t\t:\(NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.area) as String! )"
            }
        
            +++ Section(){
                $0.header = HeaderFooterView<Question1>(HeaderFooterProvider.Class)
            }
            <<< TextAreaRow(){
                $0.tag = "summary1"
                $0.placeholder = "Enter Text"
                $0.textAreaHeight = .Dynamic(initialTextViewHeight: 100)
                }
            +++ Section(){
                $0.header = HeaderFooterView<Question2>(HeaderFooterProvider.Class)
            }
            <<< TextAreaRow(){
                $0.tag = "summary2"
                $0.placeholder = "Enter Text"
                $0.textAreaHeight = .Dynamic(initialTextViewHeight: 100)
                }
            +++ Section(){
                $0.header = HeaderFooterView<Question3>(HeaderFooterProvider.Class)
            }
            <<< TextAreaRow(){
                $0.tag = "summary3"
                $0.placeholder = "Enter Text"
                $0.textAreaHeight = .Dynamic(initialTextViewHeight: 100)
                }
        
            <<< ButtonRow() {row in
                row.title = "Save"
                row.onCellSelection(self.savetoCoreData)
            }
        
        
        
    }
    func savetoCoreData(cell: ButtonCellOf<String>, row: ButtonRow){
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        let dict = form.values()
        
        if let summary1 = dict["summary1"] as? String
        {
            self.summary1 = summary1
        }
        if let summary2 = dict["summary2"] as? String
        {
            self.summary2 = summary2
        }
        
        if let summary3 = dict["summary3"] as? String
        {
            self.summary3 = summary3
        }
        
        let coachingGuideline = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coachingGuideline)
        print("guideline:",coachingGuideline)
        
        if coachingGuideline! == "1"{
            
            self.saveQuestionData("", questionID: "dsr_summary_1",textAnswer: self.summary1,tickAnswer: false, id: csession)
            self.saveQuestionData("", questionID: "dsr_summary_2",textAnswer: self.summary2,tickAnswer: false, id: csession)
            self.saveQuestionData("", questionID: "dsr_summary_3",textAnswer: self.summary3,tickAnswer: false, id: csession)
        }
        else if coachingGuideline! == "2"{
            
            self.saveQuestionData("", questionID: "fa_summary_1",textAnswer: self.summary1,tickAnswer: false, id: csession)
            self.saveQuestionData("", questionID: "fa_summary_1",textAnswer: self.summary2,tickAnswer: false, id: csession)
            self.saveQuestionData("", questionID: "fa_summary_1",textAnswer: self.summary3,tickAnswer: false, id: csession)
        }

        let connected = Reachability.isConnectedToNetwork()
        
        if connected{
            print("there is internet connection, save to firebase")
            self.savecoachingtofirebase(csession)
            self.saveformtofirebase(csession)
            //self.showMessage("Report save", message: "Laporan berhasil disimpan ke sistem")
            self.performSegueWithIdentifier("summaryToProfile", sender: nil)
        }
        else{
            print("no internet connection, save to local")
             self.updateCoachingData(self.summary3, id: csession)
             self.performSegueWithIdentifier("summaryToProfile", sender: nil)
        }

    }
    
    func savecoachingtofirebase(id:String){

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "CoachingSession")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        print("masuk 1")
        do {
            let result = try managedContext.executeFetchRequest(fetchRequest)
            print("masuk 2")
            if (result.count > 0) {
                print("masuk 3")
                let coachingsession = result[0] as! NSManagedObject
                    
                if let coachName = coachingsession.valueForKey("coachName"),
                let coachID = coachingsession.valueForKey("coachID"),
                let coacheeName = coachingsession.valueForKey("coacheeName"),
                let coacheeEmail = coachingsession.valueForKey("coacheeEmail"),
                let coacheePosition = coachingsession.valueForKey("coacheePosition"),
                let stManagerName = coachingsession.valueForKey("firstManagerName"),
                let stManagerEmail = coachingsession.valueForKey("firstManagerEmail"),
                let stManagerPosition = coachingsession.valueForKey("firstManagerPosition"),
                let ndManagerName = coachingsession.valueForKey("secondManagerName"),
                let ndManagerEmail =  coachingsession.valueForKey("secondManagerEmail"),
                let ndManagerPosition = coachingsession.valueForKey("secondManagerPosition"),
                let cdName = coachingsession.valueForKey("cdCapabilityTeamName"),
                let cdEmail = coachingsession.valueForKey("cdCapabilityTeamEmail"),
                let cdPosition = coachingsession.valueForKey("cdCapabilityTeamPosition"),
                let dateCreated = coachingsession.valueForKey("dateCreated"),
                let coachingGuideline = coachingsession.valueForKey("coachingGuideline"),
                let area = coachingsession.valueForKey("area"),
                let distributor = coachingsession.valueForKey("distributor")
                {
                    print("masuk 4")
                    let rootRef = FIRDatabase.database().reference()
                    let itemsRef = rootRef.child("coachingSession")
                    let coachingItemRef = itemsRef.child(id)

                    let dateCreatedt = (dateCreated as! NSString).doubleValue
                    let unixTime = NSDate().timeIntervalSince1970
                    
                    let coachingItem = CoachingObject(action: self.summary3 , area: area as! String, store: "", distributor: distributor as! String, coachID: coachID as! String, coachName: coachName as! String, coachingGuideline: coachingGuideline as! Int, date: unixTime, dateCreated: dateCreatedt, coacheeName: coacheeName as! String, coacheePosition: coacheePosition as! String, coacheeEmail: coacheeEmail as! String, firstManagerName: stManagerName as! String, firstManagerEmail: stManagerEmail as! String, firstManagerPosition: stManagerPosition as! String, secondManagerName: ndManagerName as! String, secondManagerEmail: ndManagerEmail as! String, secondManagerPosition: ndManagerPosition as! String, cdCapabilityTeamName: cdName as! String, cdCapabilityTeamEmail: cdEmail as! String, cdCapabilityTeamPosition: cdPosition as! String)
                    
                    print(coachingItem.toAnyObject())
                    
                    //simpan ke firebase
                    print("simpan coaching session:")
                    //print(coachingItemRef)
                    //print(coachingItem.toAnyObject())
                    coachingItemRef.setValue(coachingItem.toAnyObject())
                    
                    managedContext.deleteObject(coachingsession)
                    try managedContext.save()
                }
                
            }
           
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func saveformtofirebase(id:String){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        //fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        
        do {
            let result = try managedContext.executeFetchRequest(fetchRequest)
            var questionarray = [AnyObject]()
            let rootRef = FIRDatabase.database().reference()
            let itemsRef = rootRef.child("coachingQuestionAnswer")
            let questionItemRef = itemsRef.child(id)
            
            for i in 1...result.count {
                
                let qasession = result[i-1] as! NSManagedObject
                
                if qasession.valueForKey("id") as! String == id{
                
                if let columnID = qasession.valueForKey("columnID"),
                    let questionID = qasession.valueForKey("questionID"),
                    let textAnswer = qasession.valueForKey("textAnswer"),
                    let tickAnswer = qasession.valueForKey("tickAnswer")
                {
                    
                    let question1 = QuestionObject(columnID: columnID as! String, questionID: questionID as! String, textAnswer: textAnswer as! String, tickAnswer: tickAnswer as! Bool)
                    
                    questionarray.append(question1.toAnyObject())
                    managedContext.deleteObject(qasession)
                }
                    try managedContext.save()
                }
                
            }
            //simpan ke firebase
            questionItemRef.setValue(questionarray)
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func saveQuestionData(columnID: String, questionID: String, textAnswer: String, tickAnswer:Bool, id: String) {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("CoachingQuestionAnswer", inManagedObjectContext: managedObjectContext)
        let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        
        managedObject.setValue(columnID, forKey: "columnID")
        managedObject.setValue(questionID, forKey: "questionID")
        managedObject.setValue(textAnswer, forKey: "textAnswer")
        managedObject.setValue(tickAnswer, forKey: "tickAnswer")
        managedObject.setValue(id, forKey: "id")
        
        do {
            try managedObjectContext.save()
        }

        catch let error as NSError {
            print(error)
        }
        
    }
    
    func updateCoachingData(action: String, id: String) {
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "CoachingSession")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        
        do {
            if let fetchResults = try appDel.managedObjectContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            {
                if fetchResults.count != 0{
                    
                    let managedObject = fetchResults[0]
                    managedObject.setValue(action, forKey: "action")
                    
                    try context.save()
                }
            }
        }
        catch {
            print(error)
        }
    }
    
    func showMessage(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Cannot add product",
                                      message: "You reach maximum number of product",
                                      preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Ok",
                                         style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addAction(cancelAction)
        presentViewController(alert,
                              animated: true,
                              completion: nil)
        
    }
    
}

class Question1: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 10, y: 0, width: 320, height: 50)
        let label = UILabel(frame: self.frame)
        // setup the label as you wish here
        label.text = "Apa yang telah dilakukan dengan baik" // label name
        label.font = UIFont(name: "Arial", size: 14) // Font
        label.textColor = UIColor.blackColor() // label textColor
        label.textAlignment = NSTextAlignment.Left // label Alignment
        // end label setup
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Question2: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 10, y: 0, width: 320, height: 50)
        let label = UILabel(frame: self.frame)
        // setup the label as you wish here
        label.text = "Apa yang perlu ditingkatkan" // label name
        label.font = UIFont(name: "Arial", size: 14) // Font
        label.textColor = UIColor.blackColor() // label textColor
        label.textAlignment = NSTextAlignment.Left // label Alignment
        // end label setup
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Question3: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 10, y: 0, width: 320, height: 50)
        let label = UILabel(frame: self.frame)
        // setup the label as you wish here
        label.text = "Apa yang perlu dilakukan untuk perbaikan" // label name
        label.font = UIFont(name: "Arial", size: 14) // Font
        label.textColor = UIColor.blackColor() // label textColor
        label.textAlignment = NSTextAlignment.Left // label Alignment
        // end label setup
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//
//  syncCell.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/14/16.
//  Copyright © 2016 baim. All rights reserved.
//

import UIKit
import FirebaseDatabase
import CoreData
import MessageUI

class syncCell: UITableViewCell {

    @IBOutlet var Coache: UILabel!
    @IBOutlet var Date: UILabel!
    @IBOutlet var Action: UILabel!

    //variabel untuk print pdf
    var invoiceComposer: PDFFormComposer!
    var HTMLContent: String!
    var pdfFilename: String!


    var csession: String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func syncActivity(sender: UIButton) {
        sender.hidden = true
        showSyncAlert()
    }
    
    func showSyncAlert() {
        
        //cek jenis report dulu
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "CoachingSession")
        fetchRequest.predicate = NSPredicate(format: "id = %@", csession)
        do{
            let result = try managedContext.executeFetchRequest(fetchRequest)
            if (result.count > 0) {
                let coachingsession = result[0] as! NSManagedObject
                let coachingGuideline = coachingsession.valueForKey("coachingGuideline") as! Int
                
                if coachingGuideline == 1{
                    createDSRAsHTML()
                    invoiceComposer.exportHTMLContentToPDF(HTMLContent,filename: csession)
                }
                else if coachingGuideline == 2{
                    createFASAAsHTML()
                    invoiceComposer.exportHTMLContentToPDF(HTMLContent,filename: csession)
                }
            }
        }
        catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

        
        let sendMailErrorAlert = UIAlertView(title: "Report generated", message: "Your report will be send to mail: "+Coache.text!+":"+csession, delegate: self, cancelButtonTitle: "OK")

        savecoachingtofirebase(csession)
        saveformtofirebase(csession)
        sendMailErrorAlert.show()
    }
    
    func savecoachingtofirebase(id:String){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "CoachingSession")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        do {
            let result = try managedContext.executeFetchRequest(fetchRequest)
            if (result.count > 0) {
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
                    let rootRef = FIRDatabase.database().reference()
                    let itemsRef = rootRef.child("coachingSession")
                    let coachingItemRef = itemsRef.child(id)
                    
                    let dateCreatedt = (dateCreated as! NSString).doubleValue
                    let unixTime = NSDate().timeIntervalSince1970
                    
                    var action = ""
                    if let aksi = coachingsession.valueForKey("action"){
                        action = aksi as! String
                    }
                    
                    let coachingItem = CoachingObject(action: action , area: area as! String, store: "", distributor: distributor as! String, coachID: coachID as! String, coachName: coachName as! String, coachingGuideline: coachingGuideline as! Int, date: unixTime, dateCreated: dateCreatedt, coacheeName: coacheeName as! String, coacheePosition: coacheePosition as! String, coacheeEmail: coacheeEmail as! String, firstManagerName: stManagerName as! String, firstManagerEmail: stManagerEmail as! String, firstManagerPosition: stManagerPosition as! String, secondManagerName: ndManagerName as! String, secondManagerEmail: ndManagerEmail as! String, secondManagerPosition: ndManagerPosition as! String, cdCapabilityTeamName: cdName as! String, cdCapabilityTeamEmail: cdEmail as! String, cdCapabilityTeamPosition: cdPosition as! String)
                    
                    print(coachingItem.toAnyObject())
                    
                    //simpan ke firebase
                    print("simpan coaching session:")
                    //print(coachingItemRef)
                    //print(coachingItem.toAnyObject())
                    coachingItemRef.setValue(coachingItem.toAnyObject())
                    
                    //managedContext.deleteObject(coachingsession)
                    //try managedContext.save()
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
                        //managedContext.deleteObject(qasession)
                    }
                    //try managedContext.save()
                }
                
            }
            //simpan ke firebase
            questionItemRef.setValue(questionarray)
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func createFASAAsHTML() {
        invoiceComposer = PDFFormComposer()
        if let invoiceHTML = invoiceComposer.renderFASA(self.Date.text!,coachee: self.Coache.text!,csession: self.csession){
            HTMLContent = invoiceHTML
        }
    }
    
    func createDSRAsHTML() {
        invoiceComposer = PDFFormComposer()
        if let invoiceHTML = invoiceComposer.renderDSR(self.Date.text!,coachee: self.Coache.text!,csession: self.csession){
            HTMLContent = invoiceHTML
        }
    }
    
}

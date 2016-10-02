//
//  page2.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/14/16.
//  Copyright © 2016 baim. All rights reserved.
//

import UIKit
import CoreData
import MessageUI

class page2: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var coachingArray:[coaching] = [coaching]()
    var coachingCoreData = [NSManagedObject]()

    @IBOutlet var coacheLabel: UILabel!
    @IBOutlet var DateLabel: UILabel!
    @IBOutlet var actionLabel: UILabel!
    
    @IBOutlet var tableSync: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(AppDelegate.getAppDelegate().getDocDir())
        
        var userID = ""
        
        //ini masalah klo blom di declare di awal
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.uid){
            userID = temp as! String
        }
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "CoachingSession")
        fetchRequest.predicate = NSPredicate(format: "coachID = %@", userID)
        print("id:",userID)
        do {
            let result = try managedContext.executeFetchRequest(fetchRequest)
            for i in 1...result.count {
                

                let syncnumber = result[i-1] as! NSManagedObject
                var action = ""
                
                if let coacheeEmail = syncnumber.valueForKey("coacheeEmail"),
                    let dateCreated = syncnumber.valueForKey("dateCreated"),
                    let csession = syncnumber.valueForKey("id")
                {
                   
                    let dateCreatedt = (dateCreated as! NSString).doubleValue
                    let date = NSDate(timeIntervalSince1970: dateCreatedt)
                    
                    let formatter = NSDateFormatter()
                    formatter.dateFormat = "dd-MM-yyyy"
                    let stringDate: String = formatter.stringFromDate(date)
                    
                    if let aksi = syncnumber.valueForKey("action"){
                        action = aksi as! String
                    }
                    
                    let coachingGuideline = syncnumber.valueForKey("coachingGuideline") as! Int
                    
                    if coachingGuideline == 1 || coachingGuideline == 2 {
                        saveData(coacheeEmail as! String, date: stringDate, action: action, csession: csession as! String)
                    }
                    
                    
                }
                try managedContext.save()
            }
        }
        catch let error as NSError {
            print("Could not sync \(error), \(error.userInfo)")
        }
        
        
        //saveData("abdi", date: "10-8-2016", action: "mayan lah")
        //saveData("umar", date: "10-8-2016", action: "perlu ditingkatkan")
        //let coache1 = coaching(coache: "baim", date: "10-8-2016", action: "udah bagus")
        //let coache2 = coaching(coache: "alex", date: "11-8-2016", action: "jelek")
        //let coache3 = coaching(coache: "abdi", date: "13-8-2016", action: "kurang rajin")
        //let coache4 = coaching(coache: "ekuda", date: "15-8-2016", action: "eee...")
        
        //coachingArray.append(coache1)
        //coachingArray.append(coache2)
        //coachingArray.append(coache3)
        //coachingArray.append(coache4)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return coachingCoreData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableSync.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! syncCell
        
        let coache = coachingCoreData[indexPath.row]
        
        cell.Coache.text = coache.valueForKey("coachName") as? String
        cell.Date.text = coache.valueForKey("date") as? String
        cell.Action.text = coache.valueForKey("action") as? String
        cell.csession = (coache.valueForKey("csession") as? String)!
        
        return cell
    }
    

    @IBAction func syncAction(sender: AnyObject) {
        //let mailComposeViewController = configuredMailComposeViewController()
        //if MFMailComposeViewController.canSendMail() {
          //  self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        //} else {
        //    self.showSendMailErrorAlert()
        //}
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        
        //set recepient
        mailComposerVC.setToRecipients(["bim.alf@gmail.com"])
        mailComposerVC.setSubject("Sending you an in-app e-mail...")
        mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    func showSyncAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Report Sent", message: "Your report already sent into mail", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func saveData(coache: String, date:String, action:String, csession:String) {
     //1
     let appDelegate =
     UIApplication.sharedApplication().delegate as! AppDelegate
     
     let managedContext = appDelegate.managedObjectContext
     
     //2
     let entity =  NSEntityDescription.entityForName("SyncSession",
     inManagedObjectContext:managedContext)
     
     let chistory = NSManagedObject(entity: entity!,
     insertIntoManagedObjectContext: managedContext)
     
     //3
     chistory.setValue(coache, forKey: "coachName")
     chistory.setValue(date, forKey: "date")
     chistory.setValue(action, forKey: "action")
     chistory.setValue(csession, forKey: "csession")
     
     //4
     do {
     try managedContext.save()
     //5
     coachingCoreData.append(chistory)
     } catch let error as NSError  {
     print("Could not save \(error), \(error.userInfo)")
     }
     }
    
    func sendEmail(pathfile:String, filename: String, subject:String) {
        if MFMailComposeViewController.canSendMail() {
            
            let mailComposeViewController = MFMailComposeViewController()
            mailComposeViewController.setSubject(subject)
            mailComposeViewController.addAttachmentData(NSData(contentsOfFile: pathfile)!, mimeType: "application/pdf", fileName: filename)
            presentViewController(mailComposeViewController, animated: true, completion: nil)
            
        }
    }

}


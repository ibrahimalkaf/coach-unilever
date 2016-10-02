//
//  coachHistory.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/14/16.
//  Copyright © 2016 baim. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class coachHistory: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var coachingArray:[coaching] = [coaching]()
    
    @IBOutlet var tableHistory: UITableView!
    override func viewDidLoad() {
        
        let uid = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.uid)
        let myRoot = FIRDatabase.database().reference()
        let refcoachingSession = myRoot.child("coachingSession")
        
        // Attach a closure to read the data at our posts reference
        if Reachability.isConnectedToNetwork(){
        
        print(refcoachingSession)
        refcoachingSession.queryOrderedByChild("coachID").observeEventType(.ChildAdded, withBlock: { snapshot in
            //print("uid:",uid)
            //print("key:",snapshot.key)
            //print("cID:",snapshot.value!["coachID"])
            if uid == snapshot.value!["coachID"] as? String {
                //print("\(snapshot.key) : \(uid) userid")
                print("action: \(snapshot.value!["action"])")
                print("coachName: \(snapshot.value!["coachName"])")
                let coachename = snapshot.value!["coacheeName"] as! String
                let action = snapshot.value!["action"] as! String
                let datejson = snapshot.value!["date"] as! Double
                let date = NSDate(timeIntervalSince1970: datejson)
                
                let dayTimePeriodFormatter = NSDateFormatter()
                dayTimePeriodFormatter.dateFormat = "dd-MMM-YYYY"
                let dateString = dayTimePeriodFormatter.stringFromDate(date)
                
                //print("ini",coachename, dateString, action)
                let objtemp = coaching(coache: coachename, date: dateString, action: action)
                self.coachingArray.append(objtemp)
                self.tableHistory.reloadData()
            }
        })
        
        }
        

        //let coache1 = coaching(coache: "baim", date: "10-8-2016", action: "udah bagus")
        //let coache2 = coaching(coache: "alex", date: "11-8-2016", action: "jelek")
        //let coache3 = coaching(coache: "abdi", date: "13-8-2016", action: "kurang rajin")
        //let coache4 = coaching(coache: "ekuda", date: "15-8-2016", action: "eee...")
        
        //coachingArray.append(coache1)
        //coachingArray.append(coache2)
        //coachingArray.append(coache3)
        //coachingArray.append(coache4)

        // Do any additional setup after loading the view.
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return coachingArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableHistory.dequeueReusableCellWithIdentifier("CHistory", forIndexPath: indexPath) as! syncCell
        
        let coache = coachingArray[indexPath.row]
        
        cell.Coache.text = coache.coache
        cell.Date.text = coache.date
        cell.Action.text = coache.action
        
        return cell
    }

    
    @IBAction func nextToForm(sender: UIButton) {
        let coachingGuideline = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coachingGuideline)
        print("guideline:",coachingGuideline)
        
        if coachingGuideline! == "1"{
            
            //bersihin nsuserdsr dulu
            self.performSegueWithIdentifier("toDSR", sender: nil)
        }
        else if coachingGuideline! == "2"{
            
            //bersihin nsuserfasa dulu
            self.performSegueWithIdentifier("toFASA", sender: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

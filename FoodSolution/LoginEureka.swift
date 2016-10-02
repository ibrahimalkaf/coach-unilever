//
//  LoginEureka.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/30/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import Eureka
import FirebaseAuth
import FirebaseDatabase


class LoginEureka : FormViewController {
    
    var email: String = ""
    var password : String = ""
    var position : String = ""
    var rootRef: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NSUserDefaults.standardUserDefaults().setObject(10, forKey: KeyLocal.numberUnsync)
        ImageRow.defaultCellUpdate = { cell, row in
            cell.accessoryView?.layer.cornerRadius = 17
            cell.accessoryView?.frame = CGRectMake(0, 0, 34, 34)
        }
        
        
        form =
            Section()
            
            +++ Section(){
                $0.header = HeaderFooterView<FoodLogoView>(HeaderFooterProvider.Class)
            }
            
            <<< ButtonRow(){
                $0.title = "Unilever Indonesia Coaching Appication"
                $0.disabled = true
                }
                .cellUpdate { cell, row in
                    cell.backgroundColor = self.UIColorFromRGB(0x209624)
                    cell.textLabel?.font = UIFont.systemFontOfSize(12)
                    cell.textLabel?.numberOfLines = 1
                    cell.textLabel?.textAlignment = .Center
                    cell.textLabel?.textColor = .whiteColor()
            }
            
            +++ Section()
            
            <<< TextRow("email"){
                $0.title = "Email"
                $0.tag = "emailtext"
                
            }.cellSetup { cell, row in
                    cell.titleLabel?.highlightedTextColor = .orangeColor()
            }
            
            <<< PasswordRow("password"){
                $0.title = "Password"
                $0.tag = "passwordtext"
            }.cellSetup { cell, row in
                    cell.titleLabel?.highlightedTextColor = .orangeColor()
            }
            
            <<< AlertRow<String>() {
                $0.title = "Position"
                $0.selectorTitle = "Select Position"
                $0.options = ["Managing Director","NSM Push","NSM Pull","NSM Chain","NSM Hotel","CD Capability Building Manager","RSM Pull","RSM Push","ASM Pull","ASM Push","Asst. CD Capability Building Manager","DTS Push","SR Pull Bareca","SR Pull Hotel","OM Dist.","DSS","DSR","CD Ops Manager","Asst. CD Ops Manager","Supply Chain","Marketing","Finance","Chef","R&D"]
                $0.value = "Select Position"
                }.onChange { row in
                    print(row.value)
                    self.position = row.value as String!
                }
                .onPresent{ _, to in
                    to.view.tintColor = .orangeColor()
            }
            
            +++ Section()
            <<< ButtonRow() {
                $0.title = "Login"
                $0.onCellSelection(self.loginUser)
                }.cellSetup() {cell, row in
                    cell.backgroundColor = UIColor.orangeColor()
                    cell.tintColor = UIColor.whiteColor()
            }
            
            +++ Section()
            <<< ButtonRow(){
                $0.title = "Coaching at Your Fingertips\n“Coach the team regularly, for best performance”"
                $0.disabled = true
            }
            .cellUpdate { cell, row in
                cell.backgroundColor = self.UIColorFromRGB(0x209624)
                cell.textLabel?.font = UIFont.systemFontOfSize(12)
                cell.textLabel?.numberOfLines = 2
                cell.textLabel?.textAlignment = .Center
                cell.textLabel?.textColor = .whiteColor()
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       
        //uncomment untuk sesi otomatis login
        
        /*
        FIRAuth.auth()!.addAuthStateDidChangeListener() { (auth, user) in
            if let user = user {
                print("User is signed in with uid:", user.uid)
                print("user", user.displayName, " : ",user.email)
                NSUserDefaults.standardUserDefaults().setValue(user.uid, forKey: KeyLocal.uid)
                NSUserDefaults.standardUserDefaults().setValue(user.email, forKey: KeyLocal.email)
                
                if let object = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.numberUnsync) {
                    
                    self.performSegueWithIdentifier("coachingSync", sender: nil)
                    
                }
                else{
                    self.performSegueWithIdentifier("loginToProfile", sender: nil)
                }
            } else {
                print("No user is signed in.")
            }
        }*/
    }
    
    func loginUser(cell: ButtonCellOf<String>, row: ButtonRow) {
        
        rootRef = FIRDatabase.database().reference()
        let itemsRef = rootRef.child("userData")
        
        let dict = form.values()
        
        if let email = dict["emailtext"] as? String
        {
            self.email = email
            //print(nama) //should print only "Comments"
        }
        if let password = dict["passwordtext"] as? String
        {
            self.password = password
        }

        
        if self.email != "" && self.password != "" {
            
            // Login with the Firebase's authUser method
            
            FIRAuth.auth()?.signInWithEmail(self.email, password: self.password, completion:  { user,error in
                
                if error != nil {
                    print(error)
                    self.loginErrorAlert("Oops!", message: "Check your username and password.")
                } else {
                    
                    
                    // Be sure the correct uid is stored.
                    NSUserDefaults.standardUserDefaults().setValue(user?.uid, forKey: KeyLocal.uid)
                    NSUserDefaults.standardUserDefaults().setValue(self.email, forKey: KeyLocal.email)
                    NSUserDefaults.standardUserDefaults().setValue(self.position, forKey: KeyLocal.position)
                    
                    /*
                    //store user in user json
                    let userDataRef = itemsRef.child((user?.uid)!)
                    let userObject = UserObject(email: self.email, name: self.email, position: self.position)
                    userDataRef.setValue(userObject.toAnyObject())
                    */
                    
                    // Enter the app!
                    //cek apakah ada yang belum di sync
                    
                    if let object = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.numberUnsync) {
                        
                        let number = object as! Bool
                        if number {
                            self.performSegueWithIdentifier("coachingSync", sender: nil)
                        }
                        else{
                            self.performSegueWithIdentifier("loginToProfile", sender: nil)
                        }
                        
                    }
                    else{
                        self.performSegueWithIdentifier("loginToProfile", sender: nil)
                    }
                }
            })
            
        } else {
            loginErrorAlert("Oops!", message: "Don't forget to enter your email and password.")
        }
        
    }
    
    func loginErrorAlert(title: String, message: String) {
        
        // Called upon login error to let the user know login didn't work.
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
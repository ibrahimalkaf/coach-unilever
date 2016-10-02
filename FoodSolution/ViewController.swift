//
//  ViewController.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/14/16.
//  Copyright © 2016 baim. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    
    @IBOutlet var position: UIPickerView!
    var jabatan = ["Select Position","Managing Director","NSM Push","NSM Pull","NSM Chain","NSM Hotel","CD Capability Building Manager","RSM Pull","RSM Push","ASM Pull","ASM Push","Asst. CD Capability Building Manager","DTS Push","SR Pull Bareca","SR Pull Hotel","OM Dist.","DSS","DSR","CD Ops Manager","Asst. CD Ops Manager","Supply Chain","Marketing","Finance","Chef","R&D"]
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    var myRootRef: FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        myRootRef = FIRDatabase.database().reference()
        self.position.delegate = self
        self.position.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func login(sender: AnyObject) {
        FIRAuth.auth()?.signInWithEmail(email.text!, password: password.text!, completion: {
            user,error in
            if error != nil{
                let alertController2 = UIAlertController(title: "oops!", message: "sorry cannot login", preferredStyle: .Alert)
                
                let defaultAction2 = UIAlertAction(title: "Ok", style: .Cancel, handler: nil)
                
                alertController2.addAction(defaultAction2)
                self.presentViewController(alertController2, animated: true, completion: nil)
            }
            else{
                self.myRootRef.observeEventType(.Value, withBlock: {
                    snapshot in
                    //var newItems = [GroceryItem]()
                    
                    print("\(snapshot.key) -> \(snapshot.value)")
                })
                
                //NSUserDefaults.standardUserDefaults().setValue(, forKey: "uid")
                let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("CoachSync") as UIViewController
                self.presentViewController(viewController, animated: true, completion: nil)
            }
            
            }
        )
    }
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.blackColor()
        pickerLabel.font = UIFont(name: "Arial-BoldMT", size: 12)
        pickerLabel.textAlignment = NSTextAlignment.Center
        pickerLabel.text = jabatan[row]
        return pickerLabel
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return jabatan.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return jabatan[row]
    }
}


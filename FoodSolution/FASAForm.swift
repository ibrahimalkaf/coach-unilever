//
//  FASAForm.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/18/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import Eureka
import CoreData


class FASAForm : FormViewController {
    
    var tambahanproduct = 0
    var coachingsession : String = ""
    var store : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coachname = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coachname) as String!
        let coacheename = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coacheename) as String!
        self.coachingsession = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coachingSession)!
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
        }
        CheckRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
        }
        ButtonRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textLabel?.textAlignment = NSTextAlignment.Left
            cell.textLabel?.textColor = .blackColor()
        }
        
        
        form = Section(){
                section in
                var footer = HeaderFooterView<UITableViewHeaderFooterView>(.Class)
                footer.onSetupView = {view in
                    view.view.textLabel!.text = "**The following questions is a guidelines for you to coach the team to develop better in 6P’s in Cash&Carry"
                    view.view.textLabel!.textColor = UIColor.orangeColor()
                    view.view.textLabel?.numberOfLines = 2
                    view.view.textLabel?.textAlignment = NSTextAlignment.Center
                    view.view.textLabel!.font = UIFont.italicSystemFontOfSize(9)
                }
                footer.height = {30}
                section.footer = footer
            }
            <<< SegmentedRow<String>("segments"){
                $0.options = ["In Store"]
                $0.value = "In Store"
                }.cellUpdate({ (cell, row) in
                    cell.tintColor = .orangeColor()
                })
            +++ Section()
            <<< LabelRow(){
                $0.title = "Coach\t: \(coachname)"
            }
            <<< LabelRow(){
                $0.title = "Coachee\t: \(coacheename)"
            }
            <<< TextRow(){
                $0.tag = "store"
                $0.title = "Store:"
            }
            +++ Section("Top SKU Product") { section in
                section.header = HeaderFooterView(title: "Top SKU Product")
                section.tag = "Top_SKU_Product"
                }
            <<< ButtonRow() { (row: ButtonRow) -> Void in
                row.title = "Add Product"
                }.onCellSelection({ (cell, row) in
                    self.showAlert()
                    
                }).cellUpdate({ (cell, row) in
                    cell.backgroundColor = .orangeColor()
                    }
            )
            
            <<< ButtonRow() {row in
                row.title = "Produk 1"
                row.tag = "Produk1"
                //if NSUserDefaults.standardUserDefaults().boolForKey("1fa_done"){
                //    row.title = "Produk 1 ✓"
                //    self.reloadInputViews()
                //}
                row.presentationMode = .SegueName(segueName: "FASAQ1Segue", completionCallback: nil)
            }
            <<< ButtonRow() {row in
                row.title = "Produk 2"
                //if NSUserDefaults.standardUserDefaults().boolForKey("2fa_done"){
                //    row.title = "Produk 2 ✓"
                //    self.reloadInputViews()
                //}
                row.presentationMode = .SegueName(segueName: "FASAQ2Segue", completionCallback: nil)
            }
            <<< ButtonRow() {row in
                row.title = "Produk 3"
                row.presentationMode = .SegueName(segueName: "FASAQ3Segue", completionCallback: nil)
            }
            <<< ButtonRow() {row in
                row.title = "Produk 4"
                row.presentationMode = .SegueName(segueName: "FASAQ4Segue", completionCallback: nil)
            }
            <<< ButtonRow() {row in
                row.title = "Produk 5"
                row.presentationMode = .SegueName(segueName: "FASAQ5Segue", completionCallback: nil)
        }
            <<< ButtonRow() {row in
                row.title = "Produk 6"
                row.presentationMode = .SegueName(segueName: "FASAQ6Segue", completionCallback: nil)
        }
            <<< ButtonRow() {row in
                row.title = "Produk 7"
                row.presentationMode = .SegueName(segueName: "FASAQ7Segue", completionCallback: nil)
        }
            <<< ButtonRow() {row in
                row.title = "Produk 8"
                row.presentationMode = .SegueName(segueName: "FASAQ8Segue", completionCallback: nil)
        }
            <<< ButtonRow() {row in
                row.title = "Produk 9"
                row.presentationMode = .SegueName(segueName: "FASAQ9Segue", completionCallback: nil)
        }
            <<< ButtonRow() {row in
                row.title = "Produk 10"
                row.presentationMode = .SegueName(segueName: "FASAQ10Segue", completionCallback: nil)
        }
        +++ Section()
            <<< ButtonRow("save") {row in
                row.title = "Save"
                row.onCellSelection(self.prosesToSummary)
        }
            
    }
    
    func prosesToSummary(cell: ButtonCellOf<String>, row: ButtonRow){
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        if let store = self.form.rowByTag("store")?.baseValue as? String
        {
            self.store = store
        }
        
        self.updateCoachingData(self.store, area: "none", id: csession)
        
        self.performSegueWithIdentifier("fasaToSummary", sender: nil)

    }
    
    func updateCoachingData(store: String, area: String, id: String) {
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "CoachingSession")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        
        let coachingGuideline = Int(NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coachingGuideline)!)
        
        do {
            if let fetchResults = try appDel.managedObjectContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            {
                if fetchResults.count != 0{
                    
                    let managedObject = fetchResults[0]
                    managedObject.setValue(store, forKey: "store")
                    managedObject.setValue("", forKey: "distributor")
                    managedObject.setValue(area, forKey: "area")
                    managedObject.setValue(coachingGuideline, forKey: "coachingGuideline")
                    NSUserDefaults.standardUserDefaults().setValue(store, forKey: KeyLocal.store)
                    NSUserDefaults.standardUserDefaults().setValue("", forKey: KeyLocal.distributor)
                    NSUserDefaults.standardUserDefaults().setValue(area, forKey: KeyLocal.area)
                    
                    try context.save()
                }
            }
        }
        catch {
            print(error)
        }
    }
    
    
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "SKU Product",
                                      message: "Add product",
                                      preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .Default) { (action: UIAlertAction) -> Void in
                                        
                                        let textField = alert.textFields![0]
                                        //let groceryItem = GroceryItem(name: (textField.text!), addedByUser: self.user.email, completed: false)
                                        //self.items.append(groceryItem)
                                        if (self.tambahanproduct == 0){
                                        self.form.sectionByTag("Top_SKU_Product")!
                                                <<< ButtonRow(){ row in
                                                    row.title = textField.text
                                                    row.presentationMode = .SegueName(segueName: "FASAQ11Segue", completionCallback: nil)
                                                    }
                                                self.tableView!.reloadData()
                                                self.tambahanproduct = 1;
                                        }
                                        else if (self.tambahanproduct == 1){
                                            self.form.sectionByTag("Top_SKU_Product")!
                                                <<< ButtonRow(){ row in
                                                    row.title = textField.text
                                                    row.presentationMode = .SegueName(segueName: "FASAQ12Segue", completionCallback: nil)
                                            }
                                            self.tableView!.reloadData()
                                            self.tambahanproduct = 2;
                                        }
                                        else{
                                            self.showAlert2()
                                        }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,
                              animated: true,
                              completion: nil)

    }
    
    @IBAction func showAlert2() {
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
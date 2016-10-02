//
//  MainMenuEureka.swift
//  FoodSolution
//
//  Created by baim alkaf on 9/1/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import Eureka
import FirebaseAuth


class MainMenuEureka : FormViewController {
    
    var report:String = ""
    var language:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
        }
        ButtonRow.defaultCellSetup = { cell, row in
            let orangeView = UIView()
            orangeView.backgroundColor = .orangeColor()
            cell.backgroundColor = .orangeColor()
            cell.selectedBackgroundView = orangeView
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textLabel?.textColor = .whiteColor()
        }
        
        let report = ["RSM Coaching Guideline", "ASM Push Coaching Guideline", "ASM Pull Coaching Guideline", "DTS Coaching Guideline", "SR Pull Bareca/Hotel Coaching Guideline", "DSR Coaching Guideline", "FA/SA/Merchandiser Coaching Guideline"]
        
        let language = ["Bahasa", "English"]
        
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
                $0.options = ["Choose Coaching Guidelines"]
                $0.value = "Choose Coaching Guidelines"
                }.cellUpdate({ (cell, row) in
                    cell.tintColor = .orangeColor()
                })
            
            +++ SelectableSection<ImageCheckRow<String>, String>() { section in
                section.header = HeaderFooterView(title: "Report")
                section.tag = "report"
            }
        
            for option in report {
                form.last! <<< ImageCheckRow<String>(option){ lrow in
                    
                    lrow.cell.textLabel?.font = UIFont.systemFontOfSize(12)
                    lrow.title = option
                    lrow.selectableValue = option
                    lrow.value = nil
                    lrow.cell.backgroundColor = .orangeColor()
                    lrow.cell.tintColor = .whiteColor()
                }
            }
        
            form +++ SelectableSection<ImageCheckRow<String>, String>() { section in
                section.header = HeaderFooterView(title: "Language")
                section.tag = "language"
            }
        
            for option in language {
                form.last! <<< ImageCheckRow<String>(option){ lrow in
                    
                    lrow.cell.textLabel?.font = UIFont.systemFontOfSize(12)
                    lrow.title = option
                    lrow.selectableValue = option
                    lrow.value = nil
                    lrow.cell.backgroundColor = .orangeColor()
                    lrow.cell.tintColor = .whiteColor()
                }
            }
        
            form +++ Section()
            <<< ButtonRow(){row in
               row.title = "Next"
            }.onCellSelection({ (cell, row) in
                print(self.language)
                print(self.report)
                if self.report == "Optional(\"DSR Coaching Guideline\")" && self.language == "Optional(\"Bahasa\")"{
                    
                    //setting variable dsr
                    
                    NSUserDefaults.standardUserDefaults().setValue(1, forKey: KeyLocal.coachingGuideline)
                    self.performSegueWithIdentifier("coachHistory", sender: nil)
                }
                else if self.report == "Optional(\"FA/SA/Merchandiser Coaching Guideline\")" && self.language == "Optional(\"Bahasa\")"{
                    
                    //setting variable fasa
                    NSUserDefaults.standardUserDefaults().setValue(2, forKey: KeyLocal.coachingGuideline)
                    self.performSegueWithIdentifier("coachHistory", sender: nil)
                }
                else{
                    self.errorAlert("", message: "Will be released Soon")
                }
            })
    }
    override func rowValueHasBeenChanged(row: BaseRow, oldValue: Any?, newValue: Any?) {
        if row.section === form[1] {
            let selected = "\((row.section as! SelectableSection<ImageCheckRow<String>, String>).selectedRow()?.baseValue)"
            print("Report :",selected)
            self.report = selected
            
        }
        if row.section === form[2] {
            let selected = "\((row.section as! SelectableSection<ImageCheckRow<String>, String>).selectedRow()?.baseValue)"
            print("Language :",selected)
            self.language = selected
        }
    }
    
    func errorAlert(title: String, message: String) {
        
        // Called upon login error to let the user know login didn't work.
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }

}


//
//  ASMPull.swift
//  FoodSolution
//
//  Created by baim alkaf on 10/4/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import Eureka
import Firebase
import FirebaseDatabase
import CoreData


class ASMPullForm : FormViewController {
    
    var rootRef: FIRDatabaseReference!
    var coachingsession: String = ""
    
    var distributor: String = ""
    var area: String = ""
    
    var asmpull_amstrong_a_1a: Bool = false
    var asmpull_amstrong_a_1b: Bool = false
    var asmpull_amstrong_a_1c: Bool = false
    var asmpull_amstrong_a_1d: Bool = false
    
    var asmpull_amstrong_a_2a: Bool = false
    var asmpull_amstrong_a_2b: Bool = false
    var asmpull_amstrong_a_2c: Bool = false
    var asmpull_amstrong_a_2d: Bool = false
    
    var asmpull_amstrong_a_3a: Bool = false
    var asmpull_amstrong_a_3b: Bool = false
    var asmpull_amstrong_a_3c: Bool = false
    var asmpull_amstrong_a_3d: Bool = false
    
    var asmpull_amstrong_a_4a: Bool = false
    var asmpull_amstrong_a_4b: Bool = false
    var asmpull_amstrong_a_4c: Bool = false
    var asmpull_amstrong_a_4d: Bool = false
    
    var asmpull_amstrong_a_5a: Bool = false
    var asmpull_amstrong_a_5b: Bool = false
    var asmpull_amstrong_a_5c: Bool = false
    var asmpull_amstrong_a_5d: Bool = false
    
    var asmpull_amstrong_a_6a: Bool = false
    var asmpull_amstrong_a_6b: Bool = false
    var asmpull_amstrong_a_6c: Bool = false
    var asmpull_amstrong_a_6d: Bool = false
    
    var asmpull_amstrong_a_7a: Bool = false
    var asmpull_amstrong_a_7b: Bool = false
    var asmpull_amstrong_a_7c: Bool = false
    var asmpull_amstrong_a_7d: Bool = false
    
    var asmpull_amstrong_a_8a: Bool = false
    var asmpull_amstrong_a_8b: Bool = false
    var asmpull_amstrong_a_8c: Bool = false
    var asmpull_amstrong_a_8d: Bool = false
    
    var asmpull_amstrong_b_1a: Bool = false
    var asmpull_amstrong_b_1b: Bool = false
    
    var asmpull_amstrong_b_2a: Bool = false
    var asmpull_amstrong_b_2b: Bool = false
    
    var asmpull_amstrong_b_3a: Bool = false
    var asmpull_amstrong_b_3b: Bool = false
    
    var asmpull_amstrong_b_4a: Bool = false
    var asmpull_amstrong_b_4b: Bool = false
    
    var asmpull_amstrong_b_5a: Bool = false
    var asmpull_amstrong_b_5b: Bool = false
    
    var asmpull_amstrong_b_6a: Bool = false
    var asmpull_amstrong_b_6b: Bool = false
    
    var asmpull_amstrong_b_7a: Bool = false
    var asmpull_amstrong_b_7b: Bool = false
    
    var asmpull_amstrong_b_8a: Bool = false
    var asmpull_amstrong_b_8b: Bool = false
    
    var asmpull_amstrong_b_9a: Bool = false
    var asmpull_amstrong_b_9b: Bool = false
    
    var asmpull_amstrong_b_10a: Bool = false
    var asmpull_amstrong_b_10b: Bool = false
    
    var asmpull_amstrong_b_11a: Bool = false
    var asmpull_amstrong_b_11b: Bool = false
    
    var asmpull_amstrong_b_12a: Bool = false
    var asmpull_amstrong_b_12b: Bool = false
    
    var asmpull_amstrong_b_13a: Bool = false
    var asmpull_amstrong_b_13b: Bool = false
    
    var asmpull_amstrong_b_14a: Bool = false
    var asmpull_amstrong_b_14b: Bool = false
    
    var asmpull_amstrong_b_15a: Bool = false
    var asmpull_amstrong_b_15b: Bool = false
    
    var asmpull_amstrong_b_16a: Bool = false
    var asmpull_amstrong_b_16b: Bool = false
    
    var asmpull_amstrong_b_17a: Bool = false
    var asmpull_amstrong_b_17b: Bool = false
    
    var asmpull_amstrong_b_18a: Bool = false
    var asmpull_amstrong_b_18b: Bool = false
    
    var asmpull_amstrong_b_19a: Bool = false
    var asmpull_amstrong_b_19b: Bool = false
    
    var asmpull_kapabilitas_a: Bool = false
    var asmpull_kapabilitas_b: Bool = false
    var asmpull_kapabilitas_c: Bool = false
    
    var asmpull_amstrong_a_1ar: String = ""
    var asmpull_amstrong_a_1br: String = ""
    var asmpull_amstrong_a_1cr: String = ""
    var asmpull_amstrong_a_1dr: String = ""
    
    var asmpull_amstrong_a_2ar: String = ""
    var asmpull_amstrong_a_2br: String = ""
    var asmpull_amstrong_a_2cr: String = ""
    var asmpull_amstrong_a_2dr: String = ""
    
    var asmpull_amstrong_a_3ar: String = ""
    var asmpull_amstrong_a_3br: String = ""
    var asmpull_amstrong_a_3cr: String = ""
    var asmpull_amstrong_a_3dr: String = ""
    
    var asmpull_amstrong_a_4ar: String = ""
    var asmpull_amstrong_a_4br: String = ""
    var asmpull_amstrong_a_4cr: String = ""
    var asmpull_amstrong_a_4dr: String = ""
    
    var asmpull_amstrong_a_5ar: String = ""
    var asmpull_amstrong_a_5br: String = ""
    var asmpull_amstrong_a_5cr: String = ""
    var asmpull_amstrong_a_5dr: String = ""
    
    var asmpull_amstrong_a_6ar: String = ""
    var asmpull_amstrong_a_6br: String = ""
    var asmpull_amstrong_a_6cr: String = ""
    var asmpull_amstrong_a_6dr: String = ""
    
    var asmpull_amstrong_a_7ar: String = ""
    var asmpull_amstrong_a_7br: String = ""
    var asmpull_amstrong_a_7cr: String = ""
    var asmpull_amstrong_a_7dr: String = ""
    
    var asmpull_amstrong_a_8ar: String = ""
    var asmpull_amstrong_a_8br: String = ""
    var asmpull_amstrong_a_8cr: String = ""
    var asmpull_amstrong_a_8dr: String = ""
    
    var asmpull_amstrong_b_1ar: String = ""
    var asmpull_amstrong_b_1br: String = ""
    
    var asmpull_amstrong_b_2ar: String = ""
    var asmpull_amstrong_b_2br: String = ""
    
    var asmpull_amstrong_b_3ar: String = ""
    var asmpull_amstrong_b_3br: String = ""
    
    var asmpull_amstrong_b_4ar: String = ""
    var asmpull_amstrong_b_4br: String = ""
    
    var asmpull_amstrong_b_5ar: String = ""
    var asmpull_amstrong_b_5br: String = ""
    
    var asmpull_amstrong_b_6ar: String = ""
    var asmpull_amstrong_b_6br: String = ""
    
    var asmpull_amstrong_b_7ar: String = ""
    var asmpull_amstrong_b_7br: String = ""
    
    var asmpull_amstrong_b_8ar: String = ""
    var asmpull_amstrong_b_8br: String = ""
    
    var asmpull_amstrong_b_9ar: String = ""
    var asmpull_amstrong_b_9br: String = ""
    
    var asmpull_amstrong_b_10ar: String = ""
    var asmpull_amstrong_b_10br: String = ""
    
    var asmpull_amstrong_b_11ar: String = ""
    var asmpull_amstrong_b_11br: String = ""
    
    var asmpull_amstrong_b_12ar: String = ""
    var asmpull_amstrong_b_12br: String = ""
    
    var asmpull_amstrong_b_13ar: String = ""
    var asmpull_amstrong_b_13br: String = ""
    
    var asmpull_amstrong_b_14ar: String = ""
    var asmpull_amstrong_b_14br: String = ""
    
    var asmpull_amstrong_b_15ar: String = ""
    var asmpull_amstrong_b_15br: String = ""
    
    var asmpull_amstrong_b_16ar: String = ""
    var asmpull_amstrong_b_16br: String = ""
    
    var asmpull_amstrong_b_17ar: String = ""
    var asmpull_amstrong_b_17br: String = ""
    
    var asmpull_amstrong_b_18ar: String = ""
    var asmpull_amstrong_b_18br: String = ""
    
    var asmpull_amstrong_b_19ar: String = ""
    var asmpull_amstrong_b_19br: String = ""
    
    var asmpull_kapabilitas_ar: String = ""
    var asmpull_kapabilitas_br: String = ""
    var asmpull_kapabilitas_cr: String = ""
    var language : String = ""
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let coachname = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coachname) as String!
        let coacheename = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coacheemail) as String!
        //self.coachingsession = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coachingSession)!
        if let bahasa = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.language) {
            language = bahasa as String!
        }
        
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
        ButtonRow.defaultCellSetup = { cell, row in
            let orangeView = UIView()
            orangeView.backgroundColor = .orangeColor()
            cell.selectedBackgroundView = orangeView
            cell.backgroundColor = .orangeColor()
            cell.textLabel?.textColor = .whiteColor()
        }
        if language == "Optional(\"Bahasa\")" {
        
        form =  Section(){
            section in
            var footer = HeaderFooterView<UITableViewHeaderFooterView>(.Class)
            footer.onSetupView = {view in
                view.view.textLabel!.text = "**The following questions is a guidelines for you to coach\n the team to develop better in Selling Skills (Basic Call Procedure)"
                view.view.textLabel!.textColor = UIColor.orangeColor()
                view.view.textLabel?.numberOfLines = 2
                view.view.textLabel?.textAlignment = NSTextAlignment.Center
                view.view.textLabel!.font = UIFont.italicSystemFontOfSize(9)
            }
            footer.height = {30}
            section.footer = footer
            }
            
            
            
            <<< SegmentedRow<String>("segments"){
                $0.options = ["REPORT AMSTRONG", "KAPABILITAS"]
                $0.value = "REPORT AMSTRONG"
                }.cellUpdate({ (cell, row) in
                    cell.tintColor = .orangeColor()
                    cell.textLabel!.numberOfLines = 2
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                })
            
            +++ Section()
            
            <<< TextRow(){
                $0.title = "Coach\t: \(coachname)"
                $0.disabled = true
            }
            <<< TextRow(){
                $0.title = "Coachee\t: \(coacheename)"
                $0.disabled = true
            }
            <<< TextRow(){
                $0.tag = "distributor"
                $0.title = "Distributor\t:"
            }
            <<< TextRow(){
                $0.tag = "area"
                $0.title = "Area\t\t:"
            }
            
            
            +++ Section("REPORT AMSTRONG"){
                $0.header?.title = "PEMAHAMAN REPORT DI AMSTRONG"
                $0.hidden = "$segments != 'REPORT AMSTRONG'"
            }
            <<< LabelRow(){
                $0.title = "A. Minta ASM untuk menjelaskan Summary Report Achievement pada bulan ini"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                })
            <<< LabelRow(){
                $0.title = "1. Call Time Optimization"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_1a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_1ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_1b"
                $0.title = "\tb. Siapa yang terbaik di tim Anda?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_1br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_1c"
                $0.title = "\tc. Siapa yang terendah dalam tim Anda dan apa rencana peningkatannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_1cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_1d"
                $0.title = "\td. Bagiamana rencana pengembangannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_1dr"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "2. Call Period"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_2a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_2ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_2b"
                $0.title = "\tb. Siapa yang terbaik di tim Anda?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_2br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_2c"
                $0.title = "\tc. Siapa yang terendah dalam tim Anda dan apa rencana peningkatannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_2cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_2d"
                $0.title = "\td. Bagiamana rencana pengembangannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_2dr"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "3. OTM Call Frequency"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_3a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_3ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_3b"
                $0.title = "\tb. Siapa yang terbaik di tim Anda?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_3br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_3c"
                $0.title = "\tc. Siapa yang terendah dalam tim Anda dan apa rencana peningkatannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_3cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_3d"
                $0.title = "\td. Bagiamana rencana pengembangannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_3dr"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "4. Pantry Efficiency"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_4a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_4ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_4b"
                $0.title = "\tb. Siapa yang terbaik di tim Anda?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_4br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_4c"
                $0.title = "\tc. Siapa yang terendah dalam tim Anda dan apa rencana peningkatannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_4cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_4d"
                $0.title = "\td. Bagiamana rencana pengembangannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_4dr"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "5. TFO Sources"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_5a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_5ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_5b"
                $0.title = "\tb. Siapa yang terbaik di tim Anda?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_5br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_5c"
                $0.title = "\tc. Siapa yang terendah dalam tim Anda dan apa rencana peningkatannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_5cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_5d"
                $0.title = "\td. Bagiamana rencana pengembangannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_5dr"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "6. TFO SKU (# of SKU per TFO, sama dengan SKU dihitung 1)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_6a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_6ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_6b"
                $0.title = "\tb. Siapa yang terbaik di tim Anda?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_6br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_6c"
                $0.title = "\tc. Siapa yang terendah dalam tim Anda dan apa rencana peningkatannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_6cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_6d"
                $0.title = "\td. Bagiamana rencana pengembangannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_6dr"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "7. Sampling"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_7a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_7ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_7b"
                $0.title = "\tb. Siapa yang terbaik di tim Anda?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_7br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_7c"
                $0.title = "\tc. Siapa yang terendah dalam tim Anda dan apa rencana peningkatannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_7cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_7d"
                $0.title = "\td. Bagiamana rencana pengembangannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_7dr"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "8. Call Assessment (P, O, R/D, C)"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_8a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_8ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_8b"
                $0.title = "\tb. Siapa yang terbaik di tim Anda?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_8br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_8c"
                $0.title = "\tc. Siapa yang terendah dalam tim Anda dan apa rencana peningkatannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_8cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_a_8d"
                $0.title = "\td. Bagiamana rencana pengembangannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_a_8dr"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "B. Minta ASM untuk menjelaskan Laporan KPI pada bulan ini"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                })
            <<< LabelRow(){
                $0.title = "1. Total Calls"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_1a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_1ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_1b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_1br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "2. Average Calls per working day "
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_2a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_2ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_2b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_2br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "3. Average Calls per actual working day"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_3a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_3ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_3b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_3br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "4. Strike rate (#TFO over #Total Calls)"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_4a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_4ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_4b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_4br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "5. Pantry Check"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_5a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_5ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_5b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_5br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "6. Sampling"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_6a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_6ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_6b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_6br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "7. OTM A fulfillment rate "
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_7a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_7ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_7b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_7br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "8. OTM B Fulfillment rate"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_8a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_8ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_8b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_8br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "9. OTM A call frequency "
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_9a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_9ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_9b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_9br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "10. OTM B call frequency"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_10a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_10ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_10b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_10br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "11. OTM A Average Call Time "
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_11a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_11ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_11b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_11br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "12. OTM B Average Call time"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_12a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_12ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_12b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_12br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "13. Total TFO Counts "
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_13a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_13ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_13b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_13br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "14. Total TFO Value"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_14a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_14ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_14b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_14br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "15. Total GRIP "
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_15a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_15ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_15b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_15br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "16. New Grip "
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_16a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_16ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_16b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_16br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "17. Total Grab"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_17a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_17ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_17b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_17br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "18. New Grab"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_18a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_18ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_18b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_18br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "19. Average Grab"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_19a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_19ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_amstrong_b_19b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_amstrong_b_19br"
                $0.placeholder = "\tRemarks:"
            }
            
            
            +++ Section("KAPABILITAS"){
                $0.header?.title = "Pengembangan Kapabilitas Tim"
                $0.hidden = "$segments != 'KAPABILITAS'"
            }
            
            <<< CheckRow(){
                $0.tag = "asmpull_kapabilitas_a"
                $0.title = "A. Seberapa sering Anda melakukan coaching?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_kapabilitas_ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "asmpull_kapabilitas_b"
                $0.title = "B. Seberapa sering Anda memberikan training/wet sampling kepada tim Anda?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_kapabilitas_br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< CheckRow(){
                $0.tag = "asmpull_kapabilitas_c"
                $0.title = "C. Seberapa sering Anda me-refresh Wet Sampling Skill team anda, dengan memberikan SImple Wet Sampling Dilution in Class Training?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "asmpull_kapabilitas_cr"
                $0.placeholder = "\tRemarks:"
            }

            
            
            <<< ButtonRow("save") {row in
                row.title = "Save"
                row.onCellSelection(self.saveASMPullCoreData)
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.textColor = UIColor.whiteColor()
                })
            
        }
        
        else if language == "Optional(\"English\")" {
            
            form =  Section(){
                section in
                var footer = HeaderFooterView<UITableViewHeaderFooterView>(.Class)
                footer.onSetupView = {view in
                    view.view.textLabel!.text = "**The following questions is a guidelines for you to coach\n the team to develop better in Selling Skills (Basic Call Procedure)"
                    view.view.textLabel!.textColor = UIColor.orangeColor()
                    view.view.textLabel?.numberOfLines = 2
                    view.view.textLabel?.textAlignment = NSTextAlignment.Center
                    view.view.textLabel!.font = UIFont.italicSystemFontOfSize(9)
                }
                footer.height = {30}
                section.footer = footer
                }
                
                
                
                <<< SegmentedRow<String>("segments"){
                    $0.options = ["REPORT AMSTRONG", "CAPABILITY"]
                    $0.value = "REPORT AMSTRONG"
                    }.cellUpdate({ (cell, row) in
                        cell.tintColor = .orangeColor()
                        cell.textLabel!.numberOfLines = 2
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    })
                
                +++ Section()
                
                <<< TextRow(){
                    $0.title = "Coach\t: \(coachname)"
                    $0.disabled = true
                }
                <<< TextRow(){
                    $0.title = "Coachee\t: \(coacheename)"
                    $0.disabled = true
                }
                <<< TextRow(){
                    $0.tag = "distributor"
                    $0.title = "Distributor\t:"
                }
                <<< TextRow(){
                    $0.tag = "area"
                    $0.title = "Area\t\t:"
                }
                
                
                +++ Section("REPORT AMSTRONG"){
                    $0.header?.title = "Report Understanding in Armstrong"
                    $0.hidden = "$segments != 'REPORT AMSTRONG'"
                }
                <<< LabelRow(){
                    $0.title = "A. Ask the ASM to explain \"Summary Report Achievement\" in this month\n *how: Home > Reports > Choose Report Type : All-in-One Transaction > Choose Month"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "1. Call Time Optimization"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_1a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_1ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_1b"
                    $0.title = "\tb. Who performs the best in your team?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_1br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_1c"
                    $0.title = "\tc. Who is the underperformer and how do you plan to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_1cr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_1d"
                    $0.title = "\td. What is the development plan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_1dr"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "2. Call Period"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_2a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_2ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_2b"
                    $0.title = "\tb. Who performs the best in your team?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_2br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_2c"
                    $0.title = "\tc. Who is the underperformer and how do you plan to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_2cr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_2d"
                    $0.title = "\td. What is the development plan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_2dr"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "3. OTM Call Frequency"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_3a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_3ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_3b"
                    $0.title = "\tb. Who performs the best in your team?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_3br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_3c"
                    $0.title = "\tc. Who is the underperformer and how do you plan to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_3cr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_3d"
                    $0.title = "\td. What is the development plan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_3dr"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "4. Pantry Efficiency"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_4a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_4ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_4b"
                    $0.title = "\tb. Who performs the best in your team?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_4br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_4c"
                    $0.title = "\tc. Who is the underperformer and how do you plan to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_4cr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_4d"
                    $0.title = "\td. What is the development plan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_4dr"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "5. TFO Sources"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_5a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_5ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_5b"
                    $0.title = "\tb. Who performs the best in your team?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_5br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_5c"
                    $0.title = "\tc. Who is the underperformer and how do you plan to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_5cr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_5d"
                    $0.title = "\td. What is the development plan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_5dr"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "6. TFO SKU (# of SKU per TFO, same SKU counted as 1)"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_6a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_6ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_6b"
                    $0.title = "\tb. Who performs the best in your team?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_6br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_6c"
                    $0.title = "\tc. Who is the underperformer and how do you plan to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_6cr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_6d"
                    $0.title = "\td. What is the development plan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_6dr"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "7. Sampling"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_7a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_7ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_7b"
                    $0.title = "\tb. Who performs the best in your team?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_7br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_7c"
                    $0.title = "\tc. Who is the underperformer and how do you plan to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_7cr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_7d"
                    $0.title = "\td. What is the development plan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_7dr"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "8. Call Assessment (P, O, R/D, C)"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_8a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_8ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_8b"
                    $0.title = "\tb. Who performs the best in your team?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_8br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_8c"
                    $0.title = "\tc. Who is the underperformer and how do you plan to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_8cr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_a_8d"
                    $0.title = "\td. What is the development plan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_a_8dr"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "B. Ask ASM to explain KPI Under Reports this month"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                    })
                <<< LabelRow(){
                    $0.title = "1. Total Calls"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_1a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_1ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_1b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_1br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "2. Average Calls per working day "
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_2a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_2ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_2b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_2br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "3. Average Calls per actual working day"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_3a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_3ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_3b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_3br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "4. Strike rate (#TFO over #Total Calls)"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_4a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_4ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_4b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_4br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "5. Pantry Check"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_5a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_5ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_5b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_5br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "6. Sampling"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_6a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_6ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_6b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_6br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "7. OTM A fulfillment rate "
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_7a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_7ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_7b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_7br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "8. OTM B Fulfillment rate"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_8a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_8ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_8b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_8br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "9. OTM A call frequency "
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_9a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_9ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_9b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_9br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "10. OTM B call frequency"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_10a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_10ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_10b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_10br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "11. OTM A Average Call Time "
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_11a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_11ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_11b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_11br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "12. OTM B Average Call time"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_12a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_12ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_12b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_12br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "13. Total TFO Counts "
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_13a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_13ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_13b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_13br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "14. Total TFO Value"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_14a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_14ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_14b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_14br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "15. Total GRIP "
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_15a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_15ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_15b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_15br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "16. New Grip "
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_16a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_16ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_16b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_16br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "17. Total Grab"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_17a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_17ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_17b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_17br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "18. New Grab"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_18a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_18ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_18b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_18br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "19. Average Grab"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_19a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_19ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_amstrong_b_19b"
                    $0.title = "\tb.What are the plans to improve it?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_amstrong_b_19br"
                    $0.placeholder = "\tRemarks:"
                }
                
                
                +++ Section("CAPABILITY"){
                    $0.header?.title = "Team Capability Development"
                    $0.hidden = "$segments != 'CAPABILITY'"
                }
                
                <<< CheckRow(){
                    $0.tag = "asmpull_kapabilitas_a"
                    $0.title = "A. How often do you conduct coaching?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_kapabilitas_ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_kapabilitas_b"
                    $0.title = "B. How often do you give training/wet sampling to your team?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_kapabilitas_br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "asmpull_kapabilitas_c"
                    $0.title = "C. How often do you refresh Wet Sampling Skill of your team, by giving Simple Wet Sampling Dilution in Class Training?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "asmpull_kapabilitas_cr"
                    $0.placeholder = "\tRemarks:"
                }
                
                
                <<< ButtonRow("save") {row in
                    row.title = "Save"
                    row.onCellSelection(self.saveASMPullCoreData)
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.textColor = UIColor.whiteColor()
                    })
            
        }

        
        print(AppDelegate.getAppDelegate().getDocDir())
    }
    
    
    func saveASMPullCoreData(cell: ButtonCellOf<String>, row: ButtonRow) {
        
        if let distributor = self.form.rowByTag("distributor")?.baseValue as? String
        {
            self.distributor = distributor
        }
        if let area = self.form.rowByTag("area")?.baseValue as? String
        {
            self.area = area
        }
        
        if let asmpull_amstrong_a_1a = self.form.rowByTag("asmpull_amstrong_a_1a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_1a = asmpull_amstrong_a_1a
        }
        if let asmpull_amstrong_a_1ar = self.form.rowByTag("asmpull_amstrong_a_1ar")?.baseValue as? String
        {
            self.asmpull_amstrong_a_1ar = asmpull_amstrong_a_1ar
        }
        if let asmpull_amstrong_a_1b = self.form.rowByTag("asmpull_amstrong_a_1b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_1b = asmpull_amstrong_a_1b
        }
        if let asmpull_amstrong_a_1br = self.form.rowByTag("asmpull_amstrong_a_1br")?.baseValue as? String
        {
            self.asmpull_amstrong_a_1br = asmpull_amstrong_a_1br
        }
        if let asmpull_amstrong_a_1c = self.form.rowByTag("asmpull_amstrong_a_1c")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_1c = asmpull_amstrong_a_1c
        }
        if let asmpull_amstrong_a_1cr = self.form.rowByTag("asmpull_amstrong_a_1cr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_1cr = asmpull_amstrong_a_1cr
        }
        if let asmpull_amstrong_a_1d = self.form.rowByTag("asmpull_amstrong_a_1d")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_1d = asmpull_amstrong_a_1d
        }
        if let asmpull_amstrong_a_1dr = self.form.rowByTag("asmpull_amstrong_a_1dr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_1dr = asmpull_amstrong_a_1dr
        }
        
        if let asmpull_amstrong_a_2a = self.form.rowByTag("asmpull_amstrong_a_2a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_2a = asmpull_amstrong_a_2a
        }
        if let asmpull_amstrong_a_2ar = self.form.rowByTag("asmpull_amstrong_a_2ar")?.baseValue as? String
        {
            self.asmpull_amstrong_a_2ar = asmpull_amstrong_a_2ar
        }
        if let asmpull_amstrong_a_2b = self.form.rowByTag("asmpull_amstrong_a_2b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_2b = asmpull_amstrong_a_2b
        }
        if let asmpull_amstrong_a_2br = self.form.rowByTag("asmpull_amstrong_a_2br")?.baseValue as? String
        {
            self.asmpull_amstrong_a_2br = asmpull_amstrong_a_2br
        }
        if let asmpull_amstrong_a_2c = self.form.rowByTag("asmpull_amstrong_a_2c")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_2c = asmpull_amstrong_a_2c
        }
        if let asmpull_amstrong_a_2cr = self.form.rowByTag("asmpull_amstrong_a_2cr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_2cr = asmpull_amstrong_a_2cr
        }
        if let asmpull_amstrong_a_2d = self.form.rowByTag("asmpull_amstrong_a_2d")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_2d = asmpull_amstrong_a_2d
        }
        if let asmpull_amstrong_a_2dr = self.form.rowByTag("asmpull_amstrong_a_2dr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_2dr = asmpull_amstrong_a_2dr
        }
        
        if let asmpull_amstrong_a_3a = self.form.rowByTag("asmpull_amstrong_a_3a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_3a = asmpull_amstrong_a_3a
        }
        if let asmpull_amstrong_a_3ar = self.form.rowByTag("asmpull_amstrong_a_3ar")?.baseValue as? String
        {
            self.asmpull_amstrong_a_3ar = asmpull_amstrong_a_3ar
        }
        if let asmpull_amstrong_a_3b = self.form.rowByTag("asmpull_amstrong_a_3b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_3b = asmpull_amstrong_a_3b
        }
        if let asmpull_amstrong_a_3br = self.form.rowByTag("asmpull_amstrong_a_3br")?.baseValue as? String
        {
            self.asmpull_amstrong_a_3br = asmpull_amstrong_a_3br
        }
        if let asmpull_amstrong_a_3c = self.form.rowByTag("asmpull_amstrong_a_3c")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_3c = asmpull_amstrong_a_3c
        }
        if let asmpull_amstrong_a_3cr = self.form.rowByTag("asmpull_amstrong_a_3cr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_3cr = asmpull_amstrong_a_3cr
        }
        if let asmpull_amstrong_a_3d = self.form.rowByTag("asmpull_amstrong_a_3d")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_3d = asmpull_amstrong_a_3d
        }
        if let asmpull_amstrong_a_3dr = self.form.rowByTag("asmpull_amstrong_a_3dr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_3dr = asmpull_amstrong_a_3dr
        }
        
        if let asmpull_amstrong_a_4a = self.form.rowByTag("asmpull_amstrong_a_4a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_4a = asmpull_amstrong_a_4a
        }
        if let asmpull_amstrong_a_4ar = self.form.rowByTag("asmpull_amstrong_a_4ar")?.baseValue as? String
        {
            self.asmpull_amstrong_a_4ar = asmpull_amstrong_a_4ar
        }
        if let asmpull_amstrong_a_4b = self.form.rowByTag("asmpull_amstrong_a_4b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_4b = asmpull_amstrong_a_4b
        }
        if let asmpull_amstrong_a_4br = self.form.rowByTag("asmpull_amstrong_a_4br")?.baseValue as? String
        {
            self.asmpull_amstrong_a_4br = asmpull_amstrong_a_4br
        }
        if let asmpull_amstrong_a_4c = self.form.rowByTag("asmpull_amstrong_a_4c")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_4c = asmpull_amstrong_a_4c
        }
        if let asmpull_amstrong_a_4cr = self.form.rowByTag("asmpull_amstrong_a_4cr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_4cr = asmpull_amstrong_a_4cr
        }
        if let asmpull_amstrong_a_4d = self.form.rowByTag("asmpull_amstrong_a_4d")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_4d = asmpull_amstrong_a_4d
        }
        if let asmpull_amstrong_a_4dr = self.form.rowByTag("asmpull_amstrong_a_4dr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_4dr = asmpull_amstrong_a_4dr
        }
        
        if let asmpull_amstrong_a_5a = self.form.rowByTag("asmpull_amstrong_a_5a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_5a = asmpull_amstrong_a_5a
        }
        if let asmpull_amstrong_a_5ar = self.form.rowByTag("asmpull_amstrong_a_5ar")?.baseValue as? String
        {
            self.asmpull_amstrong_a_5ar = asmpull_amstrong_a_5ar
        }
        if let asmpull_amstrong_a_5b = self.form.rowByTag("asmpull_amstrong_a_5b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_5b = asmpull_amstrong_a_5b
        }
        if let asmpull_amstrong_a_5br = self.form.rowByTag("asmpull_amstrong_a_5br")?.baseValue as? String
        {
            self.asmpull_amstrong_a_5br = asmpull_amstrong_a_5br
        }
        if let asmpull_amstrong_a_5c = self.form.rowByTag("asmpull_amstrong_a_5c")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_5c = asmpull_amstrong_a_5c
        }
        if let asmpull_amstrong_a_5cr = self.form.rowByTag("asmpull_amstrong_a_5cr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_5cr = asmpull_amstrong_a_5cr
        }
        if let asmpull_amstrong_a_5d = self.form.rowByTag("asmpull_amstrong_a_5d")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_5d = asmpull_amstrong_a_5d
        }
        if let asmpull_amstrong_a_5dr = self.form.rowByTag("asmpull_amstrong_a_5dr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_5dr = asmpull_amstrong_a_5dr
        }
        
        if let asmpull_amstrong_a_6a = self.form.rowByTag("asmpull_amstrong_a_6a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_6a = asmpull_amstrong_a_6a
        }
        if let asmpull_amstrong_a_6ar = self.form.rowByTag("asmpull_amstrong_a_6ar")?.baseValue as? String
        {
            self.asmpull_amstrong_a_6ar = asmpull_amstrong_a_6ar
        }
        if let asmpull_amstrong_a_6b = self.form.rowByTag("asmpull_amstrong_a_6b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_6b = asmpull_amstrong_a_6b
        }
        if let asmpull_amstrong_a_6br = self.form.rowByTag("asmpull_amstrong_a_6br")?.baseValue as? String
        {
            self.asmpull_amstrong_a_6br = asmpull_amstrong_a_6br
        }
        if let asmpull_amstrong_a_6c = self.form.rowByTag("asmpull_amstrong_a_6c")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_6c = asmpull_amstrong_a_6c
        }
        if let asmpull_amstrong_a_6cr = self.form.rowByTag("asmpull_amstrong_a_6cr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_6cr = asmpull_amstrong_a_6cr
        }
        if let asmpull_amstrong_a_6d = self.form.rowByTag("asmpull_amstrong_a_6d")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_6d = asmpull_amstrong_a_6d
        }
        if let asmpull_amstrong_a_6dr = self.form.rowByTag("asmpull_amstrong_a_6dr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_6dr = asmpull_amstrong_a_6dr
        }
        
        if let asmpull_amstrong_a_7a = self.form.rowByTag("asmpull_amstrong_a_7a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_7a = asmpull_amstrong_a_7a
        }
        if let asmpull_amstrong_a_7ar = self.form.rowByTag("asmpull_amstrong_a_7ar")?.baseValue as? String
        {
            self.asmpull_amstrong_a_7ar = asmpull_amstrong_a_7ar
        }
        if let asmpull_amstrong_a_7b = self.form.rowByTag("asmpull_amstrong_a_7b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_7b = asmpull_amstrong_a_7b
        }
        if let asmpull_amstrong_a_7br = self.form.rowByTag("asmpull_amstrong_a_7br")?.baseValue as? String
        {
            self.asmpull_amstrong_a_7br = asmpull_amstrong_a_7br
        }
        if let asmpull_amstrong_a_7c = self.form.rowByTag("asmpull_amstrong_a_7c")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_7c = asmpull_amstrong_a_7c
        }
        if let asmpull_amstrong_a_7cr = self.form.rowByTag("asmpull_amstrong_a_7cr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_7cr = asmpull_amstrong_a_7cr
        }
        if let asmpull_amstrong_a_7d = self.form.rowByTag("asmpull_amstrong_a_7d")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_7d = asmpull_amstrong_a_7d
        }
        if let asmpull_amstrong_a_7dr = self.form.rowByTag("asmpull_amstrong_a_7dr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_7dr = asmpull_amstrong_a_7dr
        }
        
        if let asmpull_amstrong_a_8a = self.form.rowByTag("asmpull_amstrong_a_8a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_8a = asmpull_amstrong_a_8a
        }
        if let asmpull_amstrong_a_8ar = self.form.rowByTag("asmpull_amstrong_a_8ar")?.baseValue as? String
        {
            self.asmpull_amstrong_a_8ar = asmpull_amstrong_a_8ar
        }
        if let asmpull_amstrong_a_8b = self.form.rowByTag("asmpull_amstrong_a_8b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_8b = asmpull_amstrong_a_8b
        }
        if let asmpull_amstrong_a_8br = self.form.rowByTag("asmpull_amstrong_a_8br")?.baseValue as? String
        {
            self.asmpull_amstrong_a_8br = asmpull_amstrong_a_8br
        }
        if let asmpull_amstrong_a_8c = self.form.rowByTag("asmpull_amstrong_a_8c")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_8c = asmpull_amstrong_a_8c
        }
        if let asmpull_amstrong_a_8cr = self.form.rowByTag("asmpull_amstrong_a_8cr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_8cr = asmpull_amstrong_a_8cr
        }
        if let asmpull_amstrong_a_8d = self.form.rowByTag("asmpull_amstrong_a_8d")?.baseValue as? Bool
        {
            self.asmpull_amstrong_a_8d = asmpull_amstrong_a_8d
        }
        if let asmpull_amstrong_a_8dr = self.form.rowByTag("asmpull_amstrong_a_8dr")?.baseValue as? String
        {
            self.asmpull_amstrong_a_8dr = asmpull_amstrong_a_8dr
        }
        
        if let asmpull_amstrong_b_1a = self.form.rowByTag("asmpull_amstrong_b_1a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_1a = asmpull_amstrong_b_1a
        }
        if let asmpull_amstrong_b_1ar = self.form.rowByTag("asmpull_amstrong_b_1ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_1ar = asmpull_amstrong_b_1ar
        }
        if let asmpull_amstrong_b_1b = self.form.rowByTag("asmpull_amstrong_b_1b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_1b = asmpull_amstrong_b_1b
        }
        if let asmpull_amstrong_b_1br = self.form.rowByTag("asmpull_amstrong_b_1br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_1br = asmpull_amstrong_b_1br
        }
        
        if let asmpull_amstrong_b_2a = self.form.rowByTag("asmpull_amstrong_b_2a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_2a = asmpull_amstrong_b_2a
        }
        if let asmpull_amstrong_b_2ar = self.form.rowByTag("asmpull_amstrong_b_2ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_2ar = asmpull_amstrong_b_2ar
        }
        if let asmpull_amstrong_b_2b = self.form.rowByTag("asmpull_amstrong_b_2b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_2b = asmpull_amstrong_b_2b
        }
        if let asmpull_amstrong_b_2br = self.form.rowByTag("asmpull_amstrong_b_2br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_2br = asmpull_amstrong_b_2br
        }
        
        if let asmpull_amstrong_b_3a = self.form.rowByTag("asmpull_amstrong_b_3a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_3a = asmpull_amstrong_b_3a
        }
        if let asmpull_amstrong_b_3ar = self.form.rowByTag("asmpull_amstrong_b_3ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_3ar = asmpull_amstrong_b_3ar
        }
        if let asmpull_amstrong_b_3b = self.form.rowByTag("asmpull_amstrong_b_3b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_3b = asmpull_amstrong_b_3b
        }
        if let asmpull_amstrong_b_3br = self.form.rowByTag("asmpull_amstrong_b_3br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_3br = asmpull_amstrong_b_3br
        }
        
        if let asmpull_amstrong_b_4a = self.form.rowByTag("asmpull_amstrong_b_4a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_4a = asmpull_amstrong_b_4a
        }
        if let asmpull_amstrong_b_4ar = self.form.rowByTag("asmpull_amstrong_b_4ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_4ar = asmpull_amstrong_b_4ar
        }
        if let asmpull_amstrong_b_4b = self.form.rowByTag("asmpull_amstrong_b_4b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_4b = asmpull_amstrong_b_4b
        }
        if let asmpull_amstrong_b_4br = self.form.rowByTag("asmpull_amstrong_b_4br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_4br = asmpull_amstrong_b_4br
        }
        
        if let asmpull_amstrong_b_5a = self.form.rowByTag("asmpull_amstrong_b_5a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_5a = asmpull_amstrong_b_5a
        }
        if let asmpull_amstrong_b_5ar = self.form.rowByTag("asmpull_amstrong_b_5ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_5ar = asmpull_amstrong_b_5ar
        }
        if let asmpull_amstrong_b_5b = self.form.rowByTag("asmpull_amstrong_b_5b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_5b = asmpull_amstrong_b_5b
        }
        if let asmpull_amstrong_b_5br = self.form.rowByTag("asmpull_amstrong_b_5br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_5br = asmpull_amstrong_b_5br
        }
        
        if let asmpull_amstrong_b_6a = self.form.rowByTag("asmpull_amstrong_b_6a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_6a = asmpull_amstrong_b_6a
        }
        if let asmpull_amstrong_b_6ar = self.form.rowByTag("asmpull_amstrong_b_6ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_6ar = asmpull_amstrong_b_6ar
        }
        if let asmpull_amstrong_b_6b = self.form.rowByTag("asmpull_amstrong_b_6b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_6b = asmpull_amstrong_b_6b
        }
        if let asmpull_amstrong_b_6br = self.form.rowByTag("asmpull_amstrong_b_6br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_6br = asmpull_amstrong_b_6br
        }
        
        if let asmpull_amstrong_b_7a = self.form.rowByTag("asmpull_amstrong_b_7a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_7a = asmpull_amstrong_b_7a
        }
        if let asmpull_amstrong_b_7ar = self.form.rowByTag("asmpull_amstrong_b_7ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_7ar = asmpull_amstrong_b_7ar
        }
        if let asmpull_amstrong_b_7b = self.form.rowByTag("asmpull_amstrong_b_7b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_7b = asmpull_amstrong_b_7b
        }
        if let asmpull_amstrong_b_7br = self.form.rowByTag("asmpull_amstrong_b_7br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_7br = asmpull_amstrong_b_7br
        }
        
        if let asmpull_amstrong_b_8a = self.form.rowByTag("asmpull_amstrong_b_8a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_8a = asmpull_amstrong_b_8a
        }
        if let asmpull_amstrong_b_8ar = self.form.rowByTag("asmpull_amstrong_b_8ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_8ar = asmpull_amstrong_b_8ar
        }
        if let asmpull_amstrong_b_8b = self.form.rowByTag("asmpull_amstrong_b_8b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_8b = asmpull_amstrong_b_8b
        }
        if let asmpull_amstrong_b_8br = self.form.rowByTag("asmpull_amstrong_b_8br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_8br = asmpull_amstrong_b_8br
        }
        
        if let asmpull_amstrong_b_9a = self.form.rowByTag("asmpull_amstrong_b_9a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_9a = asmpull_amstrong_b_9a
        }
        if let asmpull_amstrong_b_9ar = self.form.rowByTag("asmpull_amstrong_b_9ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_9ar = asmpull_amstrong_b_9ar
        }
        if let asmpull_amstrong_b_9b = self.form.rowByTag("asmpull_amstrong_b_9b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_9b = asmpull_amstrong_b_9b
        }
        if let asmpull_amstrong_b_9br = self.form.rowByTag("asmpull_amstrong_b_9br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_9br = asmpull_amstrong_b_9br
        }
        
        if let asmpull_amstrong_b_10a = self.form.rowByTag("asmpull_amstrong_b_10a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_10a = asmpull_amstrong_b_10a
        }
        if let asmpull_amstrong_b_10ar = self.form.rowByTag("asmpull_amstrong_b_10ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_10ar = asmpull_amstrong_b_10ar
        }
        if let asmpull_amstrong_b_10b = self.form.rowByTag("asmpull_amstrong_b_10b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_10b = asmpull_amstrong_b_10b
        }
        if let asmpull_amstrong_b_10br = self.form.rowByTag("asmpull_amstrong_b_10br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_10br = asmpull_amstrong_b_10br
        }
        
        if let asmpull_amstrong_b_11a = self.form.rowByTag("asmpull_amstrong_b_11a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_11a = asmpull_amstrong_b_11a
        }
        if let asmpull_amstrong_b_11ar = self.form.rowByTag("asmpull_amstrong_b_11ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_11ar = asmpull_amstrong_b_11ar
        }
        if let asmpull_amstrong_b_11b = self.form.rowByTag("asmpull_amstrong_b_11b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_11b = asmpull_amstrong_b_11b
        }
        if let asmpull_amstrong_b_11br = self.form.rowByTag("asmpull_amstrong_b_11br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_11br = asmpull_amstrong_b_11br
        }
        
        if let asmpull_amstrong_b_12a = self.form.rowByTag("asmpull_amstrong_b_12a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_12a = asmpull_amstrong_b_12a
        }
        if let asmpull_amstrong_b_12ar = self.form.rowByTag("asmpull_amstrong_b_12ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_12ar = asmpull_amstrong_b_12ar
        }
        if let asmpull_amstrong_b_12b = self.form.rowByTag("asmpull_amstrong_b_12b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_12b = asmpull_amstrong_b_12b
        }
        if let asmpull_amstrong_b_12br = self.form.rowByTag("asmpull_amstrong_b_12br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_12br = asmpull_amstrong_b_12br
        }
        
        if let asmpull_amstrong_b_13a = self.form.rowByTag("asmpull_amstrong_b_13a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_13a = asmpull_amstrong_b_13a
        }
        if let asmpull_amstrong_b_13ar = self.form.rowByTag("asmpull_amstrong_b_13ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_13ar = asmpull_amstrong_b_13ar
        }
        if let asmpull_amstrong_b_13b = self.form.rowByTag("asmpull_amstrong_b_13b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_13b = asmpull_amstrong_b_13b
        }
        if let asmpull_amstrong_b_13br = self.form.rowByTag("asmpull_amstrong_b_13br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_13br = asmpull_amstrong_b_13br
        }
        
        if let asmpull_amstrong_b_14a = self.form.rowByTag("asmpull_amstrong_b_14a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_14a = asmpull_amstrong_b_14a
        }
        if let asmpull_amstrong_b_14ar = self.form.rowByTag("asmpull_amstrong_b_14ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_14ar = asmpull_amstrong_b_14ar
        }
        if let asmpull_amstrong_b_14b = self.form.rowByTag("asmpull_amstrong_b_14b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_14b = asmpull_amstrong_b_14b
        }
        if let asmpull_amstrong_b_14br = self.form.rowByTag("asmpull_amstrong_b_14br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_14br = asmpull_amstrong_b_14br
        }
        
        if let asmpull_amstrong_b_15a = self.form.rowByTag("asmpull_amstrong_b_15a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_15a = asmpull_amstrong_b_15a
        }
        if let asmpull_amstrong_b_15ar = self.form.rowByTag("asmpull_amstrong_b_15ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_15ar = asmpull_amstrong_b_15ar
        }
        if let asmpull_amstrong_b_15b = self.form.rowByTag("asmpull_amstrong_b_15b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_15b = asmpull_amstrong_b_15b
        }
        if let asmpull_amstrong_b_15br = self.form.rowByTag("asmpull_amstrong_b_15br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_15br = asmpull_amstrong_b_15br
        }
        
        if let asmpull_amstrong_b_16a = self.form.rowByTag("asmpull_amstrong_b_16a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_16a = asmpull_amstrong_b_16a
        }
        if let asmpull_amstrong_b_16ar = self.form.rowByTag("asmpull_amstrong_b_16ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_16ar = asmpull_amstrong_b_16ar
        }
        if let asmpull_amstrong_b_16b = self.form.rowByTag("asmpull_amstrong_b_16b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_16b = asmpull_amstrong_b_16b
        }
        if let asmpull_amstrong_b_16br = self.form.rowByTag("asmpull_amstrong_b_16br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_16br = asmpull_amstrong_b_16br
        }
        
        if let asmpull_amstrong_b_17a = self.form.rowByTag("asmpull_amstrong_b_17a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_17a = asmpull_amstrong_b_17a
        }
        if let asmpull_amstrong_b_17ar = self.form.rowByTag("asmpull_amstrong_b_17ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_17ar = asmpull_amstrong_b_17ar
        }
        if let asmpull_amstrong_b_17b = self.form.rowByTag("asmpull_amstrong_b_17b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_17b = asmpull_amstrong_b_17b
        }
        if let asmpull_amstrong_b_17br = self.form.rowByTag("asmpull_amstrong_b_17br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_17br = asmpull_amstrong_b_17br
        }
        
        if let asmpull_amstrong_b_18a = self.form.rowByTag("asmpull_amstrong_b_18a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_18a = asmpull_amstrong_b_18a
        }
        if let asmpull_amstrong_b_18ar = self.form.rowByTag("asmpull_amstrong_b_18ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_18ar = asmpull_amstrong_b_18ar
        }
        if let asmpull_amstrong_b_18b = self.form.rowByTag("asmpull_amstrong_b_18b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_18b = asmpull_amstrong_b_18b
        }
        if let asmpull_amstrong_b_18br = self.form.rowByTag("asmpull_amstrong_b_18br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_18br = asmpull_amstrong_b_18br
        }
        
        if let asmpull_amstrong_b_19a = self.form.rowByTag("asmpull_amstrong_b_19a")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_19a = asmpull_amstrong_b_19a
        }
        if let asmpull_amstrong_b_19ar = self.form.rowByTag("asmpull_amstrong_b_19ar")?.baseValue as? String
        {
            self.asmpull_amstrong_b_19ar = asmpull_amstrong_b_19ar
        }
        if let asmpull_amstrong_b_19b = self.form.rowByTag("asmpull_amstrong_b_19b")?.baseValue as? Bool
        {
            self.asmpull_amstrong_b_19b = asmpull_amstrong_b_19b
        }
        if let asmpull_amstrong_b_19br = self.form.rowByTag("asmpull_amstrong_b_19br")?.baseValue as? String
        {
            self.asmpull_amstrong_b_19br = asmpull_amstrong_b_19br
        }
        
        if let asmpull_kapabilitas_a = self.form.rowByTag("asmpull_kapabilitas_a")?.baseValue as? Bool
        {
            self.asmpull_kapabilitas_a = asmpull_kapabilitas_a
        }
        if let asmpull_kapabilitas_ar = self.form.rowByTag("asmpull_kapabilitas_ar")?.baseValue as? String
        {
            self.asmpull_kapabilitas_ar = asmpull_kapabilitas_ar
        }
        if let asmpull_kapabilitas_b = self.form.rowByTag("asmpull_kapabilitas_b")?.baseValue as? Bool
        {
            self.asmpull_kapabilitas_b = asmpull_kapabilitas_b
        }
        if let asmpull_kapabilitas_br = self.form.rowByTag("asmpull_kapabilitas_br")?.baseValue as? String
        {
            self.asmpull_kapabilitas_br = asmpull_kapabilitas_br
        }
        if let asmpull_kapabilitas_c = self.form.rowByTag("asmpull_kapabilitas_c")?.baseValue as? Bool
        {
            self.asmpull_kapabilitas_c = asmpull_kapabilitas_c
        }
        if let asmpull_kapabilitas_cr = self.form.rowByTag("asmpull_kapabilitas_cr")?.baseValue as? String
        {
            self.asmpull_kapabilitas_cr = asmpull_kapabilitas_cr
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_1a",textAnswer: self.asmpull_amstrong_a_1ar,tickAnswer: self.asmpull_amstrong_a_1a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_1b",textAnswer: self.asmpull_amstrong_a_1br,tickAnswer: self.asmpull_amstrong_a_1b, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_1c",textAnswer: self.asmpull_amstrong_a_1cr,tickAnswer: self.asmpull_amstrong_a_1c, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_1d",textAnswer: self.asmpull_amstrong_a_1dr,tickAnswer: self.asmpull_amstrong_a_1d, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_2a",textAnswer: self.asmpull_amstrong_a_2ar,tickAnswer: self.asmpull_amstrong_a_2a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_2b",textAnswer: self.asmpull_amstrong_a_2br,tickAnswer: self.asmpull_amstrong_a_2b, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_2c",textAnswer: self.asmpull_amstrong_a_2cr,tickAnswer: self.asmpull_amstrong_a_2c, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_2d",textAnswer: self.asmpull_amstrong_a_2dr,tickAnswer: self.asmpull_amstrong_a_2d, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_3a",textAnswer: self.asmpull_amstrong_a_3ar,tickAnswer: self.asmpull_amstrong_a_3a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_3b",textAnswer: self.asmpull_amstrong_a_3br,tickAnswer: self.asmpull_amstrong_a_3b, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_3c",textAnswer: self.asmpull_amstrong_a_3cr,tickAnswer: self.asmpull_amstrong_a_3c, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_3d",textAnswer: self.asmpull_amstrong_a_3dr,tickAnswer: self.asmpull_amstrong_a_3d, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_4a",textAnswer: self.asmpull_amstrong_a_4ar,tickAnswer: self.asmpull_amstrong_a_4a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_4b",textAnswer: self.asmpull_amstrong_a_4br,tickAnswer: self.asmpull_amstrong_a_4b, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_4c",textAnswer: self.asmpull_amstrong_a_4cr,tickAnswer: self.asmpull_amstrong_a_4c, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_4d",textAnswer: self.asmpull_amstrong_a_4dr,tickAnswer: self.asmpull_amstrong_a_4d, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_5a",textAnswer: self.asmpull_amstrong_a_5ar,tickAnswer: self.asmpull_amstrong_a_5a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_5b",textAnswer: self.asmpull_amstrong_a_5br,tickAnswer: self.asmpull_amstrong_a_5b, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_5c",textAnswer: self.asmpull_amstrong_a_5cr,tickAnswer: self.asmpull_amstrong_a_5c, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_5d",textAnswer: self.asmpull_amstrong_a_5dr,tickAnswer: self.asmpull_amstrong_a_5d, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_6a",textAnswer: self.asmpull_amstrong_a_6ar,tickAnswer: self.asmpull_amstrong_a_6a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_6b",textAnswer: self.asmpull_amstrong_a_6br,tickAnswer: self.asmpull_amstrong_a_6b, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_6c",textAnswer: self.asmpull_amstrong_a_6cr,tickAnswer: self.asmpull_amstrong_a_6c, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_6d",textAnswer: self.asmpull_amstrong_a_6dr,tickAnswer: self.asmpull_amstrong_a_6d, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_7a",textAnswer: self.asmpull_amstrong_a_7ar,tickAnswer: self.asmpull_amstrong_a_7a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_7b",textAnswer: self.asmpull_amstrong_a_7br,tickAnswer: self.asmpull_amstrong_a_7b, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_7c",textAnswer: self.asmpull_amstrong_a_7cr,tickAnswer: self.asmpull_amstrong_a_7c, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_7d",textAnswer: self.asmpull_amstrong_a_7dr,tickAnswer: self.asmpull_amstrong_a_7d, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_8a",textAnswer: self.asmpull_amstrong_a_8ar,tickAnswer: self.asmpull_amstrong_a_8a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_8b",textAnswer: self.asmpull_amstrong_a_8br,tickAnswer: self.asmpull_amstrong_a_8b, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_8c",textAnswer: self.asmpull_amstrong_a_8cr,tickAnswer: self.asmpull_amstrong_a_8c, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_a_8d",textAnswer: self.asmpull_amstrong_a_8dr,tickAnswer: self.asmpull_amstrong_a_8d, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_1a",textAnswer: self.asmpull_amstrong_b_1ar,tickAnswer: self.asmpull_amstrong_b_1a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_1b",textAnswer: self.asmpull_amstrong_b_1br,tickAnswer: self.asmpull_amstrong_b_1b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_2a",textAnswer: self.asmpull_amstrong_b_2ar,tickAnswer: self.asmpull_amstrong_b_2a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_2b",textAnswer: self.asmpull_amstrong_b_2br,tickAnswer: self.asmpull_amstrong_b_2b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_3a",textAnswer: self.asmpull_amstrong_b_3ar,tickAnswer: self.asmpull_amstrong_b_3a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_3b",textAnswer: self.asmpull_amstrong_b_3br,tickAnswer: self.asmpull_amstrong_b_3b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_4a",textAnswer: self.asmpull_amstrong_b_4ar,tickAnswer: self.asmpull_amstrong_b_4a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_4b",textAnswer: self.asmpull_amstrong_b_4br,tickAnswer: self.asmpull_amstrong_b_4b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_5a",textAnswer: self.asmpull_amstrong_b_5ar,tickAnswer: self.asmpull_amstrong_b_5a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_5b",textAnswer: self.asmpull_amstrong_b_5br,tickAnswer: self.asmpull_amstrong_b_5b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_6a",textAnswer: self.asmpull_amstrong_b_6ar,tickAnswer: self.asmpull_amstrong_b_6a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_6b",textAnswer: self.asmpull_amstrong_b_6br,tickAnswer: self.asmpull_amstrong_b_6b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_7a",textAnswer: self.asmpull_amstrong_b_7ar,tickAnswer: self.asmpull_amstrong_b_7a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_7b",textAnswer: self.asmpull_amstrong_b_7br,tickAnswer: self.asmpull_amstrong_b_7b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_8a",textAnswer: self.asmpull_amstrong_b_8ar,tickAnswer: self.asmpull_amstrong_b_8a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_8b",textAnswer: self.asmpull_amstrong_b_8br,tickAnswer: self.asmpull_amstrong_b_8b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_9a",textAnswer: self.asmpull_amstrong_b_9ar,tickAnswer: self.asmpull_amstrong_b_9a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_9b",textAnswer: self.asmpull_amstrong_b_9br,tickAnswer: self.asmpull_amstrong_b_9b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_10a",textAnswer: self.asmpull_amstrong_b_10ar,tickAnswer: self.asmpull_amstrong_b_10a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_10b",textAnswer: self.asmpull_amstrong_b_10br,tickAnswer: self.asmpull_amstrong_b_10b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_11a",textAnswer: self.asmpull_amstrong_b_11ar,tickAnswer: self.asmpull_amstrong_b_11a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_11b",textAnswer: self.asmpull_amstrong_b_11br,tickAnswer: self.asmpull_amstrong_b_11b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_12a",textAnswer: self.asmpull_amstrong_b_12ar,tickAnswer: self.asmpull_amstrong_b_12a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_12b",textAnswer: self.asmpull_amstrong_b_12br,tickAnswer: self.asmpull_amstrong_b_12b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_13a",textAnswer: self.asmpull_amstrong_b_13ar,tickAnswer: self.asmpull_amstrong_b_13a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_13b",textAnswer: self.asmpull_amstrong_b_13br,tickAnswer: self.asmpull_amstrong_b_13b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_14a",textAnswer: self.asmpull_amstrong_b_14ar,tickAnswer: self.asmpull_amstrong_b_14a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_14b",textAnswer: self.asmpull_amstrong_b_14br,tickAnswer: self.asmpull_amstrong_b_14b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_15a",textAnswer: self.asmpull_amstrong_b_15ar,tickAnswer: self.asmpull_amstrong_b_15a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_15b",textAnswer: self.asmpull_amstrong_b_15br,tickAnswer: self.asmpull_amstrong_b_15b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_16a",textAnswer: self.asmpull_amstrong_b_16ar,tickAnswer: self.asmpull_amstrong_b_16a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_16b",textAnswer: self.asmpull_amstrong_b_16br,tickAnswer: self.asmpull_amstrong_b_16b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_17a",textAnswer: self.asmpull_amstrong_b_17ar,tickAnswer: self.asmpull_amstrong_b_17a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_17b",textAnswer: self.asmpull_amstrong_b_17br,tickAnswer: self.asmpull_amstrong_b_17b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_18a",textAnswer: self.asmpull_amstrong_b_18ar,tickAnswer: self.asmpull_amstrong_b_18a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_18b",textAnswer: self.asmpull_amstrong_b_18br,tickAnswer: self.asmpull_amstrong_b_18b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_19a",textAnswer: self.asmpull_amstrong_b_19ar,tickAnswer: self.asmpull_amstrong_b_19a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_amstrong_b_19b",textAnswer: self.asmpull_amstrong_b_19br,tickAnswer: self.asmpull_amstrong_b_19b, id: csession)
        
        self.saveQuestionData("", questionID: "asmpull_kapabilitas_a",textAnswer: self.asmpull_kapabilitas_ar,tickAnswer: self.asmpull_kapabilitas_a, id: csession)
        self.saveQuestionData("", questionID: "asmpull_kapabilitas_b",textAnswer: self.asmpull_kapabilitas_br,tickAnswer: self.asmpull_kapabilitas_b, id: csession)
        self.saveQuestionData("", questionID: "asmpull_kapabilitas_c",textAnswer: self.asmpull_kapabilitas_cr,tickAnswer: self.asmpull_kapabilitas_c, id: csession)
        
        self.updateCoachingData(self.distributor, area: self.area, id: csession)
        
        self.performSegueWithIdentifier("asmpullToSummary", sender: nil)
        
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
    
    func updateCoachingData(distributor: String, area: String, id: String) {
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
                    managedObject.setValue(distributor, forKey: "distributor")
                    managedObject.setValue(area, forKey: "area")
                    managedObject.setValue(coachingGuideline, forKey: "coachingGuideline")
                    NSUserDefaults.standardUserDefaults().setValue(distributor, forKey: KeyLocal.distributor)
                    NSUserDefaults.standardUserDefaults().setValue(area, forKey: KeyLocal.area)
                    
                    try context.save()
                }
            }
        }
        catch {
            print(error)
        }
    }
}

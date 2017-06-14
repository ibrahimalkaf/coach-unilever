//
//  SRForm.swift
//  FoodSolution
//
//  Created by baim alkaf on 10/5/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import Eureka
import Firebase
import FirebaseDatabase
import CoreData


class SRForm : FormViewController {
    
    var rootRef: FIRDatabaseReference!
    var coachingsession: String = ""
    
    var distributor: String = ""
    var area: String = ""
    
    var sr_amstrong_a_1a: Bool = false
    var sr_amstrong_a_1b: Bool = false
    var sr_amstrong_a_1c: Bool = false
    var sr_amstrong_a_1d: Bool = false
    var sr_amstrong_a_1e: Bool = false
    
    var sr_amstrong_a_2: Bool = false
    
    var sr_amstrong_b_1a: Bool = false
    var sr_amstrong_b_1b: Bool = false
    
    var sr_amstrong_b_2a: Bool = false
    var sr_amstrong_b_2b: Bool = false
    
    var sr_amstrong_b_3a: Bool = false
    var sr_amstrong_b_3b: Bool = false
    
    var sr_amstrong_b_4a: Bool = false
    var sr_amstrong_b_4b: Bool = false
    
    var sr_amstrong_b_5a: Bool = false
    var sr_amstrong_b_5b: Bool = false
    
    var sr_amstrong_b_6a: Bool = false
    var sr_amstrong_b_6b: Bool = false
    
    var sr_amstrong_b_7a: Bool = false
    var sr_amstrong_b_7b: Bool = false
    
    var sr_amstrong_b_8a: Bool = false
    var sr_amstrong_b_8b: Bool = false
    
    var sr_amstrong_b_9a: Bool = false
    var sr_amstrong_b_9b: Bool = false
    
    var sr_amstrong_b_10a: Bool = false
    var sr_amstrong_b_10b: Bool = false
    
    var sr_amstrong_b_11a: Bool = false
    var sr_amstrong_b_11b: Bool = false
    
    var sr_amstrong_b_12a: Bool = false
    var sr_amstrong_b_12b: Bool = false
    
    var sr_amstrong_b_13a: Bool = false
    var sr_amstrong_b_13b: Bool = false
    
    var sr_amstrong_b_14a: Bool = false
    var sr_amstrong_b_14b: Bool = false
    
    var sr_amstrong_b_15a: Bool = false
    var sr_amstrong_b_15b: Bool = false
    
    var sr_amstrong_b_16a: Bool = false
    var sr_amstrong_b_16b: Bool = false
    
    var sr_amstrong_b_17a: Bool = false
    var sr_amstrong_b_17b: Bool = false
    
    var sr_amstrong_b_18a: Bool = false
    var sr_amstrong_b_18b: Bool = false
    
    var sr_amstrong_b_19a: Bool = false
    var sr_amstrong_b_19b: Bool = false
    
    var sr_amstrong_c_1: Bool = false
    var sr_amstrong_c_2: Bool = false
    
    var sr_operator_a_a: Bool = false
    var sr_operator_a_b: Bool = false

    var sr_operator_b_a: Bool = false
    var sr_operator_b_b: Bool = false
    var sr_operator_b_c: Bool = false
    var sr_operator_b_d: Bool = false
    
    var sr_amstrong_a_1ar: String = ""
    var sr_amstrong_a_1br: String = ""
    var sr_amstrong_a_1cr: String = ""
    var sr_amstrong_a_1dr: String = ""
    var sr_amstrong_a_1er: String = ""
    
    var sr_amstrong_a_2r: String = ""
    
    var sr_amstrong_b_1ar: String = ""
    var sr_amstrong_b_1br: String = ""
    
    var sr_amstrong_b_2ar: String = ""
    var sr_amstrong_b_2br: String = ""
    
    var sr_amstrong_b_3ar: String = ""
    var sr_amstrong_b_3br: String = ""
    
    var sr_amstrong_b_4ar: String = ""
    var sr_amstrong_b_4br: String = ""
    
    var sr_amstrong_b_5ar: String = ""
    var sr_amstrong_b_5br: String = ""
    
    var sr_amstrong_b_6ar: String = ""
    var sr_amstrong_b_6br: String = ""
    
    var sr_amstrong_b_7ar: String = ""
    var sr_amstrong_b_7br: String = ""
    
    var sr_amstrong_b_8ar: String = ""
    var sr_amstrong_b_8br: String = ""
    
    var sr_amstrong_b_9ar: String = ""
    var sr_amstrong_b_9br: String = ""
    
    var sr_amstrong_b_10ar: String = ""
    var sr_amstrong_b_10br: String = ""
    
    var sr_amstrong_b_11ar: String = ""
    var sr_amstrong_b_11br: String = ""
    
    var sr_amstrong_b_12ar: String = ""
    var sr_amstrong_b_12br: String = ""
    
    var sr_amstrong_b_13ar: String = ""
    var sr_amstrong_b_13br: String = ""
    
    var sr_amstrong_b_14ar: String = ""
    var sr_amstrong_b_14br: String = ""
    
    var sr_amstrong_b_15ar: String = ""
    var sr_amstrong_b_15br: String = ""
    
    var sr_amstrong_b_16ar: String = ""
    var sr_amstrong_b_16br: String = ""
    
    var sr_amstrong_b_17ar: String = ""
    var sr_amstrong_b_17br: String = ""
    
    var sr_amstrong_b_18ar: String = ""
    var sr_amstrong_b_18br: String = ""
    
    var sr_amstrong_b_19ar: String = ""
    var sr_amstrong_b_19br: String = ""
    
    var sr_amstrong_c_1r: String = ""
    var sr_amstrong_c_2r: String = ""
    
    var sr_operator_a_ar: String = ""
    var sr_operator_a_br: String = ""
    
    var sr_operator_b_ar: String = ""
    var sr_operator_b_br: String = ""
    var sr_operator_b_cr: String = ""
    var sr_operator_b_dr: String = ""
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
                $0.options = ["USING AMSTRONG", "OPERATOR"]
                $0.value = "USING AMSTRONG"
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
            
            
            +++ Section("USING AMSTRONG"){
                $0.header?.title = "KEFASIHAN PENGGUNAAN AMSTRONG"
                $0.hidden = "$segments != 'USING AMSTRONG'"
            }
            <<< LabelRow(){
                $0.title = "A. Kelengkapan customer profile\n(5 informasi utama untuk digital : contact person name, Customer/business name, postal code address, contact person telp/email, type of business/Channel) (and tanyakan tipe OTM setiap customer)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< LabelRow(){
                $0.title = "1. Minta SR untuk menunjukan data customer yang telah memiliki 5 informasi utama untuk digital"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< CheckRow(){
                $0.tag = "sr_amstrong_a_1a"
                $0.title = "\ta. Customer 1"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_a_1ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_a_1b"
                $0.title = "\tb. Customer 2"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_a_1br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_a_1c"
                $0.title = "\tc. Customer 3"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_a_1cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_a_1d"
                $0.title = "\td. Customer 4"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_a_1dr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_a_1e"
                $0.title = "\te. Customer 5"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_a_1er"
                $0.placeholder = "\tRemarks:"
            }

            
            <<< CheckRow(){
                $0.tag = "sr_amstrong_a_2"
                $0.title = "2. Berapa customer yang belum lengkap dan mengapa?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_a_2r"
                $0.placeholder = "\tRemarks:"
            }
            
            
            <<< LabelRow(){
                $0.title = "B. Minta SR untuk menjelaskan mengenai pencapaian sejak menggunakan Armstrong"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                })
            <<< LabelRow(){
                $0.title = "1. Total Calls"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_1a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_1ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_1b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_1br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "2. Average Calls per working day "
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_2a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_2ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_2b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_2br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "3. Average Calls per actual working day"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_3a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_3ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_3b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_3br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "4. Strike rate (#TFO over #Total Calls)"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_4a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_4ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_4b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_4br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "5. Pantry Check"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_5a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_5ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_5b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_5br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "6. Sampling"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_6a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_6ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_6b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_6br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "7. OTM A fulfillment rate "
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_7a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_7ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_7b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_7br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "8. OTM B Fulfillment rate"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_8a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_8ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_8b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_8br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "9. OTM A call frequency "
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_9a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_9ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_9b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_9br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "10. OTM B call frequency"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_10a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_10ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_10b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_10br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "11. OTM A Average Call Time "
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_11a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_11ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_11b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_11br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "12. OTM B Average Call time"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_12a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_12ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_12b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_12br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "13. Total TFO Counts "
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_13a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_13ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_13b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_13br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "14. Total TFO Value"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_14a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_14ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_14b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_14br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "15. Total GRIP "
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_15a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_15ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_15b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_15br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "16. New Grip "
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_16a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_16ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_16b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_16br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "17. New Grab"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_17a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_17ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_17b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_17br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "18. Average Grab"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_18a"
                $0.title = "\ta. Apa pengertiannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_18ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_b_18b"
                $0.title = "\tb. Apa rencana untuk meningkatkannya?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_b_18br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "C. Kemampuan Chefmanship"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< CheckRow(){
                $0.tag = "sr_amstrong_c_1"
                $0.title = "1. Seberapa sering anda melakukan Wet Sampling di Operator ?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_c_1r"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_amstrong_c_2"
                $0.title = "2. Apa kesulitan yang anda hadapi saat melakukan Wet Sampling ?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_amstrong_c_2r"
                $0.placeholder = "\tRemarks:"
            }
            
            
            
            +++ Section("OPERATOR"){
                $0.header?.title = "Pada saat kunjungan ke operator"
                $0.hidden = "$segments != 'OPERATOR'"
            }
            
            <<< LabelRow(){
                $0.title = "A. Minta SR untuk menjelaskan apa yang telah dipersiapkan di Armstrong"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            
            <<< CheckRow(){
                $0.tag = "sr_operator_a_a"
                $0.title = "a. Apakah objective pada hari tersebut adalah menawarkan NPI?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_operator_a_ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_operator_a_b"
                $0.title = "b. Apakah SR telah menyiapkan wet sampling tools yang berkaitan dengan NPI diatas?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_operator_a_br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "B. Ikuti aktifitas SR dan memastikan SR menggunakan Armstrong secara maksimal (min. SR menggunakan Armstrong pada 4 aktifitas dibawah ini)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            
            <<< CheckRow(){
                $0.tag = "sr_operator_b_a"
                $0.title = "a. Pantry Check & Competitor Check"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_operator_b_ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_operator_b_b"
                $0.title = "b. Presentasi ke decision maker menggunakan Media Demo di Armstrong"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_operator_b_br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_operator_b_c"
                $0.title = "c. Melakukan Wet Sampling / cooking demo dan me-record di Armstrong"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_operator_b_cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "sr_operator_b_d"
                $0.title = "d. Mencatat TFO (Transfer Form Order) di Armstrong"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "sr_operator_b_dr"
                $0.placeholder = "\tRemarks:"
            }
            
            
            <<< ButtonRow("save") {row in
                row.title = "Save"
                row.onCellSelection(self.saveSRFormCoreData)
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
                    $0.options = ["USING AMSTRONG", "OPERATOR"]
                    $0.value = "USING AMSTRONG"
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
                
                
                +++ Section("USING AMSTRONG"){
                    $0.header?.title = "FAMILIARITY USING AMSTRONG"
                    $0.hidden = "$segments != 'USING AMSTRONG'"
                }
                <<< LabelRow(){
                    $0.title = "A. Completeness of Customer Profile (5 primary information for digital: contact person name, Customer/business name, postal code address, contact person telp/email, type of business/Channel) (and ask the OTM type to each customer) \n*how: home>customers> click on Customer name> search the info under \"Basic\" & \"Contact\""
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "1. Ask the SR to show the customer data with 5 primary information for digital"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_a_1a"
                    $0.title = "\ta. Customer 1"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_a_1ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_a_1b"
                    $0.title = "\tb. Customer 2"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_a_1br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_a_1c"
                    $0.title = "\tc. Customer 3"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_a_1cr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_a_1d"
                    $0.title = "\td. Customer 4"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_a_1dr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_a_1e"
                    $0.title = "\te. Customer 5"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_a_1er"
                    $0.placeholder = "\tRemarks:"
                }
                
                
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_a_2"
                    $0.title = "2. How many customers were not complete and why?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_a_2r"
                    $0.placeholder = "\tRemarks:"
                }
                
                
                <<< LabelRow(){
                    $0.title = "B. Ask SR to explain their achievement since using Armstrong\n*how : home > KPIs"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "1. Total Calls"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_1a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_1ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_1b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_1br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "2. Average Calls per working day "
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_2a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_2ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_2b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_2br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "3. Average Calls per actual working day"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_3a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_3ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_3b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_3br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "4. Strike rate (#TFO over #Total Calls)"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_4a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_4ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_4b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_4br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "5. Pantry Check"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_5a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_5ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_5b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_5br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "6. Sampling"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_6a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_6ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_6b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_6br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "7. OTM A fulfillment rate "
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_7a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_7ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_7b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_7br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "8. OTM B Fulfillment rate"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_8a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_8ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_8b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_8br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "9. OTM A call frequency "
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_9a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_9ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_9b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_9br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "10. OTM B call frequency"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_10a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_10ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_10b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_10br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "11. OTM A Average Call Time "
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_11a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_11ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_11b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_11br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "12. OTM B Average Call time"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_12a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_12ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_12b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_12br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "13. Total TFO Counts "
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_13a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_13ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_13b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_13br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "14. Total TFO Value"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_14a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_14ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_14b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_14br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "15. Total GRIP "
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_15a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_15ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_15b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_15br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "16. New Grip "
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_16a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_16ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_16b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_16br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "17. New Grab"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_17a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_17ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_17b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_17br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "18. Average Grab"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_18a"
                    $0.title = "\ta. What is the definition?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_18ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_b_18b"
                    $0.title = "\tb. What are the plans to improve?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_b_18br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "C. Chefmanship Skills"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_c_1"
                    $0.title = "1. How often do you conduct Wet Sampling in Operator ?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_c_1r"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_amstrong_c_2"
                    $0.title = "2.  What is the difficulty in conducting Wet Sampling ?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_amstrong_c_2r"
                    $0.placeholder = "\tRemarks:"
                }
                
                
                
                +++ Section("OPERATOR"){
                    $0.header?.title = "During operator visit"
                    $0.hidden = "$segments != 'OPERATOR'"
                }
                
                <<< LabelRow(){
                    $0.title = "A. Ask the SR to explain what preparation has been done in Armstrong"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    $0.tag = "sr_operator_a_a"
                    $0.title = "a. Does the objective of the day is to offer NPI?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_operator_a_ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_operator_a_b"
                    $0.title = "b. Does the SR prepared the wet sampling tools according to the NPI in the question a?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_operator_a_br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "B. Follow the SR activity and ensure the SR uses Armstrong to its maximum extent (SR at least uses Armstrong on these 4 activities below )"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    $0.tag = "sr_operator_b_a"
                    $0.title = "a. Pantry Check & Competitor Check"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_operator_b_ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_operator_b_b"
                    $0.title = "b. Presentation to decision maker using Media Demo in Armstrong"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_operator_b_br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_operator_b_c"
                    $0.title = "c. Doing Wet Sampling / cooking demo and record it using Armstrong"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_operator_b_cr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "sr_operator_b_d"
                    $0.title = "d. Record the TFO (Transfer Form Order) using Armstrong"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "sr_operator_b_dr"
                    $0.placeholder = "\tRemarks:"
                }
                
                
                <<< ButtonRow("save") {row in
                    row.title = "Save"
                    row.onCellSelection(self.saveSRFormCoreData)
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.textColor = UIColor.whiteColor()
                    })
        }
        
        print(AppDelegate.getAppDelegate().getDocDir())
    }
    
    
    func saveSRFormCoreData(cell: ButtonCellOf<String>, row: ButtonRow) {
        
        if let distributor = self.form.rowByTag("distributor")?.baseValue as? String
        {
            self.distributor = distributor
        }
        if let area = self.form.rowByTag("area")?.baseValue as? String
        {
            self.area = area
        }
        
        if let sr_amstrong_a_1a = self.form.rowByTag("sr_amstrong_a_1a")?.baseValue as? Bool
        {
            self.sr_amstrong_a_1a = sr_amstrong_a_1a
        }
        if let sr_amstrong_a_1ar = self.form.rowByTag("sr_amstrong_a_1ar")?.baseValue as? String
        {
            self.sr_amstrong_a_1ar = sr_amstrong_a_1ar
        }
        if let sr_amstrong_a_1b = self.form.rowByTag("sr_amstrong_a_1b")?.baseValue as? Bool
        {
            self.sr_amstrong_a_1b = sr_amstrong_a_1b
        }
        if let sr_amstrong_a_1br = self.form.rowByTag("sr_amstrong_a_1br")?.baseValue as? String
        {
            self.sr_amstrong_a_1br = sr_amstrong_a_1br
        }
        if let sr_amstrong_a_1c = self.form.rowByTag("sr_amstrong_a_1c")?.baseValue as? Bool
        {
            self.sr_amstrong_a_1c = sr_amstrong_a_1c
        }
        if let sr_amstrong_a_1cr = self.form.rowByTag("sr_amstrong_a_1cr")?.baseValue as? String
        {
            self.sr_amstrong_a_1cr = sr_amstrong_a_1cr
        }
        if let sr_amstrong_a_1d = self.form.rowByTag("sr_amstrong_a_1d")?.baseValue as? Bool
        {
            self.sr_amstrong_a_1d = sr_amstrong_a_1d
        }
        if let sr_amstrong_a_1dr = self.form.rowByTag("sr_amstrong_a_1dr")?.baseValue as? String
        {
            self.sr_amstrong_a_1dr = sr_amstrong_a_1dr
        }
        if let sr_amstrong_a_1e = self.form.rowByTag("sr_amstrong_a_1e")?.baseValue as? Bool
        {
            self.sr_amstrong_a_1e = sr_amstrong_a_1e
        }
        if let sr_amstrong_a_1er = self.form.rowByTag("sr_amstrong_a_1er")?.baseValue as? String
        {
            self.sr_amstrong_a_1er = sr_amstrong_a_1er
        }
        
        if let sr_amstrong_a_2 = self.form.rowByTag("sr_amstrong_a_2")?.baseValue as? Bool
        {
            self.sr_amstrong_a_2 = sr_amstrong_a_2
        }
        if let sr_amstrong_a_2r = self.form.rowByTag("sr_amstrong_a_2r")?.baseValue as? String
        {
            self.sr_amstrong_a_2r = sr_amstrong_a_2r
        }
        
        if let sr_amstrong_b_1a = self.form.rowByTag("sr_amstrong_b_1a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_1a = sr_amstrong_b_1a
        }
        if let sr_amstrong_b_1ar = self.form.rowByTag("sr_amstrong_b_1ar")?.baseValue as? String
        {
            self.sr_amstrong_b_1ar = sr_amstrong_b_1ar
        }
        if let sr_amstrong_b_1b = self.form.rowByTag("sr_amstrong_b_1b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_1b = sr_amstrong_b_1b
        }
        if let sr_amstrong_b_1br = self.form.rowByTag("sr_amstrong_b_1br")?.baseValue as? String
        {
            self.sr_amstrong_b_1br = sr_amstrong_b_1br
        }
        
        if let sr_amstrong_b_2a = self.form.rowByTag("sr_amstrong_b_2a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_2a = sr_amstrong_b_2a
        }
        if let sr_amstrong_b_2ar = self.form.rowByTag("sr_amstrong_b_2ar")?.baseValue as? String
        {
            self.sr_amstrong_b_2ar = sr_amstrong_b_2ar
        }
        if let sr_amstrong_b_2b = self.form.rowByTag("sr_amstrong_b_2b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_2b = sr_amstrong_b_2b
        }
        if let sr_amstrong_b_2br = self.form.rowByTag("sr_amstrong_b_2br")?.baseValue as? String
        {
            self.sr_amstrong_b_2br = sr_amstrong_b_2br
        }
        
        if let sr_amstrong_b_3a = self.form.rowByTag("sr_amstrong_b_3a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_3a = sr_amstrong_b_3a
        }
        if let sr_amstrong_b_3ar = self.form.rowByTag("sr_amstrong_b_3ar")?.baseValue as? String
        {
            self.sr_amstrong_b_3ar = sr_amstrong_b_3ar
        }
        if let sr_amstrong_b_3b = self.form.rowByTag("sr_amstrong_b_3b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_3b = sr_amstrong_b_3b
        }
        if let sr_amstrong_b_3br = self.form.rowByTag("sr_amstrong_b_3br")?.baseValue as? String
        {
            self.sr_amstrong_b_3br = sr_amstrong_b_3br
        }
        
        if let sr_amstrong_b_4a = self.form.rowByTag("sr_amstrong_b_4a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_4a = sr_amstrong_b_4a
        }
        if let sr_amstrong_b_4ar = self.form.rowByTag("sr_amstrong_b_4ar")?.baseValue as? String
        {
            self.sr_amstrong_b_4ar = sr_amstrong_b_4ar
        }
        if let sr_amstrong_b_4b = self.form.rowByTag("sr_amstrong_b_4b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_4b = sr_amstrong_b_4b
        }
        if let sr_amstrong_b_4br = self.form.rowByTag("sr_amstrong_b_4br")?.baseValue as? String
        {
            self.sr_amstrong_b_4br = sr_amstrong_b_4br
        }
        
        if let sr_amstrong_b_5a = self.form.rowByTag("sr_amstrong_b_5a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_5a = sr_amstrong_b_5a
        }
        if let sr_amstrong_b_5ar = self.form.rowByTag("sr_amstrong_b_5ar")?.baseValue as? String
        {
            self.sr_amstrong_b_5ar = sr_amstrong_b_5ar
        }
        if let sr_amstrong_b_5b = self.form.rowByTag("sr_amstrong_b_5b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_5b = sr_amstrong_b_5b
        }
        if let sr_amstrong_b_5br = self.form.rowByTag("sr_amstrong_b_5br")?.baseValue as? String
        {
            self.sr_amstrong_b_5br = sr_amstrong_b_5br
        }
        
        if let sr_amstrong_b_6a = self.form.rowByTag("sr_amstrong_b_6a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_6a = sr_amstrong_b_6a
        }
        if let sr_amstrong_b_6ar = self.form.rowByTag("sr_amstrong_b_6ar")?.baseValue as? String
        {
            self.sr_amstrong_b_6ar = sr_amstrong_b_6ar
        }
        if let sr_amstrong_b_6b = self.form.rowByTag("sr_amstrong_b_6b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_6b = sr_amstrong_b_6b
        }
        if let sr_amstrong_b_6br = self.form.rowByTag("sr_amstrong_b_6br")?.baseValue as? String
        {
            self.sr_amstrong_b_6br = sr_amstrong_b_6br
        }
        
        if let sr_amstrong_b_7a = self.form.rowByTag("sr_amstrong_b_7a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_7a = sr_amstrong_b_7a
        }
        if let sr_amstrong_b_7ar = self.form.rowByTag("sr_amstrong_b_7ar")?.baseValue as? String
        {
            self.sr_amstrong_b_7ar = sr_amstrong_b_7ar
        }
        if let sr_amstrong_b_7b = self.form.rowByTag("sr_amstrong_b_7b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_7b = sr_amstrong_b_7b
        }
        if let sr_amstrong_b_7br = self.form.rowByTag("sr_amstrong_b_7br")?.baseValue as? String
        {
            self.sr_amstrong_b_7br = sr_amstrong_b_7br
        }
        
        if let sr_amstrong_b_8a = self.form.rowByTag("sr_amstrong_b_8a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_8a = sr_amstrong_b_8a
        }
        if let sr_amstrong_b_8ar = self.form.rowByTag("sr_amstrong_b_8ar")?.baseValue as? String
        {
            self.sr_amstrong_b_8ar = sr_amstrong_b_8ar
        }
        if let sr_amstrong_b_8b = self.form.rowByTag("sr_amstrong_b_8b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_8b = sr_amstrong_b_8b
        }
        if let sr_amstrong_b_8br = self.form.rowByTag("sr_amstrong_b_8br")?.baseValue as? String
        {
            self.sr_amstrong_b_8br = sr_amstrong_b_8br
        }
        
        if let sr_amstrong_b_9a = self.form.rowByTag("sr_amstrong_b_9a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_9a = sr_amstrong_b_9a
        }
        if let sr_amstrong_b_9ar = self.form.rowByTag("sr_amstrong_b_9ar")?.baseValue as? String
        {
            self.sr_amstrong_b_9ar = sr_amstrong_b_9ar
        }
        if let sr_amstrong_b_9b = self.form.rowByTag("sr_amstrong_b_9b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_9b = sr_amstrong_b_9b
        }
        if let sr_amstrong_b_9br = self.form.rowByTag("sr_amstrong_b_9br")?.baseValue as? String
        {
            self.sr_amstrong_b_9br = sr_amstrong_b_9br
        }
        
        if let sr_amstrong_b_10a = self.form.rowByTag("sr_amstrong_b_10a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_10a = sr_amstrong_b_10a
        }
        if let sr_amstrong_b_10ar = self.form.rowByTag("sr_amstrong_b_10ar")?.baseValue as? String
        {
            self.sr_amstrong_b_10ar = sr_amstrong_b_10ar
        }
        if let sr_amstrong_b_10b = self.form.rowByTag("sr_amstrong_b_10b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_10b = sr_amstrong_b_10b
        }
        if let sr_amstrong_b_10br = self.form.rowByTag("sr_amstrong_b_10br")?.baseValue as? String
        {
            self.sr_amstrong_b_10br = sr_amstrong_b_10br
        }
        
        if let sr_amstrong_b_11a = self.form.rowByTag("sr_amstrong_b_11a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_11a = sr_amstrong_b_11a
        }
        if let sr_amstrong_b_11ar = self.form.rowByTag("sr_amstrong_b_11ar")?.baseValue as? String
        {
            self.sr_amstrong_b_11ar = sr_amstrong_b_11ar
        }
        if let sr_amstrong_b_11b = self.form.rowByTag("sr_amstrong_b_11b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_11b = sr_amstrong_b_11b
        }
        if let sr_amstrong_b_11br = self.form.rowByTag("sr_amstrong_b_11br")?.baseValue as? String
        {
            self.sr_amstrong_b_11br = sr_amstrong_b_11br
        }
        
        if let sr_amstrong_b_12a = self.form.rowByTag("sr_amstrong_b_12a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_12a = sr_amstrong_b_12a
        }
        if let sr_amstrong_b_12ar = self.form.rowByTag("sr_amstrong_b_12ar")?.baseValue as? String
        {
            self.sr_amstrong_b_12ar = sr_amstrong_b_12ar
        }
        if let sr_amstrong_b_12b = self.form.rowByTag("sr_amstrong_b_12b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_12b = sr_amstrong_b_12b
        }
        if let sr_amstrong_b_12br = self.form.rowByTag("sr_amstrong_b_12br")?.baseValue as? String
        {
            self.sr_amstrong_b_12br = sr_amstrong_b_12br
        }
        
        if let sr_amstrong_b_13a = self.form.rowByTag("sr_amstrong_b_13a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_13a = sr_amstrong_b_13a
        }
        if let sr_amstrong_b_13ar = self.form.rowByTag("sr_amstrong_b_13ar")?.baseValue as? String
        {
            self.sr_amstrong_b_13ar = sr_amstrong_b_13ar
        }
        if let sr_amstrong_b_13b = self.form.rowByTag("sr_amstrong_b_13b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_13b = sr_amstrong_b_13b
        }
        if let sr_amstrong_b_13br = self.form.rowByTag("sr_amstrong_b_13br")?.baseValue as? String
        {
            self.sr_amstrong_b_13br = sr_amstrong_b_13br
        }
        
        if let sr_amstrong_b_14a = self.form.rowByTag("sr_amstrong_b_14a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_14a = sr_amstrong_b_14a
        }
        if let sr_amstrong_b_14ar = self.form.rowByTag("sr_amstrong_b_14ar")?.baseValue as? String
        {
            self.sr_amstrong_b_14ar = sr_amstrong_b_14ar
        }
        if let sr_amstrong_b_14b = self.form.rowByTag("sr_amstrong_b_14b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_14b = sr_amstrong_b_14b
        }
        if let sr_amstrong_b_14br = self.form.rowByTag("sr_amstrong_b_14br")?.baseValue as? String
        {
            self.sr_amstrong_b_14br = sr_amstrong_b_14br
        }
        
        if let sr_amstrong_b_15a = self.form.rowByTag("sr_amstrong_b_15a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_15a = sr_amstrong_b_15a
        }
        if let sr_amstrong_b_15ar = self.form.rowByTag("sr_amstrong_b_15ar")?.baseValue as? String
        {
            self.sr_amstrong_b_15ar = sr_amstrong_b_15ar
        }
        if let sr_amstrong_b_15b = self.form.rowByTag("sr_amstrong_b_15b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_15b = sr_amstrong_b_15b
        }
        if let sr_amstrong_b_15br = self.form.rowByTag("sr_amstrong_b_15br")?.baseValue as? String
        {
            self.sr_amstrong_b_15br = sr_amstrong_b_15br
        }
        
        if let sr_amstrong_b_16a = self.form.rowByTag("sr_amstrong_b_16a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_16a = sr_amstrong_b_16a
        }
        if let sr_amstrong_b_16ar = self.form.rowByTag("sr_amstrong_b_16ar")?.baseValue as? String
        {
            self.sr_amstrong_b_16ar = sr_amstrong_b_16ar
        }
        if let sr_amstrong_b_16b = self.form.rowByTag("sr_amstrong_b_16b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_16b = sr_amstrong_b_16b
        }
        if let sr_amstrong_b_16br = self.form.rowByTag("sr_amstrong_b_16br")?.baseValue as? String
        {
            self.sr_amstrong_b_16br = sr_amstrong_b_16br
        }
        
        if let sr_amstrong_b_17a = self.form.rowByTag("sr_amstrong_b_17a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_17a = sr_amstrong_b_17a
        }
        if let sr_amstrong_b_17ar = self.form.rowByTag("sr_amstrong_b_17ar")?.baseValue as? String
        {
            self.sr_amstrong_b_17ar = sr_amstrong_b_17ar
        }
        if let sr_amstrong_b_17b = self.form.rowByTag("sr_amstrong_b_17b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_17b = sr_amstrong_b_17b
        }
        if let sr_amstrong_b_17br = self.form.rowByTag("sr_amstrong_b_17br")?.baseValue as? String
        {
            self.sr_amstrong_b_17br = sr_amstrong_b_17br
        }
        
        if let sr_amstrong_b_18a = self.form.rowByTag("sr_amstrong_b_18a")?.baseValue as? Bool
        {
            self.sr_amstrong_b_18a = sr_amstrong_b_18a
        }
        if let sr_amstrong_b_18ar = self.form.rowByTag("sr_amstrong_b_18ar")?.baseValue as? String
        {
            self.sr_amstrong_b_18ar = sr_amstrong_b_18ar
        }
        if let sr_amstrong_b_18b = self.form.rowByTag("sr_amstrong_b_18b")?.baseValue as? Bool
        {
            self.sr_amstrong_b_18b = sr_amstrong_b_18b
        }
        if let sr_amstrong_b_18br = self.form.rowByTag("sr_amstrong_b_18br")?.baseValue as? String
        {
            self.sr_amstrong_b_18br = sr_amstrong_b_18br
        }

        if let sr_amstrong_c_1 = self.form.rowByTag("sr_amstrong_c_1")?.baseValue as? Bool
        {
            self.sr_amstrong_c_1 = sr_amstrong_c_1
        }
        if let sr_amstrong_c_1r = self.form.rowByTag("sr_amstrong_c_1r")?.baseValue as? String
        {
            self.sr_amstrong_c_1r = sr_amstrong_c_1r
        }
        if let sr_amstrong_c_2 = self.form.rowByTag("sr_amstrong_c_2")?.baseValue as? Bool
        {
            self.sr_amstrong_c_2 = sr_amstrong_c_2
        }
        if let sr_amstrong_c_2r = self.form.rowByTag("sr_amstrong_c_2r")?.baseValue as? String
        {
            self.sr_amstrong_c_2r = sr_amstrong_c_2r
        }

        
        
        
        if let sr_operator_a_a = self.form.rowByTag("sr_operator_a_a")?.baseValue as? Bool
        {
            self.sr_operator_a_a = sr_operator_a_a
        }
        if let sr_operator_a_ar = self.form.rowByTag("sr_operator_a_ar")?.baseValue as? String
        {
            self.sr_operator_a_ar = sr_operator_a_ar
        }
        if let sr_operator_a_b = self.form.rowByTag("sr_operator_a_b")?.baseValue as? Bool
        {
            self.sr_operator_a_b = sr_operator_a_b
        }
        if let sr_operator_a_br = self.form.rowByTag("sr_operator_a_br")?.baseValue as? String
        {
            self.sr_operator_a_br = sr_operator_a_br
        }
        
        if let sr_operator_b_a = self.form.rowByTag("sr_operator_b_a")?.baseValue as? Bool
        {
            self.sr_operator_b_a = sr_operator_b_a
        }
        if let sr_operator_b_ar = self.form.rowByTag("sr_operator_b_ar")?.baseValue as? String
        {
            self.sr_operator_b_ar = sr_operator_b_ar
        }
        if let sr_operator_b_b = self.form.rowByTag("sr_operator_b_b")?.baseValue as? Bool
        {
            self.sr_operator_b_b = sr_operator_b_b
        }
        if let sr_operator_b_br = self.form.rowByTag("sr_operator_b_br")?.baseValue as? String
        {
            self.sr_operator_b_br = sr_operator_b_br
        }
        if let sr_operator_b_c = self.form.rowByTag("sr_operator_b_c")?.baseValue as? Bool
        {
            self.sr_operator_b_c = sr_operator_b_c
        }
        if let sr_operator_b_cr = self.form.rowByTag("sr_operator_b_cr")?.baseValue as? String
        {
            self.sr_operator_b_cr = sr_operator_b_cr
        }
        if let sr_operator_b_d = self.form.rowByTag("sr_operator_b_d")?.baseValue as? Bool
        {
            self.sr_operator_b_d = sr_operator_b_d
        }
        if let sr_operator_b_dr = self.form.rowByTag("sr_operator_b_dr")?.baseValue as? String
        {
            self.sr_operator_b_dr = sr_operator_b_dr
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        self.saveQuestionData("", questionID: "sr_amstrong_a_1a",textAnswer: self.sr_amstrong_a_1ar,tickAnswer: self.sr_amstrong_a_1a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_a_1b",textAnswer: self.sr_amstrong_a_1br,tickAnswer: self.sr_amstrong_a_1b, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_a_1c",textAnswer: self.sr_amstrong_a_1cr,tickAnswer: self.sr_amstrong_a_1c, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_a_1d",textAnswer: self.sr_amstrong_a_1dr,tickAnswer: self.sr_amstrong_a_1d, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_a_1e",textAnswer: self.sr_amstrong_a_1er,tickAnswer: self.sr_amstrong_a_1e, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_a_2",textAnswer: self.sr_amstrong_a_2r,tickAnswer: self.sr_amstrong_a_2, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_1a",textAnswer: self.sr_amstrong_b_1ar,tickAnswer: self.sr_amstrong_b_1a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_1b",textAnswer: self.sr_amstrong_b_1br,tickAnswer: self.sr_amstrong_b_1b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_2a",textAnswer: self.sr_amstrong_b_2ar,tickAnswer: self.sr_amstrong_b_2a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_2b",textAnswer: self.sr_amstrong_b_2br,tickAnswer: self.sr_amstrong_b_2b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_3a",textAnswer: self.sr_amstrong_b_3ar,tickAnswer: self.sr_amstrong_b_3a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_3b",textAnswer: self.sr_amstrong_b_3br,tickAnswer: self.sr_amstrong_b_3b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_4a",textAnswer: self.sr_amstrong_b_4ar,tickAnswer: self.sr_amstrong_b_4a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_4b",textAnswer: self.sr_amstrong_b_4br,tickAnswer: self.sr_amstrong_b_4b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_5a",textAnswer: self.sr_amstrong_b_5ar,tickAnswer: self.sr_amstrong_b_5a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_5b",textAnswer: self.sr_amstrong_b_5br,tickAnswer: self.sr_amstrong_b_5b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_6a",textAnswer: self.sr_amstrong_b_6ar,tickAnswer: self.sr_amstrong_b_6a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_6b",textAnswer: self.sr_amstrong_b_6br,tickAnswer: self.sr_amstrong_b_6b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_7a",textAnswer: self.sr_amstrong_b_7ar,tickAnswer: self.sr_amstrong_b_7a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_7b",textAnswer: self.sr_amstrong_b_7br,tickAnswer: self.sr_amstrong_b_7b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_8a",textAnswer: self.sr_amstrong_b_8ar,tickAnswer: self.sr_amstrong_b_8a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_8b",textAnswer: self.sr_amstrong_b_8br,tickAnswer: self.sr_amstrong_b_8b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_9a",textAnswer: self.sr_amstrong_b_9ar,tickAnswer: self.sr_amstrong_b_9a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_9b",textAnswer: self.sr_amstrong_b_9br,tickAnswer: self.sr_amstrong_b_9b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_10a",textAnswer: self.sr_amstrong_b_10ar,tickAnswer: self.sr_amstrong_b_10a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_10b",textAnswer: self.sr_amstrong_b_10br,tickAnswer: self.sr_amstrong_b_10b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_11a",textAnswer: self.sr_amstrong_b_11ar,tickAnswer: self.sr_amstrong_b_11a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_11b",textAnswer: self.sr_amstrong_b_11br,tickAnswer: self.sr_amstrong_b_11b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_12a",textAnswer: self.sr_amstrong_b_12ar,tickAnswer: self.sr_amstrong_b_12a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_12b",textAnswer: self.sr_amstrong_b_12br,tickAnswer: self.sr_amstrong_b_12b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_13a",textAnswer: self.sr_amstrong_b_13ar,tickAnswer: self.sr_amstrong_b_13a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_13b",textAnswer: self.sr_amstrong_b_13br,tickAnswer: self.sr_amstrong_b_13b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_14a",textAnswer: self.sr_amstrong_b_14ar,tickAnswer: self.sr_amstrong_b_14a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_14b",textAnswer: self.sr_amstrong_b_14br,tickAnswer: self.sr_amstrong_b_14b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_15a",textAnswer: self.sr_amstrong_b_15ar,tickAnswer: self.sr_amstrong_b_15a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_15b",textAnswer: self.sr_amstrong_b_15br,tickAnswer: self.sr_amstrong_b_15b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_16a",textAnswer: self.sr_amstrong_b_16ar,tickAnswer: self.sr_amstrong_b_16a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_16b",textAnswer: self.sr_amstrong_b_16br,tickAnswer: self.sr_amstrong_b_16b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_17a",textAnswer: self.sr_amstrong_b_17ar,tickAnswer: self.sr_amstrong_b_17a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_17b",textAnswer: self.sr_amstrong_b_17br,tickAnswer: self.sr_amstrong_b_17b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_b_18a",textAnswer: self.sr_amstrong_b_18ar,tickAnswer: self.sr_amstrong_b_18a, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_b_18b",textAnswer: self.sr_amstrong_b_18br,tickAnswer: self.sr_amstrong_b_18b, id: csession)
        
        self.saveQuestionData("", questionID: "sr_amstrong_c_1",textAnswer: self.sr_amstrong_c_1r,tickAnswer: self.sr_amstrong_c_1, id: csession)
        self.saveQuestionData("", questionID: "sr_amstrong_c_2",textAnswer: self.sr_amstrong_c_2r,tickAnswer: self.sr_amstrong_c_2, id: csession)
        
        
        self.saveQuestionData("", questionID: "sr_operator_a_a",textAnswer: self.sr_operator_a_ar,tickAnswer: self.sr_operator_a_a, id: csession)
        self.saveQuestionData("", questionID: "sr_operator_a_b",textAnswer: self.sr_operator_a_br,tickAnswer: self.sr_operator_a_b, id: csession)
        self.saveQuestionData("", questionID: "sr_operator_b_a",textAnswer: self.sr_operator_b_ar,tickAnswer: self.sr_operator_b_a, id: csession)
        self.saveQuestionData("", questionID: "sr_operator_b_b",textAnswer: self.sr_operator_b_br,tickAnswer: self.sr_operator_b_b, id: csession)
        self.saveQuestionData("", questionID: "sr_operator_b_c",textAnswer: self.sr_operator_b_cr,tickAnswer: self.sr_operator_b_c, id: csession)
        self.saveQuestionData("", questionID: "sr_operator_b_d",textAnswer: self.sr_operator_b_dr,tickAnswer: self.sr_operator_b_d, id: csession)
        
        
        self.updateCoachingData(self.distributor, area: self.area, id: csession)
        
        self.performSegueWithIdentifier("srToSummary", sender: nil)
        
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

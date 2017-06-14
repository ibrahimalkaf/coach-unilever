//
//  FASAQ.swift
//  FoodSolution
//
//  Created by baim alkaf on 10/13/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import CoreData
import Eureka

class FASAQ1 : FormViewController {
    
    var fa_1a : Bool = false
    var fa_1b : Bool = false
    var fa_2a : Bool = false
    var fa_2b : Bool = false
    var fa_3a : Bool = false
    var fa_4a : Bool = false
    var fa_5a : Bool = false
    var fa_6a : String = ""
    var fa_6b : String = ""
    var fa_6c : String = ""
    var fa_6d : String = ""
    var fa_7a : String = ""
    var fa_7b : String = ""
    var fa_7c : Bool = false
    var savedform : FASAObject = FASAObject()
    //var savedform : Form = Form()
    var language : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bahasa = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.language) {
            language = bahasa as String!
            print("bahasa:",bahasa)
        }
        
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("1fa_1a") as? Bool
        {
            self.fa_1a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("1fa_1b") as? Bool
        {
            self.fa_1b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("1fa_2a") as? Bool
        {
            self.fa_2a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("1fa_2b") as? Bool
        {
            self.fa_2b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("1fa_3a") as? Bool
        {
            self.fa_3a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("1fa_4a") as? Bool
        {
            self.fa_4a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("1fa_5a") as? Bool
        {
            self.fa_5a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("1fa_6a") as? String
        {
            self.fa_6a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("1fa_6b") as? String
        {
            self.fa_6b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("1fa_6c") as? String
        {
            self.fa_6c = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("1fa_6d") as? String
        {
            self.fa_6d = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("1fa_7a") as? String
        {
            self.fa_7a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("1fa_7b") as? String
        {
            self.fa_7b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("1fa_7c") as? Bool
        {
            self.fa_7c = temp
        }
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(11)
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
        
        if language == "Optional(\"Bahasa\")" {
            
        form
            +++ Section("Blue Band MCM 15kg/16kg")
            <<< LabelRow(){
                $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            
            <<< CheckRow(){
                if (self.fa_1a){
                    $0.baseValue = true
                }
                $0.tag = "fa_1a"
                $0.title = "a. Apakah produk tersedia di Shelf?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< CheckRow(){
                if self.fa_1b{
                    $0.baseValue = true
                }
                $0.tag = "fa_1b"
                $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            
            <<< LabelRow(){
                $0.title = "2. POINT OF SALES (POS)"
            }
            
            <<< CheckRow(){
                if (self.fa_2a){
                    $0.baseValue = true
                }
                $0.tag = "fa_2a"
                $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< CheckRow(){
                if (self.fa_2b){
                    $0.baseValue = true
                }
                $0.tag = "fa_2b"
                $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            
            <<< LabelRow(){
                $0.title = "3. FA/SA/Merchandiser Performance"
            }
            
            <<< CheckRow(){
                if (self.fa_3a){
                    $0.baseValue = true
                }
                $0.tag = "fa_3a"
                $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            
            <<< LabelRow(){
                $0.title = "4. PRODUCT DISTRIBUTION (PD)"
            }
            
            <<< CheckRow(){
                if (self.fa_4a){
                    $0.baseValue = true
                }
                $0.tag = "fa_4a"
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            
            <<< LabelRow(){
                $0.title = "5. PROMO COMPLIANCE (PC)"
            }
            
            <<< CheckRow(){
                if (self.fa_5a){
                    $0.baseValue = true
                }
                $0.tag = "fa_5a"
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            
            <<< LabelRow(){
                $0.title = "6. RELATIVE PRICE INDEX (RPI)"
            }
            
            <<< TextRow(){
                if (self.fa_6a != ""){
                    $0.baseValue = self.fa_6a
                }
                $0.tag = "fa_6a"
                $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                if (self.fa_6b != ""){
                    $0.baseValue = self.fa_6b
                }
                $0.tag = "fa_6b"
                $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t:\t Simas Palmia 15kg"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                if (self.fa_6c != ""){
                    $0.baseValue = self.fa_6c
                }
                $0.tag = "fa_6c"
                $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                if (self.fa_6d != ""){
                    $0.baseValue = self.fa_6d
                }
                $0.tag = "fa_6d"
                $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "fa_rpi"
                $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            
            <<< LabelRow(){
                $0.title = "7. SHARE OF SPACE (SOS)"
            }
            
            <<< TextRow(){
                if (self.fa_7a != ""){
                    $0.baseValue = self.fa_7a
                }
                $0.tag = "fa_7a"
                $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t:\t Simas Palmia 15kg"
            }
            <<< TextRow(){
                if (self.fa_7b != ""){
                    $0.baseValue = self.fa_7b
                }
                $0.tag = "fa_7b"
                $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            
            <<< CheckRow(){
                if (self.fa_7c){
                    $0.baseValue = true
                }
                $0.tag = "fa_7c"
                $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
        }
        if language == "Optional(\"English\")" {
            
            form
                +++ Section("Blue Band MCM 15kg/16kg")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                }
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Does all product available on Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Does all Front Pack face forward?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. What POS material is available from marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. If there are POS material from Trade Marketing, is it implemented?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Has the FA/SA/Merchandiser explained about product according to Selling Story to the customer? (if there is no customer, ask the advantage of the product)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. How much is the product price at the Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. What is the product size? (gram or ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t:\t Simas Palmia 15kg"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. How many tier is used to display UFS product at Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t:\t Simas Palmia 15kg"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. How many tier is used by similar competitor to display their product at Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Is the SOS (tier count) for UFS product more than competitor product?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        
    }
    override func viewWillDisappear(animated: Bool){
        print("back dipencet")
        
        if let fa_1a = self.form.rowByTag("fa_1a")?.baseValue as? Bool
        {
            self.fa_1a = fa_1a
        }
        if let fa_1b = self.form.rowByTag("fa_1b")?.baseValue as? Bool
        {
            self.fa_1b = fa_1b
        }
        if let fa_2a = self.form.rowByTag("fa_2a")?.baseValue as? Bool
        {
            self.fa_2a = fa_2a
        }
        if let fa_2b = self.form.rowByTag("fa_2b")?.baseValue as? Bool
        {
            self.fa_2b = fa_2b
        }
        if let fa_3a = self.form.rowByTag("fa_3a")?.baseValue as? Bool
        {
            self.fa_3a = fa_3a
        }
        if let fa_4a = self.form.rowByTag("fa_4a")?.baseValue as? Bool
        {
            self.fa_4a = fa_4a
        }
        if let fa_5a = self.form.rowByTag("fa_5a")?.baseValue as? Bool
        {
            self.fa_5a = fa_5a
        }
        if let fa_6a = self.form.rowByTag("fa_6a")?.baseValue as? String
        {
            self.fa_6a = fa_6a
        }
        if let fa_6b = self.form.rowByTag("fa_6b")?.baseValue as? String
        {
            self.fa_6b = fa_6b
        }
        if let fa_6c = self.form.rowByTag("fa_6c")?.baseValue as? String
        {
            self.fa_6c = fa_6c
        }
        if let fa_6d = self.form.rowByTag("fa_6d")?.baseValue as? String
        {
            self.fa_6d = fa_6d
        }
        if let fa_7a = self.form.rowByTag("fa_7a")?.baseValue as? String
        {
            self.fa_7a = fa_7a
        }
        if let fa_7b = self.form.rowByTag("fa_7b")?.baseValue as? String
        {
            self.fa_7b = fa_7b
        }
        if let fa_7c = self.form.rowByTag("fa_7c")?.baseValue as? Bool
        {
            self.fa_7c = fa_7c
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        self.SaveQuestion("Blue Band MCM 15kg/16kg", questionID: "fa_1a", textAnswer: "", tickAnswer: self.fa_1a, id: csession)
        self.SaveQuestion("Blue Band MCM 15kg/16kg", questionID: "fa_1b", textAnswer: "", tickAnswer: self.fa_1b, id: csession)
        self.SaveQuestion("Blue Band MCM 15kg/16kg", questionID: "fa_2a", textAnswer: "", tickAnswer: self.fa_2a, id: csession)
        self.SaveQuestion("Blue Band MCM 15kg/16kg", questionID: "fa_2b", textAnswer: "", tickAnswer: self.fa_2b, id: csession)
        self.SaveQuestion("Blue Band MCM 15kg/16kg", questionID: "fa_3a", textAnswer: "", tickAnswer: self.fa_3a, id: csession)
        self.SaveQuestion("Blue Band MCM 15kg/16kg", questionID: "fa_4a", textAnswer: "", tickAnswer: self.fa_4a, id: csession)
        self.SaveQuestion("Blue Band MCM 15kg/16kg", questionID: "fa_5a", textAnswer: "", tickAnswer: self.fa_5a, id: csession)
        self.SaveQuestion("Blue Band MCM 15kg/16kg", questionID: "fa_6a", textAnswer: self.fa_6a, tickAnswer: false, id: csession)
        self.SaveQuestion("Blue Band MCM 15kg/16kg", questionID: "fa_6b", textAnswer: self.fa_6b, tickAnswer: false, id: csession)
        self.SaveQuestion("Blue Band MCM 15kg/16kg", questionID: "fa_6c", textAnswer: self.fa_6c, tickAnswer: false, id: csession)
        self.SaveQuestion("Blue Band MCM 15kg/16kg", questionID: "fa_6d", textAnswer: self.fa_6d, tickAnswer: false, id: csession)
        self.SaveQuestion("Blue Band MCM 15kg/16kg", questionID: "fa_7a", textAnswer: self.fa_7a, tickAnswer: false, id: csession)
        self.SaveQuestion("Blue Band MCM 15kg/16kg", questionID: "fa_7b", textAnswer: self.fa_7b, tickAnswer: false, id: csession)
        self.SaveQuestion("Blue Band MCM 15kg/16kg", questionID: "fa_7c", textAnswer: "", tickAnswer: self.fa_7c, id: csession)
        
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1a, forKey: "1fa_1a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1b, forKey: "1fa_1b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2a, forKey: "1fa_2a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2b, forKey: "1fa_2b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_3a, forKey: "1fa_3a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_4a, forKey: "1fa_4a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_5a, forKey: "1fa_5a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6a, forKey: "1fa_6a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6b, forKey: "1fa_6b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6c, forKey: "1fa_6c")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6d, forKey: "1fa_6d")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7a, forKey: "1fa_7a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7b, forKey: "1fa_7b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7c, forKey: "1fa_7c")
        NSUserDefaults.standardUserDefaults().setObject(true, forKey: "1fa_done")
        
    }
    
    func SaveQuestion (columnID: String, questionID: String, textAnswer: String, tickAnswer:Bool, id: String) {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        
        // cek duplikasi dulu
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        fetchRequest.predicate = NSPredicate(format: "columnID = %@ AND questionID = %@ AND id = %@", columnID, questionID, id)
        do {
            
            //hapus duplikat
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count > 0{
                let duplicate = result[0] as! NSManagedObject
                managedObjectContext.deleteObject(duplicate)
                try managedObjectContext.save()
            }
            
            //setelah duplikat dihapus, baru tulis baru
            let entity = NSEntityDescription.entityForName("CoachingQuestionAnswer", inManagedObjectContext: managedObjectContext)
            let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
            
            managedObject.setValue(columnID, forKey: "columnID")
            managedObject.setValue(questionID, forKey: "questionID")
            managedObject.setValue(textAnswer, forKey: "textAnswer")
            managedObject.setValue(tickAnswer, forKey: "tickAnswer")
            managedObject.setValue(id, forKey: "id")
            
            try managedObjectContext.save()
        }
            
        catch let error as NSError {
            print(error)
        }
    }
}

class FASAQ2 : FormViewController {
    
    var fa_1a : Bool = false
    var fa_1b : Bool = false
    var fa_2a : Bool = false
    var fa_2b : Bool = false
    var fa_3a : Bool = false
    var fa_4a : Bool = false
    var fa_5a : Bool = false
    var fa_6a : String = ""
    var fa_6b : String = ""
    var fa_6c : String = ""
    var fa_6d : String = ""
    var fa_7a : String = ""
    var fa_7b : String = ""
    var fa_7c : Bool = false
    var savedform : FASAObject = FASAObject()
    //var savedform : Form = Form()
    var language : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bahasa = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.language) {
            language = bahasa as String!
            print("bahasa:",bahasa)
        }
        
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("2fa_1a") as? Bool
        {
            self.fa_1a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("2fa_1b") as? Bool
        {
            self.fa_1b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("2fa_2a") as? Bool
        {
            self.fa_2a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("2fa_2b") as? Bool
        {
            self.fa_2b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("2fa_3a") as? Bool
        {
            self.fa_3a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("2fa_4a") as? Bool
        {
            self.fa_4a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("2fa_5a") as? Bool
        {
            self.fa_5a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("2fa_6a") as? String
        {
            self.fa_6a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("2fa_6b") as? String
        {
            self.fa_6b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("2fa_6c") as? String
        {
            self.fa_6c = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("2fa_6d") as? String
        {
            self.fa_6d = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("2fa_7a") as? String
        {
            self.fa_7a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("2fa_7b") as? String
        {
            self.fa_7b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("2fa_7c") as? Bool
        {
            self.fa_7c = temp
        }
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(11)
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
        
        if language == "Optional(\"Bahasa\")" {
            
            form
                +++ Section("Bango Kecap Manis 1.7kg")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Apakah produk tersedia di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Kecap Manis ABC 580ml"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t:\t Kecap Manis ABC 580ml"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        if language == "Optional(\"English\")" {
            
            form
                +++ Section("Bango Kecap Manis 1.7kg")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                }
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Does all product available on Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Does all Front Pack face forward?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. What POS material is available from marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. If there are POS material from Trade Marketing, is it implemented?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Has the FA/SA/Merchandiser explained about product according to Selling Story to the customer? (if there is no customer, ask the advantage of the product)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. How much is the product price at the Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. What is the product size? (gram or ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t\t Kecap Manis ABC 580ml"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. How many tier is used to display UFS product at Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t:\t Kecap Manis ABC 580ml"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. How many tier is used by similar competitor to display their product at Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Is the SOS (tier count) for UFS product more than competitor product?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        
    }
    override func viewWillDisappear(animated: Bool){
        print("back dipencet")
        
        if let fa_1a = self.form.rowByTag("fa_1a")?.baseValue as? Bool
        {
            self.fa_1a = fa_1a
        }
        if let fa_1b = self.form.rowByTag("fa_1b")?.baseValue as? Bool
        {
            self.fa_1b = fa_1b
        }
        if let fa_2a = self.form.rowByTag("fa_2a")?.baseValue as? Bool
        {
            self.fa_2a = fa_2a
        }
        if let fa_2b = self.form.rowByTag("fa_2b")?.baseValue as? Bool
        {
            self.fa_2b = fa_2b
        }
        if let fa_3a = self.form.rowByTag("fa_3a")?.baseValue as? Bool
        {
            self.fa_3a = fa_3a
        }
        if let fa_4a = self.form.rowByTag("fa_4a")?.baseValue as? Bool
        {
            self.fa_4a = fa_4a
        }
        if let fa_5a = self.form.rowByTag("fa_5a")?.baseValue as? Bool
        {
            self.fa_5a = fa_5a
        }
        if let fa_6a = self.form.rowByTag("fa_6a")?.baseValue as? String
        {
            self.fa_6a = fa_6a
        }
        if let fa_6b = self.form.rowByTag("fa_6b")?.baseValue as? String
        {
            self.fa_6b = fa_6b
        }
        if let fa_6c = self.form.rowByTag("fa_6c")?.baseValue as? String
        {
            self.fa_6c = fa_6c
        }
        if let fa_6d = self.form.rowByTag("fa_6d")?.baseValue as? String
        {
            self.fa_6d = fa_6d
        }
        if let fa_7a = self.form.rowByTag("fa_7a")?.baseValue as? String
        {
            self.fa_7a = fa_7a
        }
        if let fa_7b = self.form.rowByTag("fa_7b")?.baseValue as? String
        {
            self.fa_7b = fa_7b
        }
        if let fa_7c = self.form.rowByTag("fa_7c")?.baseValue as? Bool
        {
            self.fa_7c = fa_7c
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        self.SaveQuestion("Bango Kecap Manis 1.7kg", questionID: "fa_1a", textAnswer: "", tickAnswer: self.fa_1a, id: csession)
        self.SaveQuestion("Bango Kecap Manis 1.7kg", questionID: "fa_1b", textAnswer: "", tickAnswer: self.fa_1b, id: csession)
        self.SaveQuestion("Bango Kecap Manis 1.7kg", questionID: "fa_2a", textAnswer: "", tickAnswer: self.fa_2a, id: csession)
        self.SaveQuestion("Bango Kecap Manis 1.7kg", questionID: "fa_2b", textAnswer: "", tickAnswer: self.fa_2b, id: csession)
        self.SaveQuestion("Bango Kecap Manis 1.7kg", questionID: "fa_3a", textAnswer: "", tickAnswer: self.fa_3a, id: csession)
        self.SaveQuestion("Bango Kecap Manis 1.7kg", questionID: "fa_4a", textAnswer: "", tickAnswer: self.fa_4a, id: csession)
        self.SaveQuestion("Bango Kecap Manis 1.7kg", questionID: "fa_5a", textAnswer: "", tickAnswer: self.fa_5a, id: csession)
        self.SaveQuestion("Bango Kecap Manis 1.7kg", questionID: "fa_6a", textAnswer: self.fa_6a, tickAnswer: false, id: csession)
        self.SaveQuestion("Bango Kecap Manis 1.7kg", questionID: "fa_6b", textAnswer: self.fa_6b, tickAnswer: false, id: csession)
        self.SaveQuestion("Bango Kecap Manis 1.7kg", questionID: "fa_6c", textAnswer: self.fa_6c, tickAnswer: false, id: csession)
        self.SaveQuestion("Bango Kecap Manis 1.7kg", questionID: "fa_6d", textAnswer: self.fa_6d, tickAnswer: false, id: csession)
        self.SaveQuestion("Bango Kecap Manis 1.7kg", questionID: "fa_7a", textAnswer: self.fa_7a, tickAnswer: false, id: csession)
        self.SaveQuestion("Bango Kecap Manis 1.7kg", questionID: "fa_7b", textAnswer: self.fa_7b, tickAnswer: false, id: csession)
        self.SaveQuestion("Bango Kecap Manis 1.7kg", questionID: "fa_7c", textAnswer: "", tickAnswer: self.fa_7c, id: csession)
        
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1a, forKey: "2fa_1a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1b, forKey: "2fa_1b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2a, forKey: "2fa_2a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2b, forKey: "2fa_2b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_3a, forKey: "2fa_3a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_4a, forKey: "2fa_4a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_5a, forKey: "2fa_5a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6a, forKey: "2fa_6a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6b, forKey: "2fa_6b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6c, forKey: "2fa_6c")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6d, forKey: "2fa_6d")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7a, forKey: "2fa_7a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7b, forKey: "2fa_7b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7c, forKey: "2fa_7c")
        NSUserDefaults.standardUserDefaults().setObject(true, forKey: "2fa_done")
        
    }
    
    func SaveQuestion (columnID: String, questionID: String, textAnswer: String, tickAnswer:Bool, id: String) {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        
        // cek duplikasi dulu
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        fetchRequest.predicate = NSPredicate(format: "columnID = %@ AND questionID = %@ AND id = %@", columnID, questionID, id)
        do {
            
            //hapus duplikat
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count > 0{
                let duplicate = result[0] as! NSManagedObject
                managedObjectContext.deleteObject(duplicate)
                try managedObjectContext.save()
            }
            
            //setelah duplikat dihapus, baru tulis baru
            let entity = NSEntityDescription.entityForName("CoachingQuestionAnswer", inManagedObjectContext: managedObjectContext)
            let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
            
            managedObject.setValue(columnID, forKey: "columnID")
            managedObject.setValue(questionID, forKey: "questionID")
            managedObject.setValue(textAnswer, forKey: "textAnswer")
            managedObject.setValue(tickAnswer, forKey: "tickAnswer")
            managedObject.setValue(id, forKey: "id")
            
            try managedObjectContext.save()
        }
            
        catch let error as NSError {
            print(error)
        }
    }
}

class FASAQ3 : FormViewController {
    
    var fa_1a : Bool = false
    var fa_1b : Bool = false
    var fa_2a : Bool = false
    var fa_2b : Bool = false
    var fa_3a : Bool = false
    var fa_4a : Bool = false
    var fa_5a : Bool = false
    var fa_6a : String = ""
    var fa_6b : String = ""
    var fa_6c : String = ""
    var fa_6d : String = ""
    var fa_7a : String = ""
    var fa_7b : String = ""
    var fa_7c : Bool = false
    var savedform : FASAObject = FASAObject()
    //var savedform : Form = Form()
    var language : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bahasa = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.language) {
            language = bahasa as String!
            print("bahasa:",bahasa)
        }
        
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("3fa_1a") as? Bool
        {
            self.fa_1a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("3fa_1b") as? Bool
        {
            self.fa_1b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("3fa_2a") as? Bool
        {
            self.fa_2a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("3fa_2b") as? Bool
        {
            self.fa_2b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("3fa_3a") as? Bool
        {
            self.fa_3a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("3fa_4a") as? Bool
        {
            self.fa_4a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("3fa_5a") as? Bool
        {
            self.fa_5a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("3fa_6a") as? String
        {
            self.fa_6a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("3fa_6b") as? String
        {
            self.fa_6b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("3fa_6c") as? String
        {
            self.fa_6c = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("3fa_6d") as? String
        {
            self.fa_6d = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("3fa_7a") as? String
        {
            self.fa_7a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("3fa_7b") as? String
        {
            self.fa_7b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("3fa_7c") as? Bool
        {
            self.fa_7c = temp
        }
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(11)
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
        
        if language == "Optional(\"Bahasa\")" {
            
            form
                +++ Section("Blue Band Original 4.5kg")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Apakah produk tersedia di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Simas Palmia 4kg"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t:\t Simas Palmia 4kg"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        if language == "Optional(\"English\")" {
            
            form
                +++ Section("Blue Band Original 4.5kg")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                }
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Does all product available on Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Does all Front Pack face forward?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. What POS material is available from marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. If there are POS material from Trade Marketing, is it implemented?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Has the FA/SA/Merchandiser explained about product according to Selling Story to the customer? (if there is no customer, ask the advantage of the product)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. How much is the product price at the Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. What is the product size? (gram or ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t\t Simas Palmia 4kg"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. How many tier is used to display UFS product at Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t:\t Simas Palmia 4kg"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. How many tier is used by similar competitor to display their product at Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Is the SOS (tier count) for UFS product more than competitor product?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        
    }
    override func viewWillDisappear(animated: Bool){
        print("back dipencet")
        
        if let fa_1a = self.form.rowByTag("fa_1a")?.baseValue as? Bool
        {
            self.fa_1a = fa_1a
        }
        if let fa_1b = self.form.rowByTag("fa_1b")?.baseValue as? Bool
        {
            self.fa_1b = fa_1b
        }
        if let fa_2a = self.form.rowByTag("fa_2a")?.baseValue as? Bool
        {
            self.fa_2a = fa_2a
        }
        if let fa_2b = self.form.rowByTag("fa_2b")?.baseValue as? Bool
        {
            self.fa_2b = fa_2b
        }
        if let fa_3a = self.form.rowByTag("fa_3a")?.baseValue as? Bool
        {
            self.fa_3a = fa_3a
        }
        if let fa_4a = self.form.rowByTag("fa_4a")?.baseValue as? Bool
        {
            self.fa_4a = fa_4a
        }
        if let fa_5a = self.form.rowByTag("fa_5a")?.baseValue as? Bool
        {
            self.fa_5a = fa_5a
        }
        if let fa_6a = self.form.rowByTag("fa_6a")?.baseValue as? String
        {
            self.fa_6a = fa_6a
        }
        if let fa_6b = self.form.rowByTag("fa_6b")?.baseValue as? String
        {
            self.fa_6b = fa_6b
        }
        if let fa_6c = self.form.rowByTag("fa_6c")?.baseValue as? String
        {
            self.fa_6c = fa_6c
        }
        if let fa_6d = self.form.rowByTag("fa_6d")?.baseValue as? String
        {
            self.fa_6d = fa_6d
        }
        if let fa_7a = self.form.rowByTag("fa_7a")?.baseValue as? String
        {
            self.fa_7a = fa_7a
        }
        if let fa_7b = self.form.rowByTag("fa_7b")?.baseValue as? String
        {
            self.fa_7b = fa_7b
        }
        if let fa_7c = self.form.rowByTag("fa_7c")?.baseValue as? Bool
        {
            self.fa_7c = fa_7c
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        self.SaveQuestion("Blue Band Original 4.5kg", questionID: "fa_1a", textAnswer: "", tickAnswer: self.fa_1a, id: csession)
        self.SaveQuestion("Blue Band Original 4.5kg", questionID: "fa_1b", textAnswer: "", tickAnswer: self.fa_1b, id: csession)
        self.SaveQuestion("Blue Band Original 4.5kg", questionID: "fa_2a", textAnswer: "", tickAnswer: self.fa_2a, id: csession)
        self.SaveQuestion("Blue Band Original 4.5kg", questionID: "fa_2b", textAnswer: "", tickAnswer: self.fa_2b, id: csession)
        self.SaveQuestion("Blue Band Original 4.5kg", questionID: "fa_3a", textAnswer: "", tickAnswer: self.fa_3a, id: csession)
        self.SaveQuestion("Blue Band Original 4.5kg", questionID: "fa_4a", textAnswer: "", tickAnswer: self.fa_4a, id: csession)
        self.SaveQuestion("Blue Band Original 4.5kg", questionID: "fa_5a", textAnswer: "", tickAnswer: self.fa_5a, id: csession)
        self.SaveQuestion("Blue Band Original 4.5kg", questionID: "fa_6a", textAnswer: self.fa_6a, tickAnswer: false, id: csession)
        self.SaveQuestion("Blue Band Original 4.5kg", questionID: "fa_6b", textAnswer: self.fa_6b, tickAnswer: false, id: csession)
        self.SaveQuestion("Blue Band Original 4.5kg", questionID: "fa_6c", textAnswer: self.fa_6c, tickAnswer: false, id: csession)
        self.SaveQuestion("Blue Band Original 4.5kg", questionID: "fa_6d", textAnswer: self.fa_6d, tickAnswer: false, id: csession)
        self.SaveQuestion("Blue Band Original 4.5kg", questionID: "fa_7a", textAnswer: self.fa_7a, tickAnswer: false, id: csession)
        self.SaveQuestion("Blue Band Original 4.5kg", questionID: "fa_7b", textAnswer: self.fa_7b, tickAnswer: false, id: csession)
        self.SaveQuestion("Blue Band Original 4.5kg", questionID: "fa_7c", textAnswer: "", tickAnswer: self.fa_7c, id: csession)
        
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1a, forKey: "3fa_1a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1b, forKey: "3fa_1b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2a, forKey: "3fa_2a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2b, forKey: "3fa_2b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_3a, forKey: "3fa_3a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_4a, forKey: "3fa_4a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_5a, forKey: "3fa_5a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6a, forKey: "3fa_6a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6b, forKey: "3fa_6b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6c, forKey: "3fa_6c")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6d, forKey: "3fa_6d")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7a, forKey: "3fa_7a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7b, forKey: "3fa_7b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7c, forKey: "3fa_7c")
        NSUserDefaults.standardUserDefaults().setObject(true, forKey: "3fa_done")
        
    }
    
    func SaveQuestion (columnID: String, questionID: String, textAnswer: String, tickAnswer:Bool, id: String) {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        
        // cek duplikasi dulu
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        fetchRequest.predicate = NSPredicate(format: "columnID = %@ AND questionID = %@ AND id = %@", columnID, questionID, id)
        do {
            
            //hapus duplikat
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count > 0{
                let duplicate = result[0] as! NSManagedObject
                managedObjectContext.deleteObject(duplicate)
                try managedObjectContext.save()
            }
            
            //setelah duplikat dihapus, baru tulis baru
            let entity = NSEntityDescription.entityForName("CoachingQuestionAnswer", inManagedObjectContext: managedObjectContext)
            let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
            
            managedObject.setValue(columnID, forKey: "columnID")
            managedObject.setValue(questionID, forKey: "questionID")
            managedObject.setValue(textAnswer, forKey: "textAnswer")
            managedObject.setValue(tickAnswer, forKey: "tickAnswer")
            managedObject.setValue(id, forKey: "id")
            
            try managedObjectContext.save()
        }
            
        catch let error as NSError {
            print(error)
        }
    }
}

class FASAQ4 : FormViewController {
    
    var fa_1a : Bool = false
    var fa_1b : Bool = false
    var fa_2a : Bool = false
    var fa_2b : Bool = false
    var fa_3a : Bool = false
    var fa_4a : Bool = false
    var fa_5a : Bool = false
    var fa_6a : String = ""
    var fa_6b : String = ""
    var fa_6c : String = ""
    var fa_6d : String = ""
    var fa_7a : String = ""
    var fa_7b : String = ""
    var fa_7c : Bool = false
    var savedform : FASAObject = FASAObject()
    //var savedform : Form = Form()
    var language : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bahasa = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.language) {
            language = bahasa as String!
            print("bahasa:",bahasa)
        }
        
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("4fa_1a") as? Bool
        {
            self.fa_1a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("4fa_1b") as? Bool
        {
            self.fa_1b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("4fa_2a") as? Bool
        {
            self.fa_2a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("4fa_2b") as? Bool
        {
            self.fa_2b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("4fa_3a") as? Bool
        {
            self.fa_3a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("4fa_4a") as? Bool
        {
            self.fa_4a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("4fa_5a") as? Bool
        {
            self.fa_5a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("4fa_6a") as? String
        {
            self.fa_6a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("4fa_6b") as? String
        {
            self.fa_6b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("4fa_6c") as? String
        {
            self.fa_6c = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("4fa_6d") as? String
        {
            self.fa_6d = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("4fa_7a") as? String
        {
            self.fa_7a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("4fa_7b") as? String
        {
            self.fa_7b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("4fa_7c") as? Bool
        {
            self.fa_7c = temp
        }
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(11)
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
        
        if language == "Optional(\"Bahasa\")" {
            
            form
                +++ Section("Knorr Chicken Powder Refill 1Kg")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Apakah produk tersedia di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Maggi Chicken Bouillon 1kg"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t:\t Maggi Chicken Bouillon 1kg"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        if language == "Optional(\"English\")" {
            
            form
                +++ Section("Knorr Chicken Powder Refill 1Kg")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                }
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Does all product available on Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Does all Front Pack face forward?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. What POS material is available from marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. If there are POS material from Trade Marketing, is it implemented?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Has the FA/SA/Merchandiser explained about product according to Selling Story to the customer? (if there is no customer, ask the advantage of the product)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. How much is the product price at the Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. What is the product size? (gram or ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t\t Maggi Chicken Bouillon 1kg"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. How many tier is used to display UFS product at Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t:\t Maggi Chicken Bouillon 1kg"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. How many tier is used by similar competitor to display their product at Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Is the SOS (tier count) for UFS product more than competitor product?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        
    }
    override func viewWillDisappear(animated: Bool){
        print("back dipencet")
        
        if let fa_1a = self.form.rowByTag("fa_1a")?.baseValue as? Bool
        {
            self.fa_1a = fa_1a
        }
        if let fa_1b = self.form.rowByTag("fa_1b")?.baseValue as? Bool
        {
            self.fa_1b = fa_1b
        }
        if let fa_2a = self.form.rowByTag("fa_2a")?.baseValue as? Bool
        {
            self.fa_2a = fa_2a
        }
        if let fa_2b = self.form.rowByTag("fa_2b")?.baseValue as? Bool
        {
            self.fa_2b = fa_2b
        }
        if let fa_3a = self.form.rowByTag("fa_3a")?.baseValue as? Bool
        {
            self.fa_3a = fa_3a
        }
        if let fa_4a = self.form.rowByTag("fa_4a")?.baseValue as? Bool
        {
            self.fa_4a = fa_4a
        }
        if let fa_5a = self.form.rowByTag("fa_5a")?.baseValue as? Bool
        {
            self.fa_5a = fa_5a
        }
        if let fa_6a = self.form.rowByTag("fa_6a")?.baseValue as? String
        {
            self.fa_6a = fa_6a
        }
        if let fa_6b = self.form.rowByTag("fa_6b")?.baseValue as? String
        {
            self.fa_6b = fa_6b
        }
        if let fa_6c = self.form.rowByTag("fa_6c")?.baseValue as? String
        {
            self.fa_6c = fa_6c
        }
        if let fa_6d = self.form.rowByTag("fa_6d")?.baseValue as? String
        {
            self.fa_6d = fa_6d
        }
        if let fa_7a = self.form.rowByTag("fa_7a")?.baseValue as? String
        {
            self.fa_7a = fa_7a
        }
        if let fa_7b = self.form.rowByTag("fa_7b")?.baseValue as? String
        {
            self.fa_7b = fa_7b
        }
        if let fa_7c = self.form.rowByTag("fa_7c")?.baseValue as? Bool
        {
            self.fa_7c = fa_7c
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        self.SaveQuestion("Knorr Chicken Powder Refill 1Kg", questionID: "fa_1a", textAnswer: "", tickAnswer: self.fa_1a, id: csession)
        self.SaveQuestion("Knorr Chicken Powder Refill 1Kg", questionID: "fa_1b", textAnswer: "", tickAnswer: self.fa_1b, id: csession)
        self.SaveQuestion("Knorr Chicken Powder Refill 1Kg", questionID: "fa_2a", textAnswer: "", tickAnswer: self.fa_2a, id: csession)
        self.SaveQuestion("Knorr Chicken Powder Refill 1Kg", questionID: "fa_2b", textAnswer: "", tickAnswer: self.fa_2b, id: csession)
        self.SaveQuestion("Knorr Chicken Powder Refill 1Kg", questionID: "fa_3a", textAnswer: "", tickAnswer: self.fa_3a, id: csession)
        self.SaveQuestion("Knorr Chicken Powder Refill 1Kg", questionID: "fa_4a", textAnswer: "", tickAnswer: self.fa_4a, id: csession)
        self.SaveQuestion("Knorr Chicken Powder Refill 1Kg", questionID: "fa_5a", textAnswer: "", tickAnswer: self.fa_5a, id: csession)
        self.SaveQuestion("Knorr Chicken Powder Refill 1Kg", questionID: "fa_6a", textAnswer: self.fa_6a, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Chicken Powder Refill 1Kg", questionID: "fa_6b", textAnswer: self.fa_6b, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Chicken Powder Refill 1Kg", questionID: "fa_6c", textAnswer: self.fa_6c, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Chicken Powder Refill 1Kg", questionID: "fa_6d", textAnswer: self.fa_6d, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Chicken Powder Refill 1Kg", questionID: "fa_7a", textAnswer: self.fa_7a, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Chicken Powder Refill 1Kg", questionID: "fa_7b", textAnswer: self.fa_7b, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Chicken Powder Refill 1Kg", questionID: "fa_7c", textAnswer: "", tickAnswer: self.fa_7c, id: csession)
        
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1a, forKey: "4fa_1a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1b, forKey: "4fa_1b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2a, forKey: "4fa_2a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2b, forKey: "4fa_2b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_3a, forKey: "4fa_3a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_4a, forKey: "4fa_4a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_5a, forKey: "4fa_5a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6a, forKey: "4fa_6a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6b, forKey: "4fa_6b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6c, forKey: "4fa_6c")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6d, forKey: "4fa_6d")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7a, forKey: "4fa_7a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7b, forKey: "4fa_7b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7c, forKey: "4fa_7c")
        NSUserDefaults.standardUserDefaults().setObject(true, forKey: "4fa_done")
        
    }
    
    func SaveQuestion (columnID: String, questionID: String, textAnswer: String, tickAnswer:Bool, id: String) {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        
        // cek duplikasi dulu
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        fetchRequest.predicate = NSPredicate(format: "columnID = %@ AND questionID = %@ AND id = %@", columnID, questionID, id)
        do {
            
            //hapus duplikat
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count > 0{
                let duplicate = result[0] as! NSManagedObject
                managedObjectContext.deleteObject(duplicate)
                try managedObjectContext.save()
            }
            
            //setelah duplikat dihapus, baru tulis baru
            let entity = NSEntityDescription.entityForName("CoachingQuestionAnswer", inManagedObjectContext: managedObjectContext)
            let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
            
            managedObject.setValue(columnID, forKey: "columnID")
            managedObject.setValue(questionID, forKey: "questionID")
            managedObject.setValue(textAnswer, forKey: "textAnswer")
            managedObject.setValue(tickAnswer, forKey: "tickAnswer")
            managedObject.setValue(id, forKey: "id")
            
            try managedObjectContext.save()
        }
            
        catch let error as NSError {
            print(error)
        }
    }
}

class FASAQ5 : FormViewController {
    
    var fa_1a : Bool = false
    var fa_1b : Bool = false
    var fa_2a : Bool = false
    var fa_2b : Bool = false
    var fa_3a : Bool = false
    var fa_4a : Bool = false
    var fa_5a : Bool = false
    var fa_6a : String = ""
    var fa_6b : String = ""
    var fa_6c : String = ""
    var fa_6d : String = ""
    var fa_7a : String = ""
    var fa_7b : String = ""
    var fa_7c : Bool = false
    var savedform : FASAObject = FASAObject()
    //var savedform : Form = Form()
    var language : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bahasa = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.language) {
            language = bahasa as String!
            print("bahasa:",bahasa)
        }
        
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("5fa_1a") as? Bool
        {
            self.fa_1a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("5fa_1b") as? Bool
        {
            self.fa_1b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("5fa_2a") as? Bool
        {
            self.fa_2a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("5fa_2b") as? Bool
        {
            self.fa_2b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("5fa_3a") as? Bool
        {
            self.fa_3a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("5fa_4a") as? Bool
        {
            self.fa_4a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("5fa_5a") as? Bool
        {
            self.fa_5a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("5fa_6a") as? String
        {
            self.fa_6a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("5fa_6b") as? String
        {
            self.fa_6b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("5fa_6c") as? String
        {
            self.fa_6c = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("5fa_6d") as? String
        {
            self.fa_6d = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("5fa_7a") as? String
        {
            self.fa_7a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("5fa_7b") as? String
        {
            self.fa_7b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("5fa_7c") as? Bool
        {
            self.fa_7c = temp
        }
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(11)
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
        
        if language == "Optional(\"Bahasa\")" {
            
            form
                +++ Section("Royco Chicken 1kg")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Apakah produk tersedia di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Masako Penyedap Ayam & Sapi 1Kg"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t:\t Masako Penyedap Ayam & Sapi 1Kg"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        if language == "Optional(\"English\")" {
            
            form
                +++ Section("Royco Chicken 1kg")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                }
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Does all product available on Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Does all Front Pack face forward?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. What POS material is available from marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. If there are POS material from Trade Marketing, is it implemented?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Has the FA/SA/Merchandiser explained about product according to Selling Story to the customer? (if there is no customer, ask the advantage of the product)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. How much is the product price at the Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. What is the product size? (gram or ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t\t Masako Penyedap Ayam & Sapi 1Kg"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. How many tier is used to display UFS product at Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t:\t Masako Penyedap Ayam & Sapi 1Kg"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. How many tier is used by similar competitor to display their product at Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Is the SOS (tier count) for UFS product more than competitor product?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        
    }
    override func viewWillDisappear(animated: Bool){
        print("back dipencet")
        
        if let fa_1a = self.form.rowByTag("fa_1a")?.baseValue as? Bool
        {
            self.fa_1a = fa_1a
        }
        if let fa_1b = self.form.rowByTag("fa_1b")?.baseValue as? Bool
        {
            self.fa_1b = fa_1b
        }
        if let fa_2a = self.form.rowByTag("fa_2a")?.baseValue as? Bool
        {
            self.fa_2a = fa_2a
        }
        if let fa_2b = self.form.rowByTag("fa_2b")?.baseValue as? Bool
        {
            self.fa_2b = fa_2b
        }
        if let fa_3a = self.form.rowByTag("fa_3a")?.baseValue as? Bool
        {
            self.fa_3a = fa_3a
        }
        if let fa_4a = self.form.rowByTag("fa_4a")?.baseValue as? Bool
        {
            self.fa_4a = fa_4a
        }
        if let fa_5a = self.form.rowByTag("fa_5a")?.baseValue as? Bool
        {
            self.fa_5a = fa_5a
        }
        if let fa_6a = self.form.rowByTag("fa_6a")?.baseValue as? String
        {
            self.fa_6a = fa_6a
        }
        if let fa_6b = self.form.rowByTag("fa_6b")?.baseValue as? String
        {
            self.fa_6b = fa_6b
        }
        if let fa_6c = self.form.rowByTag("fa_6c")?.baseValue as? String
        {
            self.fa_6c = fa_6c
        }
        if let fa_6d = self.form.rowByTag("fa_6d")?.baseValue as? String
        {
            self.fa_6d = fa_6d
        }
        if let fa_7a = self.form.rowByTag("fa_7a")?.baseValue as? String
        {
            self.fa_7a = fa_7a
        }
        if let fa_7b = self.form.rowByTag("fa_7b")?.baseValue as? String
        {
            self.fa_7b = fa_7b
        }
        if let fa_7c = self.form.rowByTag("fa_7c")?.baseValue as? Bool
        {
            self.fa_7c = fa_7c
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        self.SaveQuestion("Royco Chicken 1kg", questionID: "fa_1a", textAnswer: "", tickAnswer: self.fa_1a, id: csession)
        self.SaveQuestion("Royco Chicken 1kg", questionID: "fa_1b", textAnswer: "", tickAnswer: self.fa_1b, id: csession)
        self.SaveQuestion("Royco Chicken 1kg", questionID: "fa_2a", textAnswer: "", tickAnswer: self.fa_2a, id: csession)
        self.SaveQuestion("Royco Chicken 1kg", questionID: "fa_2b", textAnswer: "", tickAnswer: self.fa_2b, id: csession)
        self.SaveQuestion("Royco Chicken 1kg", questionID: "fa_3a", textAnswer: "", tickAnswer: self.fa_3a, id: csession)
        self.SaveQuestion("Royco Chicken 1kg", questionID: "fa_4a", textAnswer: "", tickAnswer: self.fa_4a, id: csession)
        self.SaveQuestion("Royco Chicken 1kg", questionID: "fa_5a", textAnswer: "", tickAnswer: self.fa_5a, id: csession)
        self.SaveQuestion("Royco Chicken 1kg", questionID: "fa_6a", textAnswer: self.fa_6a, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Chicken 1kg", questionID: "fa_6b", textAnswer: self.fa_6b, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Chicken 1kg", questionID: "fa_6c", textAnswer: self.fa_6c, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Chicken 1kg", questionID: "fa_6d", textAnswer: self.fa_6d, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Chicken 1kg", questionID: "fa_7a", textAnswer: self.fa_7a, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Chicken 1kg", questionID: "fa_7b", textAnswer: self.fa_7b, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Chicken 1kg", questionID: "fa_7c", textAnswer: "", tickAnswer: self.fa_7c, id: csession)
        
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1a, forKey: "5fa_1a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1b, forKey: "5fa_1b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2a, forKey: "5fa_2a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2b, forKey: "5fa_2b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_3a, forKey: "5fa_3a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_4a, forKey: "5fa_4a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_5a, forKey: "5fa_5a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6a, forKey: "5fa_6a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6b, forKey: "5fa_6b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6c, forKey: "5fa_6c")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6d, forKey: "5fa_6d")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7a, forKey: "5fa_7a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7b, forKey: "5fa_7b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7c, forKey: "5fa_7c")
        NSUserDefaults.standardUserDefaults().setObject(true, forKey: "5fa_done")
        
    }
    
    func SaveQuestion (columnID: String, questionID: String, textAnswer: String, tickAnswer:Bool, id: String) {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        
        // cek duplikasi dulu
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        fetchRequest.predicate = NSPredicate(format: "columnID = %@ AND questionID = %@ AND id = %@", columnID, questionID, id)
        do {
            
            //hapus duplikat
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count > 0{
                let duplicate = result[0] as! NSManagedObject
                managedObjectContext.deleteObject(duplicate)
                try managedObjectContext.save()
            }
            
            //setelah duplikat dihapus, baru tulis baru
            let entity = NSEntityDescription.entityForName("CoachingQuestionAnswer", inManagedObjectContext: managedObjectContext)
            let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
            
            managedObject.setValue(columnID, forKey: "columnID")
            managedObject.setValue(questionID, forKey: "questionID")
            managedObject.setValue(textAnswer, forKey: "textAnswer")
            managedObject.setValue(tickAnswer, forKey: "tickAnswer")
            managedObject.setValue(id, forKey: "id")
            
            try managedObjectContext.save()
        }
            
        catch let error as NSError {
            print(error)
        }
    }
}

class FASAQ6 : FormViewController {
    
    var fa_1a : Bool = false
    var fa_1b : Bool = false
    var fa_2a : Bool = false
    var fa_2b : Bool = false
    var fa_3a : Bool = false
    var fa_4a : Bool = false
    var fa_5a : Bool = false
    var fa_6a : String = ""
    var fa_6b : String = ""
    var fa_6c : String = ""
    var fa_6d : String = ""
    var fa_7a : String = ""
    var fa_7b : String = ""
    var fa_7c : Bool = false
    var savedform : FASAObject = FASAObject()
    //var savedform : Form = Form()
    var language : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bahasa = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.language) {
            language = bahasa as String!
            print("bahasa:",bahasa)
        }
        
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("6fa_1a") as? Bool
        {
            self.fa_1a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("6fa_1b") as? Bool
        {
            self.fa_1b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("6fa_2a") as? Bool
        {
            self.fa_2a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("6fa_2b") as? Bool
        {
            self.fa_2b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("6fa_3a") as? Bool
        {
            self.fa_3a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("6fa_4a") as? Bool
        {
            self.fa_4a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("6fa_5a") as? Bool
        {
            self.fa_5a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("6fa_6a") as? String
        {
            self.fa_6a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("6fa_6b") as? String
        {
            self.fa_6b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("6fa_6c") as? String
        {
            self.fa_6c = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("6fa_6d") as? String
        {
            self.fa_6d = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("6fa_7a") as? String
        {
            self.fa_7a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("6fa_7b") as? String
        {
            self.fa_7b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("6fa_7c") as? Bool
        {
            self.fa_7c = temp
        }
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(11)
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
        
        if language == "Optional(\"Bahasa\")" {
            
            form
                +++ Section("Knorr Mashed Potato 4kg")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Apakah produk tersedia di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t:\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        if language == "Optional(\"English\")" {
            
            form
                +++ Section("Knorr Mashed Potato 4kg")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                }
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Does all product available on Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Does all Front Pack face forward?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. What POS material is available from marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. If there are POS material from Trade Marketing, is it implemented?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Has the FA/SA/Merchandiser explained about product according to Selling Story to the customer? (if there is no customer, ask the advantage of the product)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. How much is the product price at the Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. What is the product size? (gram or ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. How many tier is used to display UFS product at Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t:\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. How many tier is used by similar competitor to display their product at Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Is the SOS (tier count) for UFS product more than competitor product?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        
    }
    override func viewWillDisappear(animated: Bool){
        print("back dipencet")
        
        if let fa_1a = self.form.rowByTag("fa_1a")?.baseValue as? Bool
        {
            self.fa_1a = fa_1a
        }
        if let fa_1b = self.form.rowByTag("fa_1b")?.baseValue as? Bool
        {
            self.fa_1b = fa_1b
        }
        if let fa_2a = self.form.rowByTag("fa_2a")?.baseValue as? Bool
        {
            self.fa_2a = fa_2a
        }
        if let fa_2b = self.form.rowByTag("fa_2b")?.baseValue as? Bool
        {
            self.fa_2b = fa_2b
        }
        if let fa_3a = self.form.rowByTag("fa_3a")?.baseValue as? Bool
        {
            self.fa_3a = fa_3a
        }
        if let fa_4a = self.form.rowByTag("fa_4a")?.baseValue as? Bool
        {
            self.fa_4a = fa_4a
        }
        if let fa_5a = self.form.rowByTag("fa_5a")?.baseValue as? Bool
        {
            self.fa_5a = fa_5a
        }
        if let fa_6a = self.form.rowByTag("fa_6a")?.baseValue as? String
        {
            self.fa_6a = fa_6a
        }
        if let fa_6b = self.form.rowByTag("fa_6b")?.baseValue as? String
        {
            self.fa_6b = fa_6b
        }
        if let fa_6c = self.form.rowByTag("fa_6c")?.baseValue as? String
        {
            self.fa_6c = fa_6c
        }
        if let fa_6d = self.form.rowByTag("fa_6d")?.baseValue as? String
        {
            self.fa_6d = fa_6d
        }
        if let fa_7a = self.form.rowByTag("fa_7a")?.baseValue as? String
        {
            self.fa_7a = fa_7a
        }
        if let fa_7b = self.form.rowByTag("fa_7b")?.baseValue as? String
        {
            self.fa_7b = fa_7b
        }
        if let fa_7c = self.form.rowByTag("fa_7c")?.baseValue as? Bool
        {
            self.fa_7c = fa_7c
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        self.SaveQuestion("Knorr Mashed Potato 4kg", questionID: "fa_1a", textAnswer: "", tickAnswer: self.fa_1a, id: csession)
        self.SaveQuestion("Knorr Mashed Potato 4kg", questionID: "fa_1b", textAnswer: "", tickAnswer: self.fa_1b, id: csession)
        self.SaveQuestion("Knorr Mashed Potato 4kg", questionID: "fa_2a", textAnswer: "", tickAnswer: self.fa_2a, id: csession)
        self.SaveQuestion("Knorr Mashed Potato 4kg", questionID: "fa_2b", textAnswer: "", tickAnswer: self.fa_2b, id: csession)
        self.SaveQuestion("Knorr Mashed Potato 4kg", questionID: "fa_3a", textAnswer: "", tickAnswer: self.fa_3a, id: csession)
        self.SaveQuestion("Knorr Mashed Potato 4kg", questionID: "fa_4a", textAnswer: "", tickAnswer: self.fa_4a, id: csession)
        self.SaveQuestion("Knorr Mashed Potato 4kg", questionID: "fa_5a", textAnswer: "", tickAnswer: self.fa_5a, id: csession)
        self.SaveQuestion("Knorr Mashed Potato 4kg", questionID: "fa_6a", textAnswer: self.fa_6a, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Mashed Potato 4kg", questionID: "fa_6b", textAnswer: self.fa_6b, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Mashed Potato 4kg", questionID: "fa_6c", textAnswer: self.fa_6c, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Mashed Potato 4kg", questionID: "fa_6d", textAnswer: self.fa_6d, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Mashed Potato 4kg", questionID: "fa_7a", textAnswer: self.fa_7a, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Mashed Potato 4kg", questionID: "fa_7b", textAnswer: self.fa_7b, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Mashed Potato 4kg", questionID: "fa_7c", textAnswer: "", tickAnswer: self.fa_7c, id: csession)
        
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1a, forKey: "6fa_1a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1b, forKey: "6fa_1b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2a, forKey: "6fa_2a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2b, forKey: "6fa_2b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_3a, forKey: "6fa_3a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_4a, forKey: "6fa_4a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_5a, forKey: "6fa_5a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6a, forKey: "6fa_6a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6b, forKey: "6fa_6b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6c, forKey: "6fa_6c")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6d, forKey: "6fa_6d")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7a, forKey: "6fa_7a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7b, forKey: "6fa_7b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7c, forKey: "6fa_7c")
        NSUserDefaults.standardUserDefaults().setObject(true, forKey: "6fa_done")
        
    }
    
    func SaveQuestion (columnID: String, questionID: String, textAnswer: String, tickAnswer:Bool, id: String) {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        
        // cek duplikasi dulu
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        fetchRequest.predicate = NSPredicate(format: "columnID = %@ AND questionID = %@ AND id = %@", columnID, questionID, id)
        do {
            
            //hapus duplikat
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count > 0{
                let duplicate = result[0] as! NSManagedObject
                managedObjectContext.deleteObject(duplicate)
                try managedObjectContext.save()
            }
            
            //setelah duplikat dihapus, baru tulis baru
            let entity = NSEntityDescription.entityForName("CoachingQuestionAnswer", inManagedObjectContext: managedObjectContext)
            let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
            
            managedObject.setValue(columnID, forKey: "columnID")
            managedObject.setValue(questionID, forKey: "questionID")
            managedObject.setValue(textAnswer, forKey: "textAnswer")
            managedObject.setValue(tickAnswer, forKey: "tickAnswer")
            managedObject.setValue(id, forKey: "id")
            
            try managedObjectContext.save()
        }
            
        catch let error as NSError {
            print(error)
        }
    }
}

class FASAQ7 : FormViewController {
    
    var fa_1a : Bool = false
    var fa_1b : Bool = false
    var fa_2a : Bool = false
    var fa_2b : Bool = false
    var fa_3a : Bool = false
    var fa_4a : Bool = false
    var fa_5a : Bool = false
    var fa_6a : String = ""
    var fa_6b : String = ""
    var fa_6c : String = ""
    var fa_6d : String = ""
    var fa_7a : String = ""
    var fa_7b : String = ""
    var fa_7c : Bool = false
    var savedform : FASAObject = FASAObject()
    //var savedform : Form = Form()
    var language : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bahasa = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.language) {
            language = bahasa as String!
            print("bahasa:",bahasa)
        }
        
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("7fa_1a") as? Bool
        {
            self.fa_1a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("7fa_1b") as? Bool
        {
            self.fa_1b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("7fa_2a") as? Bool
        {
            self.fa_2a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("7fa_2b") as? Bool
        {
            self.fa_2b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("7fa_3a") as? Bool
        {
            self.fa_3a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("7fa_4a") as? Bool
        {
            self.fa_4a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("7fa_5a") as? Bool
        {
            self.fa_5a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("7fa_6a") as? String
        {
            self.fa_6a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("7fa_6b") as? String
        {
            self.fa_6b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("7fa_6c") as? String
        {
            self.fa_6c = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("7fa_6d") as? String
        {
            self.fa_6d = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("7fa_7a") as? String
        {
            self.fa_7a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("7fa_7b") as? String
        {
            self.fa_7b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("7fa_7c") as? Bool
        {
            self.fa_7c = temp
        }
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(11)
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
        
        if language == "Optional(\"Bahasa\")" {
            
            form
                +++ Section("Knorr Oyster Sauce Bottle 975g")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Apakah produk tersedia di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Saori Saus Tiram 1 liter"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t:\t Saori Saus Tiram 1 liter"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        if language == "Optional(\"English\")" {
            
            form
                +++ Section("Knorr Oyster Sauce Bottle 975g")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                }
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Does all product available on Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Does all Front Pack face forward?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. What POS material is available from marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. If there are POS material from Trade Marketing, is it implemented?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Has the FA/SA/Merchandiser explained about product according to Selling Story to the customer? (if there is no customer, ask the advantage of the product)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. How much is the product price at the Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. What is the product size? (gram or ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t\t Saori Saus Tiram 1 liter"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. How many tier is used to display UFS product at Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t:\t Saori Saus Tiram 1 liter"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. How many tier is used by similar competitor to display their product at Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Is the SOS (tier count) for UFS product more than competitor product?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        
    }
    override func viewWillDisappear(animated: Bool){
        print("back dipencet")
        
        if let fa_1a = self.form.rowByTag("fa_1a")?.baseValue as? Bool
        {
            self.fa_1a = fa_1a
        }
        if let fa_1b = self.form.rowByTag("fa_1b")?.baseValue as? Bool
        {
            self.fa_1b = fa_1b
        }
        if let fa_2a = self.form.rowByTag("fa_2a")?.baseValue as? Bool
        {
            self.fa_2a = fa_2a
        }
        if let fa_2b = self.form.rowByTag("fa_2b")?.baseValue as? Bool
        {
            self.fa_2b = fa_2b
        }
        if let fa_3a = self.form.rowByTag("fa_3a")?.baseValue as? Bool
        {
            self.fa_3a = fa_3a
        }
        if let fa_4a = self.form.rowByTag("fa_4a")?.baseValue as? Bool
        {
            self.fa_4a = fa_4a
        }
        if let fa_5a = self.form.rowByTag("fa_5a")?.baseValue as? Bool
        {
            self.fa_5a = fa_5a
        }
        if let fa_6a = self.form.rowByTag("fa_6a")?.baseValue as? String
        {
            self.fa_6a = fa_6a
        }
        if let fa_6b = self.form.rowByTag("fa_6b")?.baseValue as? String
        {
            self.fa_6b = fa_6b
        }
        if let fa_6c = self.form.rowByTag("fa_6c")?.baseValue as? String
        {
            self.fa_6c = fa_6c
        }
        if let fa_6d = self.form.rowByTag("fa_6d")?.baseValue as? String
        {
            self.fa_6d = fa_6d
        }
        if let fa_7a = self.form.rowByTag("fa_7a")?.baseValue as? String
        {
            self.fa_7a = fa_7a
        }
        if let fa_7b = self.form.rowByTag("fa_7b")?.baseValue as? String
        {
            self.fa_7b = fa_7b
        }
        if let fa_7c = self.form.rowByTag("fa_7c")?.baseValue as? Bool
        {
            self.fa_7c = fa_7c
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        self.SaveQuestion("Knorr Oyster Sauce Bottle 975g", questionID: "fa_1a", textAnswer: "", tickAnswer: self.fa_1a, id: csession)
        self.SaveQuestion("Knorr Oyster Sauce Bottle 975g", questionID: "fa_1b", textAnswer: "", tickAnswer: self.fa_1b, id: csession)
        self.SaveQuestion("Knorr Oyster Sauce Bottle 975g", questionID: "fa_2a", textAnswer: "", tickAnswer: self.fa_2a, id: csession)
        self.SaveQuestion("Knorr Oyster Sauce Bottle 975g", questionID: "fa_2b", textAnswer: "", tickAnswer: self.fa_2b, id: csession)
        self.SaveQuestion("Knorr Oyster Sauce Bottle 975g", questionID: "fa_3a", textAnswer: "", tickAnswer: self.fa_3a, id: csession)
        self.SaveQuestion("Knorr Oyster Sauce Bottle 975g", questionID: "fa_4a", textAnswer: "", tickAnswer: self.fa_4a, id: csession)
        self.SaveQuestion("Knorr Oyster Sauce Bottle 975g", questionID: "fa_5a", textAnswer: "", tickAnswer: self.fa_5a, id: csession)
        self.SaveQuestion("Knorr Oyster Sauce Bottle 975g", questionID: "fa_6a", textAnswer: self.fa_6a, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Oyster Sauce Bottle 975g", questionID: "fa_6b", textAnswer: self.fa_6b, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Oyster Sauce Bottle 975g", questionID: "fa_6c", textAnswer: self.fa_6c, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Oyster Sauce Bottle 975g", questionID: "fa_6d", textAnswer: self.fa_6d, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Oyster Sauce Bottle 975g", questionID: "fa_7a", textAnswer: self.fa_7a, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Oyster Sauce Bottle 975g", questionID: "fa_7b", textAnswer: self.fa_7b, tickAnswer: false, id: csession)
        self.SaveQuestion("Knorr Oyster Sauce Bottle 975g", questionID: "fa_7c", textAnswer: "", tickAnswer: self.fa_7c, id: csession)
        
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1a, forKey: "7fa_1a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1b, forKey: "7fa_1b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2a, forKey: "7fa_2a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2b, forKey: "7fa_2b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_3a, forKey: "7fa_3a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_4a, forKey: "7fa_4a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_5a, forKey: "7fa_5a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6a, forKey: "7fa_6a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6b, forKey: "7fa_6b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6c, forKey: "7fa_6c")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6d, forKey: "7fa_6d")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7a, forKey: "7fa_7a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7b, forKey: "7fa_7b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7c, forKey: "7fa_7c")
        NSUserDefaults.standardUserDefaults().setObject(true, forKey: "7fa_done")
        
    }
    
    func SaveQuestion (columnID: String, questionID: String, textAnswer: String, tickAnswer:Bool, id: String) {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        
        // cek duplikasi dulu
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        fetchRequest.predicate = NSPredicate(format: "columnID = %@ AND questionID = %@ AND id = %@", columnID, questionID, id)
        do {
            
            //hapus duplikat
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count > 0{
                let duplicate = result[0] as! NSManagedObject
                managedObjectContext.deleteObject(duplicate)
                try managedObjectContext.save()
            }
            
            //setelah duplikat dihapus, baru tulis baru
            let entity = NSEntityDescription.entityForName("CoachingQuestionAnswer", inManagedObjectContext: managedObjectContext)
            let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
            
            managedObject.setValue(columnID, forKey: "columnID")
            managedObject.setValue(questionID, forKey: "questionID")
            managedObject.setValue(textAnswer, forKey: "textAnswer")
            managedObject.setValue(tickAnswer, forKey: "tickAnswer")
            managedObject.setValue(id, forKey: "id")
            
            try managedObjectContext.save()
        }
            
        catch let error as NSError {
            print(error)
        }
    }
}

class FASAQ8 : FormViewController {
    
    var fa_1a : Bool = false
    var fa_1b : Bool = false
    var fa_2a : Bool = false
    var fa_2b : Bool = false
    var fa_3a : Bool = false
    var fa_4a : Bool = false
    var fa_5a : Bool = false
    var fa_6a : String = ""
    var fa_6b : String = ""
    var fa_6c : String = ""
    var fa_6d : String = ""
    var fa_7a : String = ""
    var fa_7b : String = ""
    var fa_7c : Bool = false
    var savedform : FASAObject = FASAObject()
    //var savedform : Form = Form()
    var language : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bahasa = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.language) {
            language = bahasa as String!
            print("bahasa:",bahasa)
        }
        
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("8fa_1a") as? Bool
        {
            self.fa_1a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("8fa_1b") as? Bool
        {
            self.fa_1b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("8fa_2a") as? Bool
        {
            self.fa_2a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("8fa_2b") as? Bool
        {
            self.fa_2b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("8fa_3a") as? Bool
        {
            self.fa_3a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("8fa_4a") as? Bool
        {
            self.fa_4a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("8fa_5a") as? Bool
        {
            self.fa_5a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("8fa_6a") as? String
        {
            self.fa_6a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("8fa_6b") as? String
        {
            self.fa_6b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("8fa_6c") as? String
        {
            self.fa_6c = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("8fa_6d") as? String
        {
            self.fa_6d = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("8fa_7a") as? String
        {
            self.fa_7a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("8fa_7b") as? String
        {
            self.fa_7b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("8fa_7c") as? Bool
        {
            self.fa_7c = temp
        }
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(11)
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
        
        if language == "Optional(\"Bahasa\")" {
            
            form
                +++ Section("SariWangi Celup Jumbo")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Apakah produk tersedia di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Teh Botol Sosro TB100"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t:\t Teh Botol Sosro TB100"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        if language == "Optional(\"English\")" {
            
            form
                +++ Section("SariWangi Celup Jumbo")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                }
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Does all product available on Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Does all Front Pack face forward?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. What POS material is available from marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. If there are POS material from Trade Marketing, is it implemented?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Has the FA/SA/Merchandiser explained about product according to Selling Story to the customer? (if there is no customer, ask the advantage of the product)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. How much is the product price at the Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. What is the product size? (gram or ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t\t Teh Botol Sosro TB100"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. How many tier is used to display UFS product at Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t:\t Teh Botol Sosro TB100"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. How many tier is used by similar competitor to display their product at Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Is the SOS (tier count) for UFS product more than competitor product?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        
    }
    override func viewWillDisappear(animated: Bool){
        print("back dipencet")
        
        if let fa_1a = self.form.rowByTag("fa_1a")?.baseValue as? Bool
        {
            self.fa_1a = fa_1a
        }
        if let fa_1b = self.form.rowByTag("fa_1b")?.baseValue as? Bool
        {
            self.fa_1b = fa_1b
        }
        if let fa_2a = self.form.rowByTag("fa_2a")?.baseValue as? Bool
        {
            self.fa_2a = fa_2a
        }
        if let fa_2b = self.form.rowByTag("fa_2b")?.baseValue as? Bool
        {
            self.fa_2b = fa_2b
        }
        if let fa_3a = self.form.rowByTag("fa_3a")?.baseValue as? Bool
        {
            self.fa_3a = fa_3a
        }
        if let fa_4a = self.form.rowByTag("fa_4a")?.baseValue as? Bool
        {
            self.fa_4a = fa_4a
        }
        if let fa_5a = self.form.rowByTag("fa_5a")?.baseValue as? Bool
        {
            self.fa_5a = fa_5a
        }
        if let fa_6a = self.form.rowByTag("fa_6a")?.baseValue as? String
        {
            self.fa_6a = fa_6a
        }
        if let fa_6b = self.form.rowByTag("fa_6b")?.baseValue as? String
        {
            self.fa_6b = fa_6b
        }
        if let fa_6c = self.form.rowByTag("fa_6c")?.baseValue as? String
        {
            self.fa_6c = fa_6c
        }
        if let fa_6d = self.form.rowByTag("fa_6d")?.baseValue as? String
        {
            self.fa_6d = fa_6d
        }
        if let fa_7a = self.form.rowByTag("fa_7a")?.baseValue as? String
        {
            self.fa_7a = fa_7a
        }
        if let fa_7b = self.form.rowByTag("fa_7b")?.baseValue as? String
        {
            self.fa_7b = fa_7b
        }
        if let fa_7c = self.form.rowByTag("fa_7c")?.baseValue as? Bool
        {
            self.fa_7c = fa_7c
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        self.SaveQuestion("SariWangi Celup Jumbo", questionID: "fa_1a", textAnswer: "", tickAnswer: self.fa_1a, id: csession)
        self.SaveQuestion("SariWangi Celup Jumbo", questionID: "fa_1b", textAnswer: "", tickAnswer: self.fa_1b, id: csession)
        self.SaveQuestion("SariWangi Celup Jumbo", questionID: "fa_2a", textAnswer: "", tickAnswer: self.fa_2a, id: csession)
        self.SaveQuestion("SariWangi Celup Jumbo", questionID: "fa_2b", textAnswer: "", tickAnswer: self.fa_2b, id: csession)
        self.SaveQuestion("SariWangi Celup Jumbo", questionID: "fa_3a", textAnswer: "", tickAnswer: self.fa_3a, id: csession)
        self.SaveQuestion("SariWangi Celup Jumbo", questionID: "fa_4a", textAnswer: "", tickAnswer: self.fa_4a, id: csession)
        self.SaveQuestion("SariWangi Celup Jumbo", questionID: "fa_5a", textAnswer: "", tickAnswer: self.fa_5a, id: csession)
        self.SaveQuestion("SariWangi Celup Jumbo", questionID: "fa_6a", textAnswer: self.fa_6a, tickAnswer: false, id: csession)
        self.SaveQuestion("SariWangi Celup Jumbo", questionID: "fa_6b", textAnswer: self.fa_6b, tickAnswer: false, id: csession)
        self.SaveQuestion("SariWangi Celup Jumbo", questionID: "fa_6c", textAnswer: self.fa_6c, tickAnswer: false, id: csession)
        self.SaveQuestion("SariWangi Celup Jumbo", questionID: "fa_6d", textAnswer: self.fa_6d, tickAnswer: false, id: csession)
        self.SaveQuestion("SariWangi Celup Jumbo", questionID: "fa_7a", textAnswer: self.fa_7a, tickAnswer: false, id: csession)
        self.SaveQuestion("SariWangi Celup Jumbo", questionID: "fa_7b", textAnswer: self.fa_7b, tickAnswer: false, id: csession)
        self.SaveQuestion("SariWangi Celup Jumbo", questionID: "fa_7c", textAnswer: "", tickAnswer: self.fa_7c, id: csession)
        
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1a, forKey: "8fa_1a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1b, forKey: "8fa_1b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2a, forKey: "8fa_2a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2b, forKey: "8fa_2b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_3a, forKey: "8fa_3a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_4a, forKey: "8fa_4a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_5a, forKey: "8fa_5a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6a, forKey: "8fa_6a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6b, forKey: "8fa_6b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6c, forKey: "8fa_6c")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6d, forKey: "8fa_6d")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7a, forKey: "8fa_7a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7b, forKey: "8fa_7b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7c, forKey: "8fa_7c")
        NSUserDefaults.standardUserDefaults().setObject(true, forKey: "8fa_done")
        
    }
    
    func SaveQuestion (columnID: String, questionID: String, textAnswer: String, tickAnswer:Bool, id: String) {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        
        // cek duplikasi dulu
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        fetchRequest.predicate = NSPredicate(format: "columnID = %@ AND questionID = %@ AND id = %@", columnID, questionID, id)
        do {
            
            //hapus duplikat
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count > 0{
                let duplicate = result[0] as! NSManagedObject
                managedObjectContext.deleteObject(duplicate)
                try managedObjectContext.save()
            }
            
            //setelah duplikat dihapus, baru tulis baru
            let entity = NSEntityDescription.entityForName("CoachingQuestionAnswer", inManagedObjectContext: managedObjectContext)
            let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
            
            managedObject.setValue(columnID, forKey: "columnID")
            managedObject.setValue(questionID, forKey: "questionID")
            managedObject.setValue(textAnswer, forKey: "textAnswer")
            managedObject.setValue(tickAnswer, forKey: "tickAnswer")
            managedObject.setValue(id, forKey: "id")
            
            try managedObjectContext.save()
        }
            
        catch let error as NSError {
            print(error)
        }
    }
}

class FASAQ9 : FormViewController {
    
    var fa_1a : Bool = false
    var fa_1b : Bool = false
    var fa_2a : Bool = false
    var fa_2b : Bool = false
    var fa_3a : Bool = false
    var fa_4a : Bool = false
    var fa_5a : Bool = false
    var fa_6a : String = ""
    var fa_6b : String = ""
    var fa_6c : String = ""
    var fa_6d : String = ""
    var fa_7a : String = ""
    var fa_7b : String = ""
    var fa_7c : Bool = false
    var savedform : FASAObject = FASAObject()
    //var savedform : Form = Form()
    var language : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bahasa = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.language) {
            language = bahasa as String!
            print("bahasa:",bahasa)
        }
        
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("9fa_1a") as? Bool
        {
            self.fa_1a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("9fa_1b") as? Bool
        {
            self.fa_1b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("9fa_2a") as? Bool
        {
            self.fa_2a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("9fa_2b") as? Bool
        {
            self.fa_2b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("9fa_3a") as? Bool
        {
            self.fa_3a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("9fa_4a") as? Bool
        {
            self.fa_4a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("9fa_5a") as? Bool
        {
            self.fa_5a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("9fa_6a") as? String
        {
            self.fa_6a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("9fa_6b") as? String
        {
            self.fa_6b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("9fa_6c") as? String
        {
            self.fa_6c = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("9fa_6d") as? String
        {
            self.fa_6d = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("9fa_7a") as? String
        {
            self.fa_7a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("9fa_7b") as? String
        {
            self.fa_7b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("9fa_7c") as? Bool
        {
            self.fa_7c = temp
        }
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(11)
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
        
        if language == "Optional(\"Bahasa\")" {
            
            form
                +++ Section("Royco Ayam Kuning 600g")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Apakah produk tersedia di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t:\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        if language == "Optional(\"English\")" {
            
            form
                +++ Section("Royco Ayam Kuning 600g")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                }
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Does all product available on Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Does all Front Pack face forward?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. What POS material is available from marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. If there are POS material from Trade Marketing, is it implemented?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Has the FA/SA/Merchandiser explained about product according to Selling Story to the customer? (if there is no customer, ask the advantage of the product)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. How much is the product price at the Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. What is the product size? (gram or ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. How many tier is used to display UFS product at Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t:\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. How many tier is used by similar competitor to display their product at Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Is the SOS (tier count) for UFS product more than competitor product?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        
    }
    override func viewWillDisappear(animated: Bool){
        print("back dipencet")
        
        if let fa_1a = self.form.rowByTag("fa_1a")?.baseValue as? Bool
        {
            self.fa_1a = fa_1a
        }
        if let fa_1b = self.form.rowByTag("fa_1b")?.baseValue as? Bool
        {
            self.fa_1b = fa_1b
        }
        if let fa_2a = self.form.rowByTag("fa_2a")?.baseValue as? Bool
        {
            self.fa_2a = fa_2a
        }
        if let fa_2b = self.form.rowByTag("fa_2b")?.baseValue as? Bool
        {
            self.fa_2b = fa_2b
        }
        if let fa_3a = self.form.rowByTag("fa_3a")?.baseValue as? Bool
        {
            self.fa_3a = fa_3a
        }
        if let fa_4a = self.form.rowByTag("fa_4a")?.baseValue as? Bool
        {
            self.fa_4a = fa_4a
        }
        if let fa_5a = self.form.rowByTag("fa_5a")?.baseValue as? Bool
        {
            self.fa_5a = fa_5a
        }
        if let fa_6a = self.form.rowByTag("fa_6a")?.baseValue as? String
        {
            self.fa_6a = fa_6a
        }
        if let fa_6b = self.form.rowByTag("fa_6b")?.baseValue as? String
        {
            self.fa_6b = fa_6b
        }
        if let fa_6c = self.form.rowByTag("fa_6c")?.baseValue as? String
        {
            self.fa_6c = fa_6c
        }
        if let fa_6d = self.form.rowByTag("fa_6d")?.baseValue as? String
        {
            self.fa_6d = fa_6d
        }
        if let fa_7a = self.form.rowByTag("fa_7a")?.baseValue as? String
        {
            self.fa_7a = fa_7a
        }
        if let fa_7b = self.form.rowByTag("fa_7b")?.baseValue as? String
        {
            self.fa_7b = fa_7b
        }
        if let fa_7c = self.form.rowByTag("fa_7c")?.baseValue as? Bool
        {
            self.fa_7c = fa_7c
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        self.SaveQuestion("Royco Ayam Kuning 600g", questionID: "fa_1a", textAnswer: "", tickAnswer: self.fa_1a, id: csession)
        self.SaveQuestion("Royco Ayam Kuning 600g", questionID: "fa_1b", textAnswer: "", tickAnswer: self.fa_1b, id: csession)
        self.SaveQuestion("Royco Ayam Kuning 600g", questionID: "fa_2a", textAnswer: "", tickAnswer: self.fa_2a, id: csession)
        self.SaveQuestion("Royco Ayam Kuning 600g", questionID: "fa_2b", textAnswer: "", tickAnswer: self.fa_2b, id: csession)
        self.SaveQuestion("Royco Ayam Kuning 600g", questionID: "fa_3a", textAnswer: "", tickAnswer: self.fa_3a, id: csession)
        self.SaveQuestion("Royco Ayam Kuning 600g", questionID: "fa_4a", textAnswer: "", tickAnswer: self.fa_4a, id: csession)
        self.SaveQuestion("Royco Ayam Kuning 600g", questionID: "fa_5a", textAnswer: "", tickAnswer: self.fa_5a, id: csession)
        self.SaveQuestion("Royco Ayam Kuning 600g", questionID: "fa_6a", textAnswer: self.fa_6a, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Ayam Kuning 600g", questionID: "fa_6b", textAnswer: self.fa_6b, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Ayam Kuning 600g", questionID: "fa_6c", textAnswer: self.fa_6c, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Ayam Kuning 600g", questionID: "fa_6d", textAnswer: self.fa_6d, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Ayam Kuning 600g", questionID: "fa_7a", textAnswer: self.fa_7a, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Ayam Kuning 600g", questionID: "fa_7b", textAnswer: self.fa_7b, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Ayam Kuning 600g", questionID: "fa_7c", textAnswer: "", tickAnswer: self.fa_7c, id: csession)
        
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1a, forKey: "9fa_1a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1b, forKey: "9fa_1b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2a, forKey: "9fa_2a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2b, forKey: "9fa_2b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_3a, forKey: "9fa_3a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_4a, forKey: "9fa_4a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_5a, forKey: "9fa_5a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6a, forKey: "9fa_6a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6b, forKey: "9fa_6b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6c, forKey: "9fa_6c")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6d, forKey: "9fa_6d")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7a, forKey: "9fa_7a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7b, forKey: "9fa_7b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7c, forKey: "9fa_7c")
        NSUserDefaults.standardUserDefaults().setObject(true, forKey: "9fa_done")
        
    }
    
    func SaveQuestion (columnID: String, questionID: String, textAnswer: String, tickAnswer:Bool, id: String) {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        
        // cek duplikasi dulu
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        fetchRequest.predicate = NSPredicate(format: "columnID = %@ AND questionID = %@ AND id = %@", columnID, questionID, id)
        do {
            
            //hapus duplikat
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count > 0{
                let duplicate = result[0] as! NSManagedObject
                managedObjectContext.deleteObject(duplicate)
                try managedObjectContext.save()
            }
            
            //setelah duplikat dihapus, baru tulis baru
            let entity = NSEntityDescription.entityForName("CoachingQuestionAnswer", inManagedObjectContext: managedObjectContext)
            let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
            
            managedObject.setValue(columnID, forKey: "columnID")
            managedObject.setValue(questionID, forKey: "questionID")
            managedObject.setValue(textAnswer, forKey: "textAnswer")
            managedObject.setValue(tickAnswer, forKey: "tickAnswer")
            managedObject.setValue(id, forKey: "id")
            
            try managedObjectContext.save()
        }
            
        catch let error as NSError {
            print(error)
        }
    }
}

class FASAQ10 : FormViewController {
    
    var fa_1a : Bool = false
    var fa_1b : Bool = false
    var fa_2a : Bool = false
    var fa_2b : Bool = false
    var fa_3a : Bool = false
    var fa_4a : Bool = false
    var fa_5a : Bool = false
    var fa_6a : String = ""
    var fa_6b : String = ""
    var fa_6c : String = ""
    var fa_6d : String = ""
    var fa_7a : String = ""
    var fa_7b : String = ""
    var fa_7c : Bool = false
    var savedform : FASAObject = FASAObject()
    //var savedform : Form = Form()
    var language : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bahasa = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.language) {
            language = bahasa as String!
            print("bahasa:",bahasa)
        }
        
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("10fa_1a") as? Bool
        {
            self.fa_1a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("10fa_1b") as? Bool
        {
            self.fa_1b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("10fa_2a") as? Bool
        {
            self.fa_2a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("10fa_2b") as? Bool
        {
            self.fa_2b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("10fa_3a") as? Bool
        {
            self.fa_3a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("10fa_4a") as? Bool
        {
            self.fa_4a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("10fa_5a") as? Bool
        {
            self.fa_5a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("10fa_6a") as? String
        {
            self.fa_6a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("10fa_6b") as? String
        {
            self.fa_6b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("10fa_6c") as? String
        {
            self.fa_6c = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("10fa_6d") as? String
        {
            self.fa_6d = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("10fa_7a") as? String
        {
            self.fa_7a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("10fa_7b") as? String
        {
            self.fa_7b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("10fa_7c") as? Bool
        {
            self.fa_7c = temp
        }
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(11)
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
        
        if language == "Optional(\"Bahasa\")" {
            
            form
                +++ Section("Royco Rendang 525g")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Apakah produk tersedia di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t:\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        if language == "Optional(\"English\")" {
            
            form
                +++ Section("Royco Rendang 525g")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                }
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Does all product available on Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Does all Front Pack face forward?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. What POS material is available from marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. If there are POS material from Trade Marketing, is it implemented?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Has the FA/SA/Merchandiser explained about product according to Selling Story to the customer? (if there is no customer, ask the advantage of the product)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. How much is the product price at the Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. What is the product size? (gram or ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. How many tier is used to display UFS product at Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t:\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. How many tier is used by similar competitor to display their product at Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Is the SOS (tier count) for UFS product more than competitor product?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        
    }
    override func viewWillDisappear(animated: Bool){
        print("back dipencet")
        
        if let fa_1a = self.form.rowByTag("fa_1a")?.baseValue as? Bool
        {
            self.fa_1a = fa_1a
        }
        if let fa_1b = self.form.rowByTag("fa_1b")?.baseValue as? Bool
        {
            self.fa_1b = fa_1b
        }
        if let fa_2a = self.form.rowByTag("fa_2a")?.baseValue as? Bool
        {
            self.fa_2a = fa_2a
        }
        if let fa_2b = self.form.rowByTag("fa_2b")?.baseValue as? Bool
        {
            self.fa_2b = fa_2b
        }
        if let fa_3a = self.form.rowByTag("fa_3a")?.baseValue as? Bool
        {
            self.fa_3a = fa_3a
        }
        if let fa_4a = self.form.rowByTag("fa_4a")?.baseValue as? Bool
        {
            self.fa_4a = fa_4a
        }
        if let fa_5a = self.form.rowByTag("fa_5a")?.baseValue as? Bool
        {
            self.fa_5a = fa_5a
        }
        if let fa_6a = self.form.rowByTag("fa_6a")?.baseValue as? String
        {
            self.fa_6a = fa_6a
        }
        if let fa_6b = self.form.rowByTag("fa_6b")?.baseValue as? String
        {
            self.fa_6b = fa_6b
        }
        if let fa_6c = self.form.rowByTag("fa_6c")?.baseValue as? String
        {
            self.fa_6c = fa_6c
        }
        if let fa_6d = self.form.rowByTag("fa_6d")?.baseValue as? String
        {
            self.fa_6d = fa_6d
        }
        if let fa_7a = self.form.rowByTag("fa_7a")?.baseValue as? String
        {
            self.fa_7a = fa_7a
        }
        if let fa_7b = self.form.rowByTag("fa_7b")?.baseValue as? String
        {
            self.fa_7b = fa_7b
        }
        if let fa_7c = self.form.rowByTag("fa_7c")?.baseValue as? Bool
        {
            self.fa_7c = fa_7c
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        self.SaveQuestion("Royco Rendang 525g", questionID: "fa_1a", textAnswer: "", tickAnswer: self.fa_1a, id: csession)
        self.SaveQuestion("Royco Rendang 525g", questionID: "fa_1b", textAnswer: "", tickAnswer: self.fa_1b, id: csession)
        self.SaveQuestion("Royco Rendang 525g", questionID: "fa_2a", textAnswer: "", tickAnswer: self.fa_2a, id: csession)
        self.SaveQuestion("Royco Rendang 525g", questionID: "fa_2b", textAnswer: "", tickAnswer: self.fa_2b, id: csession)
        self.SaveQuestion("Royco Rendang 525g", questionID: "fa_3a", textAnswer: "", tickAnswer: self.fa_3a, id: csession)
        self.SaveQuestion("Royco Rendang 525g", questionID: "fa_4a", textAnswer: "", tickAnswer: self.fa_4a, id: csession)
        self.SaveQuestion("Royco Rendang 525g", questionID: "fa_5a", textAnswer: "", tickAnswer: self.fa_5a, id: csession)
        self.SaveQuestion("Royco Rendang 525g", questionID: "fa_6a", textAnswer: self.fa_6a, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Rendang 525g", questionID: "fa_6b", textAnswer: self.fa_6b, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Rendang 525g", questionID: "fa_6c", textAnswer: self.fa_6c, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Rendang 525g", questionID: "fa_6d", textAnswer: self.fa_6d, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Rendang 525g", questionID: "fa_7a", textAnswer: self.fa_7a, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Rendang 525g", questionID: "fa_7b", textAnswer: self.fa_7b, tickAnswer: false, id: csession)
        self.SaveQuestion("Royco Rendang 525g", questionID: "fa_7c", textAnswer: "", tickAnswer: self.fa_7c, id: csession)
        
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1a, forKey: "10fa_1a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1b, forKey: "10fa_1b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2a, forKey: "10fa_2a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2b, forKey: "10fa_2b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_3a, forKey: "10fa_3a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_4a, forKey: "10fa_4a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_5a, forKey: "10fa_5a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6a, forKey: "10fa_6a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6b, forKey: "10fa_6b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6c, forKey: "10fa_6c")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6d, forKey: "10fa_6d")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7a, forKey: "10fa_7a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7b, forKey: "10fa_7b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7c, forKey: "10fa_7c")
        NSUserDefaults.standardUserDefaults().setObject(true, forKey: "10fa_done")
        
    }
    
    func SaveQuestion (columnID: String, questionID: String, textAnswer: String, tickAnswer:Bool, id: String) {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        
        // cek duplikasi dulu
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        fetchRequest.predicate = NSPredicate(format: "columnID = %@ AND questionID = %@ AND id = %@", columnID, questionID, id)
        do {
            
            //hapus duplikat
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count > 0{
                let duplicate = result[0] as! NSManagedObject
                managedObjectContext.deleteObject(duplicate)
                try managedObjectContext.save()
            }
            
            //setelah duplikat dihapus, baru tulis baru
            let entity = NSEntityDescription.entityForName("CoachingQuestionAnswer", inManagedObjectContext: managedObjectContext)
            let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
            
            managedObject.setValue(columnID, forKey: "columnID")
            managedObject.setValue(questionID, forKey: "questionID")
            managedObject.setValue(textAnswer, forKey: "textAnswer")
            managedObject.setValue(tickAnswer, forKey: "tickAnswer")
            managedObject.setValue(id, forKey: "id")
            
            try managedObjectContext.save()
        }
            
        catch let error as NSError {
            print(error)
        }
    }
}

class FASAQ11 : FormViewController {
    
    var fa_1a : Bool = false
    var fa_1b : Bool = false
    var fa_2a : Bool = false
    var fa_2b : Bool = false
    var fa_3a : Bool = false
    var fa_4a : Bool = false
    var fa_5a : Bool = false
    var fa_6a : String = ""
    var fa_6b : String = ""
    var fa_6c : String = ""
    var fa_6d : String = ""
    var fa_7a : String = ""
    var fa_7b : String = ""
    var fa_7c : Bool = false
    var savedform : FASAObject = FASAObject()
    //var savedform : Form = Form()
    var language : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bahasa = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.language) {
            language = bahasa as String!
            print("bahasa:",bahasa)
        }
        
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("11fa_1a") as? Bool
        {
            self.fa_1a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("11fa_1b") as? Bool
        {
            self.fa_1b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("11fa_2a") as? Bool
        {
            self.fa_2a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("11fa_2b") as? Bool
        {
            self.fa_2b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("11fa_3a") as? Bool
        {
            self.fa_3a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("11fa_4a") as? Bool
        {
            self.fa_4a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("11fa_5a") as? Bool
        {
            self.fa_5a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("11fa_6a") as? String
        {
            self.fa_6a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("11fa_6b") as? String
        {
            self.fa_6b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("11fa_6c") as? String
        {
            self.fa_6c = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("11fa_6d") as? String
        {
            self.fa_6d = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("11fa_7a") as? String
        {
            self.fa_7a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("11fa_7b") as? String
        {
            self.fa_7b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("11fa_7c") as? Bool
        {
            self.fa_7c = temp
        }
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(11)
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
        
        if language == "Optional(\"Bahasa\")" {
            
            form
                +++ Section("Additional Product 1")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Apakah produk tersedia di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t:\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        if language == "Optional(\"English\")" {
            
            form
                +++ Section("Additional Product 1")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                }
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Does all product available on Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Does all Front Pack face forward?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. What POS material is available from marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. If there are POS material from Trade Marketing, is it implemented?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Has the FA/SA/Merchandiser explained about product according to Selling Story to the customer? (if there is no customer, ask the advantage of the product)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. How much is the product price at the Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. What is the product size? (gram or ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Komp 1"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. How many tier is used to display UFS product at Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t:\t Komp 1"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. How many tier is used by similar competitor to display their product at Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Is the SOS (tier count) for UFS product more than competitor product?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        
    }
    override func viewWillDisappear(animated: Bool){
        print("back dipencet")
        
        if let fa_1a = self.form.rowByTag("fa_1a")?.baseValue as? Bool
        {
            self.fa_1a = fa_1a
        }
        if let fa_1b = self.form.rowByTag("fa_1b")?.baseValue as? Bool
        {
            self.fa_1b = fa_1b
        }
        if let fa_2a = self.form.rowByTag("fa_2a")?.baseValue as? Bool
        {
            self.fa_2a = fa_2a
        }
        if let fa_2b = self.form.rowByTag("fa_2b")?.baseValue as? Bool
        {
            self.fa_2b = fa_2b
        }
        if let fa_3a = self.form.rowByTag("fa_3a")?.baseValue as? Bool
        {
            self.fa_3a = fa_3a
        }
        if let fa_4a = self.form.rowByTag("fa_4a")?.baseValue as? Bool
        {
            self.fa_4a = fa_4a
        }
        if let fa_5a = self.form.rowByTag("fa_5a")?.baseValue as? Bool
        {
            self.fa_5a = fa_5a
        }
        if let fa_6a = self.form.rowByTag("fa_6a")?.baseValue as? String
        {
            self.fa_6a = fa_6a
        }
        if let fa_6b = self.form.rowByTag("fa_6b")?.baseValue as? String
        {
            self.fa_6b = fa_6b
        }
        if let fa_6c = self.form.rowByTag("fa_6c")?.baseValue as? String
        {
            self.fa_6c = fa_6c
        }
        if let fa_6d = self.form.rowByTag("fa_6d")?.baseValue as? String
        {
            self.fa_6d = fa_6d
        }
        if let fa_7a = self.form.rowByTag("fa_7a")?.baseValue as? String
        {
            self.fa_7a = fa_7a
        }
        if let fa_7b = self.form.rowByTag("fa_7b")?.baseValue as? String
        {
            self.fa_7b = fa_7b
        }
        if let fa_7c = self.form.rowByTag("fa_7c")?.baseValue as? Bool
        {
            self.fa_7c = fa_7c
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        self.SaveQuestion("Additional Product 1", questionID: "fa_1a", textAnswer: "", tickAnswer: self.fa_1a, id: csession)
        self.SaveQuestion("Additional Product 1", questionID: "fa_1b", textAnswer: "", tickAnswer: self.fa_1b, id: csession)
        self.SaveQuestion("Additional Product 1", questionID: "fa_2a", textAnswer: "", tickAnswer: self.fa_2a, id: csession)
        self.SaveQuestion("Additional Product 1", questionID: "fa_2b", textAnswer: "", tickAnswer: self.fa_2b, id: csession)
        self.SaveQuestion("Additional Product 1", questionID: "fa_3a", textAnswer: "", tickAnswer: self.fa_3a, id: csession)
        self.SaveQuestion("Additional Product 1", questionID: "fa_4a", textAnswer: "", tickAnswer: self.fa_4a, id: csession)
        self.SaveQuestion("Additional Product 1", questionID: "fa_5a", textAnswer: "", tickAnswer: self.fa_5a, id: csession)
        self.SaveQuestion("Additional Product 1", questionID: "fa_6a", textAnswer: self.fa_6a, tickAnswer: false, id: csession)
        self.SaveQuestion("Additional Product 1", questionID: "fa_6b", textAnswer: self.fa_6b, tickAnswer: false, id: csession)
        self.SaveQuestion("Additional Product 1", questionID: "fa_6c", textAnswer: self.fa_6c, tickAnswer: false, id: csession)
        self.SaveQuestion("Additional Product 1", questionID: "fa_6d", textAnswer: self.fa_6d, tickAnswer: false, id: csession)
        self.SaveQuestion("Additional Product 1", questionID: "fa_7a", textAnswer: self.fa_7a, tickAnswer: false, id: csession)
        self.SaveQuestion("Additional Product 1", questionID: "fa_7b", textAnswer: self.fa_7b, tickAnswer: false, id: csession)
        self.SaveQuestion("Additional Product 1", questionID: "fa_7c", textAnswer: "", tickAnswer: self.fa_7c, id: csession)
        
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1a, forKey: "11fa_1a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1b, forKey: "11fa_1b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2a, forKey: "11fa_2a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2b, forKey: "11fa_2b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_3a, forKey: "11fa_3a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_4a, forKey: "11fa_4a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_5a, forKey: "11fa_5a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6a, forKey: "11fa_6a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6b, forKey: "11fa_6b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6c, forKey: "11fa_6c")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6d, forKey: "11fa_6d")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7a, forKey: "11fa_7a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7b, forKey: "11fa_7b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7c, forKey: "11fa_7c")
        NSUserDefaults.standardUserDefaults().setObject(true, forKey: "11fa_done")
        
    }
    
    func SaveQuestion (columnID: String, questionID: String, textAnswer: String, tickAnswer:Bool, id: String) {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        
        // cek duplikasi dulu
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        fetchRequest.predicate = NSPredicate(format: "columnID = %@ AND questionID = %@ AND id = %@", columnID, questionID, id)
        do {
            
            //hapus duplikat
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count > 0{
                let duplicate = result[0] as! NSManagedObject
                managedObjectContext.deleteObject(duplicate)
                try managedObjectContext.save()
            }
            
            //setelah duplikat dihapus, baru tulis baru
            let entity = NSEntityDescription.entityForName("CoachingQuestionAnswer", inManagedObjectContext: managedObjectContext)
            let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
            
            managedObject.setValue(columnID, forKey: "columnID")
            managedObject.setValue(questionID, forKey: "questionID")
            managedObject.setValue(textAnswer, forKey: "textAnswer")
            managedObject.setValue(tickAnswer, forKey: "tickAnswer")
            managedObject.setValue(id, forKey: "id")
            
            try managedObjectContext.save()
        }
            
        catch let error as NSError {
            print(error)
        }
    }
}

class FASAQ12 : FormViewController {
    
    var fa_1a : Bool = false
    var fa_1b : Bool = false
    var fa_2a : Bool = false
    var fa_2b : Bool = false
    var fa_3a : Bool = false
    var fa_4a : Bool = false
    var fa_5a : Bool = false
    var fa_6a : String = ""
    var fa_6b : String = ""
    var fa_6c : String = ""
    var fa_6d : String = ""
    var fa_7a : String = ""
    var fa_7b : String = ""
    var fa_7c : Bool = false
    var savedform : FASAObject = FASAObject()
    //var savedform : Form = Form()
    var language : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bahasa = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.language) {
            language = bahasa as String!
            print("bahasa:",bahasa)
        }
        
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("12fa_1a") as? Bool
        {
            self.fa_1a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("12fa_1b") as? Bool
        {
            self.fa_1b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("12fa_2a") as? Bool
        {
            self.fa_2a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("12fa_2b") as? Bool
        {
            self.fa_2b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("12fa_3a") as? Bool
        {
            self.fa_3a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("12fa_4a") as? Bool
        {
            self.fa_4a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("12fa_5a") as? Bool
        {
            self.fa_5a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("12fa_6a") as? String
        {
            self.fa_6a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("12fa_6b") as? String
        {
            self.fa_6b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("12fa_6c") as? String
        {
            self.fa_6c = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("12fa_6d") as? String
        {
            self.fa_6d = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("12fa_7a") as? String
        {
            self.fa_7a = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("12fa_7b") as? String
        {
            self.fa_7b = temp
        }
        if let temp = NSUserDefaults.standardUserDefaults().objectForKey("12fa_7c") as? Bool
        {
            self.fa_7c = temp
        }
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(11)
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
        
        if language == "Optional(\"Bahasa\")" {
            
            form
                +++ Section("Additional Product 2")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Apakah produk tersedia di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t:\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        if language == "Optional(\"English\")" {
            
            form
                +++ Section("Additional Product 2")
                <<< LabelRow(){
                    $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
                }
                
                <<< CheckRow(){
                    if (self.fa_1a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1a"
                    $0.title = "a. Does all product available on Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if self.fa_1b{
                        $0.baseValue = true
                    }
                    $0.tag = "fa_1b"
                    $0.title = "b. Does all Front Pack face forward?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "2. POINT OF SALES (POS)"
                }
                
                <<< CheckRow(){
                    if (self.fa_2a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2a"
                    $0.title = "a. What POS material is available from marketing?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    if (self.fa_2b){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_2b"
                    $0.title = "b. If there are POS material from Trade Marketing, is it implemented?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "3. FA/SA/Merchandiser Performance"
                }
                
                <<< CheckRow(){
                    if (self.fa_3a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_3a"
                    $0.title = "a. Has the FA/SA/Merchandiser explained about product according to Selling Story to the customer? (if there is no customer, ask the advantage of the product)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "4. PRODUCT DISTRIBUTION (PD)"
                }
                
                <<< CheckRow(){
                    if (self.fa_4a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_4a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "5. PROMO COMPLIANCE (PC)"
                }
                
                <<< CheckRow(){
                    if (self.fa_5a){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_5a"
                    $0.title = "a. Is the product Price Tag showed on Shelf (listed)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "6. RELATIVE PRICE INDEX (RPI)"
                }
                
                <<< TextRow(){
                    if (self.fa_6a != ""){
                        $0.baseValue = self.fa_6a
                    }
                    $0.tag = "fa_6a"
                    $0.title = "a. How much is the product price at the Store? (A)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6b != ""){
                        $0.baseValue = self.fa_6b
                    }
                    $0.tag = "fa_6b"
                    $0.title = "b. What is the product size? (gram or ml) (B)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "PRODUK KOMPETITOR \t\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_6c != ""){
                        $0.baseValue = self.fa_6c
                    }
                    $0.tag = "fa_6c"
                    $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    if (self.fa_6d != ""){
                        $0.baseValue = self.fa_6d
                    }
                    $0.tag = "fa_6d"
                    $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "fa_rpi"
                    $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< LabelRow(){
                    $0.title = "7. SHARE OF SPACE (SOS)"
                }
                
                <<< TextRow(){
                    if (self.fa_7a != ""){
                        $0.baseValue = self.fa_7a
                    }
                    $0.tag = "fa_7a"
                    $0.title = "a. How many tier is used to display UFS product at Shelf?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< LabelRow(){
                    $0.title = "PRODUCT COMPETITOR \t:\t Komp A"
                }
                <<< TextRow(){
                    if (self.fa_7b != ""){
                        $0.baseValue = self.fa_7b
                    }
                    $0.tag = "fa_7b"
                    $0.title = "b. How many tier is used by similar competitor to display their product at Shelf"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                
                <<< CheckRow(){
                    if (self.fa_7c){
                        $0.baseValue = true
                    }
                    $0.tag = "fa_7c"
                    $0.title = "c. Is the SOS (tier count) for UFS product more than competitor product?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
        }
        
    }
    override func viewWillDisappear(animated: Bool){
        print("back dipencet")
        
        if let fa_1a = self.form.rowByTag("fa_1a")?.baseValue as? Bool
        {
            self.fa_1a = fa_1a
        }
        if let fa_1b = self.form.rowByTag("fa_1b")?.baseValue as? Bool
        {
            self.fa_1b = fa_1b
        }
        if let fa_2a = self.form.rowByTag("fa_2a")?.baseValue as? Bool
        {
            self.fa_2a = fa_2a
        }
        if let fa_2b = self.form.rowByTag("fa_2b")?.baseValue as? Bool
        {
            self.fa_2b = fa_2b
        }
        if let fa_3a = self.form.rowByTag("fa_3a")?.baseValue as? Bool
        {
            self.fa_3a = fa_3a
        }
        if let fa_4a = self.form.rowByTag("fa_4a")?.baseValue as? Bool
        {
            self.fa_4a = fa_4a
        }
        if let fa_5a = self.form.rowByTag("fa_5a")?.baseValue as? Bool
        {
            self.fa_5a = fa_5a
        }
        if let fa_6a = self.form.rowByTag("fa_6a")?.baseValue as? String
        {
            self.fa_6a = fa_6a
        }
        if let fa_6b = self.form.rowByTag("fa_6b")?.baseValue as? String
        {
            self.fa_6b = fa_6b
        }
        if let fa_6c = self.form.rowByTag("fa_6c")?.baseValue as? String
        {
            self.fa_6c = fa_6c
        }
        if let fa_6d = self.form.rowByTag("fa_6d")?.baseValue as? String
        {
            self.fa_6d = fa_6d
        }
        if let fa_7a = self.form.rowByTag("fa_7a")?.baseValue as? String
        {
            self.fa_7a = fa_7a
        }
        if let fa_7b = self.form.rowByTag("fa_7b")?.baseValue as? String
        {
            self.fa_7b = fa_7b
        }
        if let fa_7c = self.form.rowByTag("fa_7c")?.baseValue as? Bool
        {
            self.fa_7c = fa_7c
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        self.SaveQuestion("Additional Product 2", questionID: "fa_1a", textAnswer: "", tickAnswer: self.fa_1a, id: csession)
        self.SaveQuestion("Additional Product 2", questionID: "fa_1b", textAnswer: "", tickAnswer: self.fa_1b, id: csession)
        self.SaveQuestion("Additional Product 2", questionID: "fa_2a", textAnswer: "", tickAnswer: self.fa_2a, id: csession)
        self.SaveQuestion("Additional Product 2", questionID: "fa_2b", textAnswer: "", tickAnswer: self.fa_2b, id: csession)
        self.SaveQuestion("Additional Product 2", questionID: "fa_3a", textAnswer: "", tickAnswer: self.fa_3a, id: csession)
        self.SaveQuestion("Additional Product 2", questionID: "fa_4a", textAnswer: "", tickAnswer: self.fa_4a, id: csession)
        self.SaveQuestion("Additional Product 2", questionID: "fa_5a", textAnswer: "", tickAnswer: self.fa_5a, id: csession)
        self.SaveQuestion("Additional Product 2", questionID: "fa_6a", textAnswer: self.fa_6a, tickAnswer: false, id: csession)
        self.SaveQuestion("Additional Product 2", questionID: "fa_6b", textAnswer: self.fa_6b, tickAnswer: false, id: csession)
        self.SaveQuestion("Additional Product 2", questionID: "fa_6c", textAnswer: self.fa_6c, tickAnswer: false, id: csession)
        self.SaveQuestion("Additional Product 2", questionID: "fa_6d", textAnswer: self.fa_6d, tickAnswer: false, id: csession)
        self.SaveQuestion("Additional Product 2", questionID: "fa_7a", textAnswer: self.fa_7a, tickAnswer: false, id: csession)
        self.SaveQuestion("Additional Product 2", questionID: "fa_7b", textAnswer: self.fa_7b, tickAnswer: false, id: csession)
        self.SaveQuestion("Additional Product 2", questionID: "fa_7c", textAnswer: "", tickAnswer: self.fa_7c, id: csession)
        
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1a, forKey: "12fa_1a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_1b, forKey: "12fa_1b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2a, forKey: "12fa_2a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_2b, forKey: "12fa_2b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_3a, forKey: "12fa_3a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_4a, forKey: "12fa_4a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_5a, forKey: "12fa_5a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6a, forKey: "12fa_6a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6b, forKey: "12fa_6b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6c, forKey: "12fa_6c")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_6d, forKey: "12fa_6d")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7a, forKey: "12fa_7a")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7b, forKey: "12fa_7b")
        NSUserDefaults.standardUserDefaults().setObject(self.fa_7c, forKey: "12fa_7c")
        NSUserDefaults.standardUserDefaults().setObject(true, forKey: "12fa_done")
        
    }
    
    func SaveQuestion (columnID: String, questionID: String, textAnswer: String, tickAnswer:Bool, id: String) {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        
        // cek duplikasi dulu
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        fetchRequest.predicate = NSPredicate(format: "columnID = %@ AND questionID = %@ AND id = %@", columnID, questionID, id)
        do {
            
            //hapus duplikat
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count > 0{
                let duplicate = result[0] as! NSManagedObject
                managedObjectContext.deleteObject(duplicate)
                try managedObjectContext.save()
            }
            
            //setelah duplikat dihapus, baru tulis baru
            let entity = NSEntityDescription.entityForName("CoachingQuestionAnswer", inManagedObjectContext: managedObjectContext)
            let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
            
            managedObject.setValue(columnID, forKey: "columnID")
            managedObject.setValue(questionID, forKey: "questionID")
            managedObject.setValue(textAnswer, forKey: "textAnswer")
            managedObject.setValue(tickAnswer, forKey: "tickAnswer")
            managedObject.setValue(id, forKey: "id")
            
            try managedObjectContext.save()
        }
        
        catch let error as NSError {
            print(error)
        }
    }
}
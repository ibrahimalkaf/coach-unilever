//
//  FASAQ1.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/23/16.
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

        form
            +++ Section("Produk A Size A")
            <<< LabelRow(){
                $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
            }
            
            <<< CheckRow(){
                if (self.fa_1a){
                    $0.baseValue = true
                }
                $0.tag = "fa_1a"
                $0.title = "a. Apakah produk tersedia di Shelf?"
            }
            <<< CheckRow(){
                if self.fa_1b{
                    $0.baseValue = true
                }
                $0.tag = "fa_1b"
                $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
            }
            
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
                    cell.textLabel?.numberOfLines = 2
                })
            <<< CheckRow(){
                if (self.fa_2b){
                    $0.baseValue = true
                }
                $0.tag = "fa_2b"
                $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
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
                    cell.textLabel?.numberOfLines = 4
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
                    cell.textLabel?.numberOfLines = 2
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
                    cell.textLabel?.numberOfLines = 2
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
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                if (self.fa_6b != ""){
                    $0.baseValue = self.fa_6b
                }
                $0.tag = "fa_6b"
                $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
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
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                if (self.fa_6d != ""){
                    $0.baseValue = self.fa_6d
                }
                $0.tag = "fa_6d"
                $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.tag = "fa_rpi"
                $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 3
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
                cell.textLabel?.numberOfLines = 2
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
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< CheckRow(){
                if (self.fa_7c){
                    $0.baseValue = true
                }
                $0.tag = "fa_7c"
                $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
        
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
        
        self.SaveQuestion("Produk A\nSize A", questionID: "fa_1a", textAnswer: "", tickAnswer: self.fa_1a, id: csession)
        self.SaveQuestion("Produk A\nSize A", questionID: "fa_1b", textAnswer: "", tickAnswer: self.fa_1b, id: csession)
        self.SaveQuestion("Produk A\nSize A", questionID: "fa_2a", textAnswer: "", tickAnswer: self.fa_2a, id: csession)
        self.SaveQuestion("Produk A\nSize A", questionID: "fa_2b", textAnswer: "", tickAnswer: self.fa_2b, id: csession)
        self.SaveQuestion("Produk A\nSize A", questionID: "fa_3a", textAnswer: "", tickAnswer: self.fa_3a, id: csession)
        self.SaveQuestion("Produk A\nSize A", questionID: "fa_4a", textAnswer: "", tickAnswer: self.fa_4a, id: csession)
        self.SaveQuestion("Produk A\nSize A", questionID: "fa_5a", textAnswer: "", tickAnswer: self.fa_5a, id: csession)
        self.SaveQuestion("Produk A\nSize A", questionID: "fa_6a", textAnswer: self.fa_6a, tickAnswer: false, id: csession)
        self.SaveQuestion("Produk A\nSize A", questionID: "fa_6b", textAnswer: self.fa_6b, tickAnswer: false, id: csession)
        self.SaveQuestion("Produk A\nSize A", questionID: "fa_6c", textAnswer: self.fa_6c, tickAnswer: false, id: csession)
        self.SaveQuestion("Produk A\nSize A", questionID: "fa_6d", textAnswer: self.fa_6d, tickAnswer: false, id: csession)
        self.SaveQuestion("Produk A\nSize A", questionID: "fa_7a", textAnswer: self.fa_7a, tickAnswer: false, id: csession)
        self.SaveQuestion("Produk A\nSize A", questionID: "fa_7b", textAnswer: self.fa_7b, tickAnswer: false, id: csession)
        self.SaveQuestion("Produk A\nSize A", questionID: "fa_7c", textAnswer: "", tickAnswer: self.fa_7c, id: csession)
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        form
            +++ Section("Produk 2")
            <<< LabelRow(){
                $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
            }
            
            <<< CheckRow(){
                if (self.fa_1a){
                    $0.baseValue = true
                }
                $0.tag = "fa_1a"
                $0.title = "a. Apakah produk tersedia di Shelf?"
            }
            <<< CheckRow(){
                if self.fa_1b{
                    $0.baseValue = true
                }
                $0.tag = "fa_1b"
                $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
            }
            
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
                    cell.textLabel?.numberOfLines = 2
                })
            <<< CheckRow(){
                if (self.fa_2b){
                    $0.baseValue = true
                }
                $0.tag = "fa_2b"
                $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
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
                    cell.textLabel?.numberOfLines = 4
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
                    cell.textLabel?.numberOfLines = 2
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
                    cell.textLabel?.numberOfLines = 2
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
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                if (self.fa_6b != ""){
                    $0.baseValue = self.fa_6b
                }
                $0.tag = "fa_6b"
                $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                if (self.fa_6c != ""){
                    $0.baseValue = self.fa_6c
                }
                $0.tag = "fa_6c"
                $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                if (self.fa_6d != ""){
                    $0.baseValue = self.fa_6d
                }
                $0.tag = "fa_6d"
                $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.tag = "fa_rpi"
                $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 3
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
                    cell.textLabel?.numberOfLines = 2
                })
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t:\t kompetitor"
            }
            <<< TextRow(){
                if (self.fa_7b != ""){
                    $0.baseValue = self.fa_7b
                }
                $0.tag = "fa_7b"
                $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< CheckRow(){
                if (self.fa_7c){
                    $0.baseValue = true
                }
                $0.tag = "fa_7c"
                $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
        
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
            self.fa_1a = fa_4a
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
    
    
}
class FASAQ3 : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.italicSystemFontOfSize(10)
            cell.textField.font = UIFont.italicSystemFontOfSize(10)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        }
        CheckRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
        }
        ButtonRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
            cell.textLabel?.textAlignment = NSTextAlignment.Left
            cell.textLabel?.textColor = .blackColor()
        }
        
        form
            +++ Section("Produk 3")
            <<< LabelRow(){
                $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah produk tersedia di Shelf?"
            }
            <<< CheckRow(){
                $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
            }
            
            <<< LabelRow(){
                $0.title = "2. POINT OF SALES (POS)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< CheckRow(){
                $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "3. FA/SA/Merchandiser Performance"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 4
                })
            
            <<< LabelRow(){
                $0.title = "4. PRODUCT DISTRIBUTION (PD)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "5. PROMO COMPLIANCE (PC)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "6. RELATIVE PRICE INDEX (RPI)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 3
                })
            
            <<< LabelRow(){
                $0.title = "7. SHARE OF SPACE (SOS)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< CheckRow(){
                $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
        
    }
    
}

class FASAQ4 : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.italicSystemFontOfSize(10)
            cell.textField.font = UIFont.italicSystemFontOfSize(10)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        }
        CheckRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
        }
        ButtonRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
            cell.textLabel?.textAlignment = NSTextAlignment.Left
            cell.textLabel?.textColor = .blackColor()
        }
        
        form
            +++ Section("Produk 4")
            <<< LabelRow(){
                $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah produk tersedia di Shelf?"
            }
            <<< CheckRow(){
                $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
            }
            
            <<< LabelRow(){
                $0.title = "2. POINT OF SALES (POS)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< CheckRow(){
                $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "3. FA/SA/Merchandiser Performance"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 4
                })
            
            <<< LabelRow(){
                $0.title = "4. PRODUCT DISTRIBUTION (PD)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "5. PROMO COMPLIANCE (PC)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "6. RELATIVE PRICE INDEX (RPI)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 3
                })
            
            <<< LabelRow(){
                $0.title = "7. SHARE OF SPACE (SOS)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< CheckRow(){
                $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
        
    }
    
}

class FASAQ5 : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.italicSystemFontOfSize(10)
            cell.textField.font = UIFont.italicSystemFontOfSize(10)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        }
        CheckRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
        }
        ButtonRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
            cell.textLabel?.textAlignment = NSTextAlignment.Left
            cell.textLabel?.textColor = .blackColor()
        }
        
        form
            +++ Section("Produk 5")
            <<< LabelRow(){
                $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah produk tersedia di Shelf?"
            }
            <<< CheckRow(){
                $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
            }
            
            <<< LabelRow(){
                $0.title = "2. POINT OF SALES (POS)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< CheckRow(){
                $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "3. FA/SA/Merchandiser Performance"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 4
                })
            
            <<< LabelRow(){
                $0.title = "4. PRODUCT DISTRIBUTION (PD)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "5. PROMO COMPLIANCE (PC)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "6. RELATIVE PRICE INDEX (RPI)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 3
                })
            
            <<< LabelRow(){
                $0.title = "7. SHARE OF SPACE (SOS)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< CheckRow(){
                $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
        
    }
    
}

class FASAQ6 : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.italicSystemFontOfSize(10)
            cell.textField.font = UIFont.italicSystemFontOfSize(10)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        }
        CheckRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
        }
        ButtonRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
            cell.textLabel?.textAlignment = NSTextAlignment.Left
            cell.textLabel?.textColor = .blackColor()
        }
        
        form
            +++ Section("Produk 6")
            <<< LabelRow(){
                $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah produk tersedia di Shelf?"
            }
            <<< CheckRow(){
                $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
            }
            
            <<< LabelRow(){
                $0.title = "2. POINT OF SALES (POS)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< CheckRow(){
                $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "3. FA/SA/Merchandiser Performance"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 4
                })
            
            <<< LabelRow(){
                $0.title = "4. PRODUCT DISTRIBUTION (PD)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "5. PROMO COMPLIANCE (PC)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "6. RELATIVE PRICE INDEX (RPI)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 3
                })
            
            <<< LabelRow(){
                $0.title = "7. SHARE OF SPACE (SOS)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< CheckRow(){
                $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
        
    }
    
}

class FASAQ7 : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.italicSystemFontOfSize(10)
            cell.textField.font = UIFont.italicSystemFontOfSize(10)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        }
        CheckRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
        }
        ButtonRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
            cell.textLabel?.textAlignment = NSTextAlignment.Left
            cell.textLabel?.textColor = .blackColor()
        }
        
        form
            +++ Section("Produk 7")
            <<< LabelRow(){
                $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah produk tersedia di Shelf?"
            }
            <<< CheckRow(){
                $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
            }
            
            <<< LabelRow(){
                $0.title = "2. POINT OF SALES (POS)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< CheckRow(){
                $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "3. FA/SA/Merchandiser Performance"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 4
                })
            
            <<< LabelRow(){
                $0.title = "4. PRODUCT DISTRIBUTION (PD)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "5. PROMO COMPLIANCE (PC)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "6. RELATIVE PRICE INDEX (RPI)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 3
                })
            
            <<< LabelRow(){
                $0.title = "7. SHARE OF SPACE (SOS)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< CheckRow(){
                $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
        
    }
    
}

class FASAQ8 : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.italicSystemFontOfSize(10)
            cell.textField.font = UIFont.italicSystemFontOfSize(10)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        }
        CheckRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
        }
        ButtonRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
            cell.textLabel?.textAlignment = NSTextAlignment.Left
            cell.textLabel?.textColor = .blackColor()
        }
        
        form
            +++ Section("Produk 8")
            <<< LabelRow(){
                $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah produk tersedia di Shelf?"
            }
            <<< CheckRow(){
                $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
            }
            
            <<< LabelRow(){
                $0.title = "2. POINT OF SALES (POS)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< CheckRow(){
                $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "3. FA/SA/Merchandiser Performance"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 4
                })
            
            <<< LabelRow(){
                $0.title = "4. PRODUCT DISTRIBUTION (PD)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "5. PROMO COMPLIANCE (PC)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "6. RELATIVE PRICE INDEX (RPI)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 3
                })
            
            <<< LabelRow(){
                $0.title = "7. SHARE OF SPACE (SOS)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< CheckRow(){
                $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
        
    }
    
}

class FASAQ9 : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.italicSystemFontOfSize(10)
            cell.textField.font = UIFont.italicSystemFontOfSize(10)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        }
        CheckRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
        }
        ButtonRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
            cell.textLabel?.textAlignment = NSTextAlignment.Left
            cell.textLabel?.textColor = .blackColor()
        }
        
        form
            +++ Section("Produk 9")
            <<< LabelRow(){
                $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah produk tersedia di Shelf?"
            }
            <<< CheckRow(){
                $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
            }
            
            <<< LabelRow(){
                $0.title = "2. POINT OF SALES (POS)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< CheckRow(){
                $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "3. FA/SA/Merchandiser Performance"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 4
                })
            
            <<< LabelRow(){
                $0.title = "4. PRODUCT DISTRIBUTION (PD)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "5. PROMO COMPLIANCE (PC)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "6. RELATIVE PRICE INDEX (RPI)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 3
                })
            
            <<< LabelRow(){
                $0.title = "7. SHARE OF SPACE (SOS)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< CheckRow(){
                $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
        
    }
    
}

class FASAQ10 : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.italicSystemFontOfSize(10)
            cell.textField.font = UIFont.italicSystemFontOfSize(10)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        }
        CheckRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
        }
        ButtonRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
            cell.textLabel?.textAlignment = NSTextAlignment.Left
            cell.textLabel?.textColor = .blackColor()
        }
        
        form
            +++ Section("Produk 10")
            <<< LabelRow(){
                $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah produk tersedia di Shelf?"
            }
            <<< CheckRow(){
                $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
            }
            
            <<< LabelRow(){
                $0.title = "2. POINT OF SALES (POS)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< CheckRow(){
                $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "3. FA/SA/Merchandiser Performance"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 4
                })
            
            <<< LabelRow(){
                $0.title = "4. PRODUCT DISTRIBUTION (PD)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "5. PROMO COMPLIANCE (PC)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "6. RELATIVE PRICE INDEX (RPI)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 3
                })
            
            <<< LabelRow(){
                $0.title = "7. SHARE OF SPACE (SOS)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< CheckRow(){
                $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
        
    }
    
}

class FASAQ11 : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.italicSystemFontOfSize(10)
            cell.textField.font = UIFont.italicSystemFontOfSize(10)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        }
        CheckRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
        }
        ButtonRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
            cell.textLabel?.textAlignment = NSTextAlignment.Left
            cell.textLabel?.textColor = .blackColor()
        }
        
        form
            +++ Section("Additional Product No.1")
            <<< LabelRow(){
                $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah produk tersedia di Shelf?"
            }
            <<< CheckRow(){
                $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
            }
            
            <<< LabelRow(){
                $0.title = "2. POINT OF SALES (POS)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< CheckRow(){
                $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "3. FA/SA/Merchandiser Performance"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 4
                })
            
            <<< LabelRow(){
                $0.title = "4. PRODUCT DISTRIBUTION (PD)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "5. PROMO COMPLIANCE (PC)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "6. RELATIVE PRICE INDEX (RPI)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 3
                })
            
            <<< LabelRow(){
                $0.title = "7. SHARE OF SPACE (SOS)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< CheckRow(){
                $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
        
    }
    
}

class FASAQ12 : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.italicSystemFontOfSize(10)
            cell.textField.font = UIFont.italicSystemFontOfSize(10)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        }
        CheckRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
        }
        ButtonRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(10)
            cell.textLabel?.textAlignment = NSTextAlignment.Left
            cell.textLabel?.textColor = .blackColor()
        }
        
        form
            +++ Section("Additional Product No.2")
            <<< LabelRow(){
                $0.title = "1. ON SHELF AVAILABILITY (OSA) & PRODUCT DISPLAY"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah produk tersedia di Shelf?"
            }
            <<< CheckRow(){
                $0.title = "b. Apakah semua Front Pack menghadap kedepan?"
            }
            
            <<< LabelRow(){
                $0.title = "2. POINT OF SALES (POS)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Materi POS apa yang tersedia saat ini \ndari marketing?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< CheckRow(){
                $0.title = "b. Bila ada POS material dari Trade Marketing\n, apakah sudah di implementasi?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "3. FA/SA/Merchandiser Performance"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah FA/SA/Merchandiser telah menjelaskan\n produk sesuai dengan Selling Story ke customer?\n (bila tidak ada customer, tanyakan langsung \nkeunggulan produk tersebut)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 4
                })
            
            <<< LabelRow(){
                $0.title = "4. PRODUCT DISTRIBUTION (PD)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "5. PROMO COMPLIANCE (PC)"
            }
            
            <<< CheckRow(){
                $0.title = "a. Apakah Price Tag produk telah terpampang di Shelf\n (ter-listing)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "6. RELATIVE PRICE INDEX (RPI)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapakah produk tersebut dijual\n di Store? (A)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "b. Berapakah ukuran produknya?\n (gram atau ml) (B)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "c. Berapakah harga kompetitor \nproduk sejenis di Store tersebut? (C)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "d. Berapakah ukuran produk \ncompetitor tersebut? (gram atau ml) (D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.title = "RELATIVE PRICE INDEX (RPI) \n *RPI = Produk UFS (ml/gr) : Produk \nKopetitor (ml/gr) = (A/B) : (C/D)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 3
                })
            
            <<< LabelRow(){
                $0.title = "7. SHARE OF SPACE (SOS)"
            }
            
            <<< TextRow(){
                $0.title = "a. Berapa jumlah tier yang digunakan\n untuk mendisplay produk UFS di Shelf?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< LabelRow(){
                $0.title = "PRODUK KOMPETITOR \t\t xxx"
            }
            <<< TextRow(){
                $0.title = "b. Berapa jumlah tier yang digunakan \ncompetitor sejenis untuk \nmen-display produknya di Shelf"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            
            <<< CheckRow(){
                $0.title = "c. Apakah SOS (jumlah tier) produk UFS \nlebih dari produk competitor?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
        
    }
    
}

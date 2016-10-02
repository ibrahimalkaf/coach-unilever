//
//  DTSForm.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/15/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import Eureka
import Firebase
import FirebaseDatabase
import CoreData


class DTSForm : FormViewController {
    
    var rootRef: FIRDatabaseReference!
    var coachingsession: String = ""
    
    var distributor: String = ""
    var area: String = ""
    
    var dsr_sebelum_1: Bool = false
    var dsr_sebelum_1r: String = ""
    var dsr_sebelum_2: Bool = false
    var dsr_sebelum_2r: String = ""
    var dsr_sebelum_3: Bool = false
    var dsr_sebelum_3r: String = ""
    var dsr_sebelum_4a: Bool = false
    var dsr_sebelum_4ar: String = ""
    var dsr_sebelum_4b: Bool = false
    var dsr_sebelum_4br: String = ""
    var dsr_sebelum_4c: Bool = false
    var dsr_sebelum_4cr: String = ""
    var dsr_sebelum_4d: Bool = false
    var dsr_sebelum_4dr: String = ""
    var dsr_sebelum_4e: Bool = false
    var dsr_sebelum_4er: String = ""
    
    var dsr_saat_1: Set<String> = []
    var dsr_saat_2: Set<String> = []
    var dsr_saat_3: Set<String> = []
    var dsr_saat_4: Set<String> = []
    var dsr_saat_5: Set<String> = []
    var dsr_saat_6: Set<String> = []
    var dsr_saat_7: Set<String> = []
    var dsr_saat_8: Set<String> = []
    var dsr_saat_9: Set<String> = []
    var dsr_saat_10: Set<String> = []
    
    var dsr_setelah_1: Bool = false
    var dsr_setelah_1r: String = ""
    var dsr_setelah_2: Bool = false
    var dsr_setelah_2r: String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let coachname = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coachname) as String!
        let coacheename = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coacheename) as String!
        self.coachingsession = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coachingSession)!
        
        /*
         rootRef = FIRDatabase.database().reference()
         let itemsRef = rootRef.child("coachingSession")
         let coachingRef = itemsRef.child(self.coachingsession)
         
         print(coachingRef)
         coachingRef.observeEventType(.Value, withBlock: { snapshot in
         print(snapshot.value)
         coacheename = snapshot.value!["coacheeName"] as! String
         print(coacheename)
         }, withCancelBlock: { error in
         print(error.description)
         })
         
         */
        
        
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
                $0.options = ["Sebelum", "Report", "Infrastruktur","DSR"]
                $0.value = "Sebelum"
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
                $0.tag = "distributor"
                $0.title = "Distributor:"
            }
            <<< TextRow(){
                $0.tag = "area"
                $0.title = "Area:"
            }
            
            
            +++ Section("Sebelum Kunjungan"){
                $0.tag = "sebelum"
                $0.hidden = "$segments != 'Sebelum'"
            }
            <<< LabelRow(){
                $0.title = "Perencanaan dan persiapan (Tick if Done/Know)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                })
            <<< CheckRow(){
                $0.tag = "dsr_sebelum_1"
                $0.title = "1. Menganalisa kembali tujuan dari kunjungan"
            }
            <<< TextRow(){
                $0.tag = "dsr_sebelum_1r"
                $0.placeholder = "Remarks:"
            }
            
            <<< CheckRow(){
                $0.tag = "dsr_sebelum_2"
                $0.title = "2. Men-cek stock availability yang ada di gudang"
            }
            <<< TextRow(){
                $0.tag = "dsr_sebelum_2r"
                $0.placeholder = "Remarks:"
            }
            <<< CheckRow(){
                $0.tag = "dsr_sebelum_3"
                $0.title = "3. Mengetahui dan memahami promo-promo yang sedang berlangsung"
            }
            <<< TextRow(){
                $0.tag = "dsr_sebelum_3r"
                $0.placeholder = "Remarks:"
            }
            <<< LabelRow(){
                $0.title = "4. Mempersiapkan tools untuk kunjungan"
            }
            <<< CheckRow(){
                $0.tag = "dsr_sebelum_4a"
                $0.title = "\ta. TRC, Alat Tulis, dan Kalkulator"
            }
            <<< TextRow(){
                $0.tag = "dsr_sebelum_4ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dsr_sebelum_4b"
                $0.title = "\tb. Kartu Nama"
            }
            <<< TextRow(){
                $0.tag = "dsr_sebelum_4br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dsr_sebelum_4c"
                $0.title = "\tc. Katalog Produk"
            }
            <<< TextRow(){
                $0.tag = "dsr_sebelum_4cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dsr_sebelum_4d"
                $0.title = "\td. Marketing Program"
            }
            <<< TextRow(){
                $0.tag = "dsr_sebelum_4dr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dsr_sebelum_4e"
                $0.title = "\te. Price List"
            }
            <<< TextRow(){
                $0.tag = "dsr_sebelum_4er"
                $0.placeholder = "\tRemarks:"
            }
            
            +++ Section("Pada saat kunjungan"){
                $0.tag = "kunjungan"
                $0.hidden = "$segments != 'Kunjungan'"
            }
            
            <<< MultipleSelectorRow<String>() {
                $0.tag = "dsr_saat_1"
                $0.title = "1. Perkenalan"
                $0.options = ["Customer ke-1", "Customer ke-2", "Customer ke-3", "Customer ke-4", "Customer ke-5", "Customer ke-6", "Customer ke-7", "Customer ke-8", "Customer ke-9", "Customer ke-10"]
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.systemFontOfSize(10)
                })
            
            <<< MultipleSelectorRow<String>() {
                $0.tag = "dsr_saat_2"
                $0.title = "2. Check stock produk UFS baik yang sudah didisplay di shelf maupun di gudang"
                $0.options = ["Customer ke-1", "Customer ke-2", "Customer ke-3", "Customer ke-4", "Customer ke-5", "Customer ke-6", "Customer ke-7", "Customer ke-8", "Customer ke-9", "Customer ke-10"]
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.systemFontOfSize(10)
                })
            
            <<< LabelRow(){
                $0.title = "3. Presentasi"
            }
            
            <<< MultipleSelectorRow<String>() {
                $0.tag = "dsr_saat_3"
                $0.title = "\ta. Menawarkan penambahan stock (taking order) pada customer"
                $0.options = ["Customer ke-1", "Customer ke-2", "Customer ke-3", "Customer ke-4", "Customer ke-5", "Customer ke-6", "Customer ke-7", "Customer ke-8", "Customer ke-9", "Customer ke-10"]
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.systemFontOfSize(10)
                })
            
            <<< MultipleSelectorRow<String>() {
                $0.tag = "dsr_saat_4"
                $0.title = "\tb. Menawarkan penambahan SKU baru (NPI)"
                $0.options = ["Customer ke-1", "Customer ke-2", "Customer ke-3", "Customer ke-4", "Customer ke-5", "Customer ke-6", "Customer ke-7", "Customer ke-8", "Customer ke-9", "Customer ke-10"]
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.systemFontOfSize(10)
                })
            
            <<< MultipleSelectorRow<String>() {
                $0.tag = "dsr_saat_5"
                $0.title = "\tc. Presentasi produk: menguasai keunggulan produk"
                $0.options = ["Customer ke-1", "Customer ke-2", "Customer ke-3", "Customer ke-4", "Customer ke-5", "Customer ke-6", "Customer ke-7", "Customer ke-8", "Customer ke-9", "Customer ke-10"]
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.systemFontOfSize(10)
                })
            
            <<< MultipleSelectorRow<String>() {
                $0.tag = "dsr_saat_6"
                $0.title = "\td. Presentasi harga: menguasai produk"
                $0.options = ["Customer ke-1", "Customer ke-2", "Customer ke-3", "Customer ke-4", "Customer ke-5", "Customer ke-6", "Customer ke-7", "Customer ke-8", "Customer ke-9", "Customer ke-10"]
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.systemFontOfSize(10)
                })
            
            <<< MultipleSelectorRow<String>() {
                $0.tag = "dsr_saat_7"
                $0.title = "\te. Presentasi program: menguasai program-program yang sedang berlangsung"
                $0.options = ["Customer ke-1", "Customer ke-2", "Customer ke-3", "Customer ke-4", "Customer ke-5", "Customer ke-6", "Customer ke-7", "Customer ke-8", "Customer ke-9", "Customer ke-10"]
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.systemFontOfSize(10)
                })
            
            
            <<< MultipleSelectorRow<String>() {
                $0.tag = "dsr_saat_8"
                $0.title = "4. Penutupan: merekonfirmasi hasil kunjungan (jumlah orderan, dll)"
                $0.options = ["Customer ke-1", "Customer ke-2", "Customer ke-3", "Customer ke-4", "Customer ke-5", "Customer ke-6", "Customer ke-7", "Customer ke-8", "Customer ke-9", "Customer ke-10"]
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.systemFontOfSize(10)
                })
            
            <<< MultipleSelectorRow<String>() {
                $0.tag = "dsr_saat_9"
                $0.title = "5. Melakukan merchandising"
                $0.options = ["Customer ke-1", "Customer ke-2", "Customer ke-3", "Customer ke-4", "Customer ke-5", "Customer ke-6", "Customer ke-7", "Customer ke-8", "Customer ke-9", "Customer ke-10"]
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.systemFontOfSize(10)
                })
            
            <<< MultipleSelectorRow<String>() {
                $0.tag = "dsr_saat_10"
                $0.title = "6. Mengisi TRC"
                $0.options = ["Customer ke-1", "Customer ke-2", "Customer ke-3", "Customer ke-4", "Customer ke-5", "Customer ke-6", "Customer ke-7", "Customer ke-8", "Customer ke-9", "Customer ke-10"]
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.systemFontOfSize(10)
                })
            
            +++ Section("Setelah kunjungan"){
                $0.tag = "setelah"
                $0.hidden = "$segments != 'Setelah'"
            }
            <<< LabelRow(){
                $0.title = "Finalisasi dan Evaluasi (Tick if Done/Know)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                })
            <<< CheckRow(){
                $0.tag = "dsr_setelah_1"
                $0.title = "1. Perkenalan"
            }
            <<< TextRow(){
                $0.tag = "dsr_setelah_1r"
                $0.placeholder = "Remarks:"
            }
            <<< CheckRow(){
                $0.tag = "dsr_setelah_2"
                $0.title = "2. Check stock produk UFS baik yang sudah \n didisplay di shelf maupun di gudang"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.numberOfLines = 2
                })
            <<< TextRow(){
                $0.tag = "dsr_setelah_2r"
                $0.placeholder = "Remarks:"
            }
            
            <<< ButtonRow("save") {row in
                row.title = "Save"
                row.onCellSelection(self.saveDSRCoreData)
        }
        
        print(AppDelegate.getAppDelegate().getDocDir())
    }
    
    
    func saveDSR(cell: ButtonCellOf<String>, row: ButtonRow) {
        
        
        rootRef = FIRDatabase.database().reference()
        let itemsRef = rootRef.child("coachingQuestionAnswer")
        let questionanswer = itemsRef.child(self.coachingsession)
        
        var questionarray = [AnyObject]()
        
        
        if let dsr_sebelum_1 = self.form.rowByTag("dsr_sebelum_1")?.baseValue as? Bool
        {
            self.dsr_sebelum_1 = dsr_sebelum_1
        }
        if let dsr_sebelum_1r = self.form.rowByTag("dsr_sebelum_1r")?.baseValue as? String
        {
            self.dsr_sebelum_1r = dsr_sebelum_1r
        }
        if let dsr_sebelum_2 = self.form.rowByTag("dsr_sebelum_2")?.baseValue as? Bool
        {
            self.dsr_sebelum_2 = dsr_sebelum_2
        }
        if let dsr_sebelum_2r = self.form.rowByTag("dsr_sebelum_2r")?.baseValue as? String
        {
            self.dsr_sebelum_2r = dsr_sebelum_2r
        }
        if let dsr_sebelum_3 = self.form.rowByTag("dsr_sebelum_3")?.baseValue as? Bool
        {
            self.dsr_sebelum_3 = dsr_sebelum_3
        }
        if let dsr_sebelum_3r = self.form.rowByTag("dsr_sebelum_3r")?.baseValue as? String
        {
            self.dsr_sebelum_3r = dsr_sebelum_3r
        }
        if let dsr_sebelum_4a = self.form.rowByTag("dsr_sebelum_4a")?.baseValue as? Bool
        {
            self.dsr_sebelum_4a = dsr_sebelum_4a
        }
        if let dsr_sebelum_4ar = self.form.rowByTag("dsr_sebelum_4ar")?.baseValue as? String
        {
            self.dsr_sebelum_4ar = dsr_sebelum_4ar
        }
        if let dsr_sebelum_4b = self.form.rowByTag("dsr_sebelum_4b")?.baseValue as? Bool
        {
            self.dsr_sebelum_4b = dsr_sebelum_4b
        }
        if let dsr_sebelum_4br = self.form.rowByTag("dsr_sebelum_4br")?.baseValue as? String
        {
            self.dsr_sebelum_4br = dsr_sebelum_4br
        }
        if let dsr_sebelum_4c = self.form.rowByTag("dsr_sebelum_4c")?.baseValue as? Bool
        {
            self.dsr_sebelum_4c = dsr_sebelum_4c
        }
        if let dsr_sebelum_4cr = self.form.rowByTag("dsr_sebelum_4cr")?.baseValue as? String
        {
            self.dsr_sebelum_4cr = dsr_sebelum_4cr
        }
        if let dsr_sebelum_4d = self.form.rowByTag("dsr_sebelum_4d")?.baseValue as? Bool
        {
            self.dsr_sebelum_4d = dsr_sebelum_4d
        }
        if let dsr_sebelum_4dr = self.form.rowByTag("dsr_sebelum_4dr")?.baseValue as? String
        {
            self.dsr_sebelum_4dr = dsr_sebelum_4dr
        }
        if let dsr_sebelum_4e = self.form.rowByTag("dsr_sebelum_4e")?.baseValue as? Bool
        {
            self.dsr_sebelum_4e = dsr_sebelum_4e
        }
        if let dsr_sebelum_4er = self.form.rowByTag("dsr_sebelum_4er")?.baseValue as? String
        {
            self.dsr_sebelum_4er = dsr_sebelum_4er
        }
        
        
        if let dsr_saat_1 = self.form.rowByTag("dsr_saat_1")?.baseValue as? Set<String>
        {
            self.dsr_saat_1 = dsr_saat_1
            /*
             for isi in dsr_saat_1 {
             print("isi: \(isi)")
             }*/
        }
        if let dsr_saat_2 = self.form.rowByTag("dsr_saat_2")?.baseValue as? Set<String>
        {
            self.dsr_saat_2 = dsr_saat_2
        }
        if let dsr_saat_3 = self.form.rowByTag("dsr_saat_3")?.baseValue as? Set<String>
        {
            self.dsr_saat_3 = dsr_saat_3
        }
        if let dsr_saat_4 = self.form.rowByTag("dsr_saat_4")?.baseValue as? Set<String>
        {
            self.dsr_saat_4 = dsr_saat_4
        }
        if let dsr_saat_5 = self.form.rowByTag("dsr_saat_5")?.baseValue as? Set<String>
        {
            self.dsr_saat_5 = dsr_saat_5
        }
        if let dsr_saat_6 = self.form.rowByTag("dsr_saat_6")?.baseValue as? Set<String>
        {
            self.dsr_saat_6 = dsr_saat_6
        }
        if let dsr_saat_7 = self.form.rowByTag("dsr_saat_7")?.baseValue as? Set<String>
        {
            self.dsr_saat_7 = dsr_saat_7
        }
        if let dsr_saat_8 = self.form.rowByTag("dsr_saat_8")?.baseValue as? Set<String>
        {
            self.dsr_saat_8 = dsr_saat_8
        }
        if let dsr_saat_9 = self.form.rowByTag("dsr_saat_9")?.baseValue as? Set<String>
        {
            self.dsr_saat_9 = dsr_saat_9
        }
        if let dsr_saat_10 = self.form.rowByTag("dsr_saat_10")?.baseValue as? Set<String>
        {
            self.dsr_saat_10 = dsr_saat_10
        }
        
        if let dsr_setelah_1 = self.form.rowByTag("dsr_setelah_1")?.baseValue as? Bool
        {
            self.dsr_setelah_1 = dsr_setelah_1
        }
        if let dsr_setelah_1r = self.form.rowByTag("dsr_setelah_1r")?.baseValue as? String
        {
            self.dsr_setelah_1r = dsr_setelah_1r
        }
        if let dsr_setelah_2 = self.form.rowByTag("dsr_setelah_2")?.baseValue as? Bool
        {
            self.dsr_setelah_2 = dsr_setelah_2
        }
        if let dsr_setelah_2r = self.form.rowByTag("dsr_setelah_2r")?.baseValue as? String
        {
            self.dsr_setelah_2r = dsr_setelah_2r
        }
        
        
        
        let question1 = QuestionObject(columnID: "", questionID: "dsr_sebelum_1", textAnswer: self.dsr_sebelum_1r, tickAnswer: self.dsr_sebelum_1)
        questionarray.append(question1.toAnyObject())
        
        let question2 = QuestionObject(columnID: "", questionID: "dsr_sebelum_2", textAnswer: self.dsr_sebelum_2r, tickAnswer: self.dsr_sebelum_2)
        questionarray.append(question2.toAnyObject())
        
        let question3 = QuestionObject(columnID: "", questionID: "dsr_sebelum_3", textAnswer: self.dsr_sebelum_3r, tickAnswer: self.dsr_sebelum_3)
        questionarray.append(question3.toAnyObject())
        
        let question4a = QuestionObject(columnID: "", questionID: "dsr_sebelum_4a", textAnswer: self.dsr_sebelum_4ar, tickAnswer: self.dsr_sebelum_4a)
        questionarray.append(question4a.toAnyObject())
        
        let question4b = QuestionObject(columnID: "", questionID: "dsr_sebelum_4b", textAnswer: self.dsr_sebelum_4br, tickAnswer: self.dsr_sebelum_4b)
        questionarray.append(question4b.toAnyObject())
        
        let question4c = QuestionObject(columnID: "", questionID: "dsr_sebelum_4c", textAnswer: self.dsr_sebelum_4cr, tickAnswer: self.dsr_sebelum_4c)
        questionarray.append(question4c.toAnyObject())
        
        let question4d = QuestionObject(columnID: "", questionID: "dsr_sebelum_4d", textAnswer: self.dsr_sebelum_4dr, tickAnswer: self.dsr_sebelum_4d)
        questionarray.append(question4d.toAnyObject())
        
        let question4e = QuestionObject(columnID: "", questionID: "dsr_sebelum_4e", textAnswer: self.dsr_sebelum_4er, tickAnswer: self.dsr_sebelum_4e)
        questionarray.append(question4e.toAnyObject())
        
        
        for index in 1...10{
            if dsr_saat_1.contains("Customer ke-\(index)"){
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_1", textAnswer: "", tickAnswer: true)
                questionarray.append(customer.toAnyObject())
            }
            else{
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_1", textAnswer: "", tickAnswer: false)
                questionarray.append(customer.toAnyObject())
            }
        }
        for index in 1...10{
            if dsr_saat_2.contains("Customer ke-\(index)"){
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_2", textAnswer: "", tickAnswer: true)
                questionarray.append(customer.toAnyObject())
            }
            else{
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_2", textAnswer: "", tickAnswer: false)
                questionarray.append(customer.toAnyObject())
            }
        }
        for index in 1...10{
            if dsr_saat_3.contains("Customer ke-\(index)"){
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_3", textAnswer: "", tickAnswer: true)
                questionarray.append(customer.toAnyObject())
            }
            else{
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_3", textAnswer: "", tickAnswer: false)
                questionarray.append(customer.toAnyObject())
            }
        }
        for index in 1...10{
            if dsr_saat_4.contains("Customer ke-\(index)"){
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_4", textAnswer: "", tickAnswer: true)
                questionarray.append(customer.toAnyObject())
            }
            else{
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_4", textAnswer: "", tickAnswer: false)
                questionarray.append(customer.toAnyObject())
            }
        }
        for index in 1...10{
            if dsr_saat_5.contains("Customer ke-\(index)"){
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_5", textAnswer: "", tickAnswer: true)
                questionarray.append(customer.toAnyObject())
            }
            else{
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_5", textAnswer: "", tickAnswer: false)
                questionarray.append(customer.toAnyObject())
            }
        }
        for index in 1...10{
            if dsr_saat_6.contains("Customer ke-\(index)"){
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_6", textAnswer: "", tickAnswer: true)
                questionarray.append(customer.toAnyObject())
            }
            else{
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_6", textAnswer: "", tickAnswer: false)
                questionarray.append(customer.toAnyObject())
            }
        }
        for index in 1...10{
            if dsr_saat_7.contains("Customer ke-\(index)"){
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_7", textAnswer: "", tickAnswer: true)
                questionarray.append(customer.toAnyObject())
            }
            else{
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_7", textAnswer: "", tickAnswer: false)
                questionarray.append(customer.toAnyObject())
            }
        }
        for index in 1...10{
            if dsr_saat_8.contains("Customer ke-\(index)"){
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_8", textAnswer: "", tickAnswer: true)
                questionarray.append(customer.toAnyObject())
            }
            else{
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_8", textAnswer: "", tickAnswer: false)
                questionarray.append(customer.toAnyObject())
            }
        }
        for index in 1...10{
            if dsr_saat_9.contains("Customer ke-\(index)"){
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_9", textAnswer: "", tickAnswer: true)
                questionarray.append(customer.toAnyObject())
            }
            else{
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_9", textAnswer: "", tickAnswer: false)
                questionarray.append(customer.toAnyObject())
            }
        }
        for index in 1...10{
            if dsr_saat_10.contains("Customer ke-\(index)"){
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_10", textAnswer: "", tickAnswer: true)
                questionarray.append(customer.toAnyObject())
            }
            else{
                let customer = QuestionObject(columnID: "customer_\(index)", questionID: "dsr_saat_10", textAnswer: "", tickAnswer: false)
                questionarray.append(customer.toAnyObject())
            }
        }
        
        let questionafter1 = QuestionObject(columnID: "", questionID: "dsr_setelah_1", textAnswer: self.dsr_setelah_1r, tickAnswer: self.dsr_setelah_1)
        questionarray.append(questionafter1.toAnyObject())
        
        let questionafter2 = QuestionObject(columnID: "", questionID: "dsr_setelah_2", textAnswer: self.dsr_setelah_2r, tickAnswer: self.dsr_setelah_2)
        
        questionarray.append(questionafter2.toAnyObject())
        
        print(questionarray)
        
        NSUserDefaults.standardUserDefaults().setValue(questionarray, forKey: KeyLocal.dsrform)
        
        questionanswer.setValue(questionarray)
        
        
        self.performSegueWithIdentifier("dsrToSummary", sender: nil)
        
    }
    
    func saveDSRCoreData(cell: ButtonCellOf<String>, row: ButtonRow) {
        
        
        
        if let distributor = self.form.rowByTag("distributor")?.baseValue as? String
        {
            self.distributor = distributor
        }
        if let area = self.form.rowByTag("area")?.baseValue as? String
        {
            self.area = area
        }
        
        if let dsr_sebelum_1 = self.form.rowByTag("dsr_sebelum_1")?.baseValue as? Bool
        {
            self.dsr_sebelum_1 = dsr_sebelum_1
        }
        if let dsr_sebelum_1r = self.form.rowByTag("dsr_sebelum_1r")?.baseValue as? String
        {
            self.dsr_sebelum_1r = dsr_sebelum_1r
        }
        if let dsr_sebelum_2 = self.form.rowByTag("dsr_sebelum_2")?.baseValue as? Bool
        {
            self.dsr_sebelum_2 = dsr_sebelum_2
        }
        if let dsr_sebelum_2r = self.form.rowByTag("dsr_sebelum_2r")?.baseValue as? String
        {
            self.dsr_sebelum_2r = dsr_sebelum_2r
        }
        if let dsr_sebelum_3 = self.form.rowByTag("dsr_sebelum_3")?.baseValue as? Bool
        {
            self.dsr_sebelum_3 = dsr_sebelum_3
        }
        if let dsr_sebelum_3r = self.form.rowByTag("dsr_sebelum_3r")?.baseValue as? String
        {
            self.dsr_sebelum_3r = dsr_sebelum_3r
        }
        if let dsr_sebelum_4a = self.form.rowByTag("dsr_sebelum_4a")?.baseValue as? Bool
        {
            self.dsr_sebelum_4a = dsr_sebelum_4a
        }
        if let dsr_sebelum_4ar = self.form.rowByTag("dsr_sebelum_4ar")?.baseValue as? String
        {
            self.dsr_sebelum_4ar = dsr_sebelum_4ar
        }
        if let dsr_sebelum_4b = self.form.rowByTag("dsr_sebelum_4b")?.baseValue as? Bool
        {
            self.dsr_sebelum_4b = dsr_sebelum_4b
        }
        if let dsr_sebelum_4br = self.form.rowByTag("dsr_sebelum_4br")?.baseValue as? String
        {
            self.dsr_sebelum_4br = dsr_sebelum_4br
        }
        if let dsr_sebelum_4c = self.form.rowByTag("dsr_sebelum_4c")?.baseValue as? Bool
        {
            self.dsr_sebelum_4c = dsr_sebelum_4c
        }
        if let dsr_sebelum_4cr = self.form.rowByTag("dsr_sebelum_4cr")?.baseValue as? String
        {
            self.dsr_sebelum_4cr = dsr_sebelum_4cr
        }
        if let dsr_sebelum_4d = self.form.rowByTag("dsr_sebelum_4d")?.baseValue as? Bool
        {
            self.dsr_sebelum_4d = dsr_sebelum_4d
        }
        if let dsr_sebelum_4dr = self.form.rowByTag("dsr_sebelum_4dr")?.baseValue as? String
        {
            self.dsr_sebelum_4dr = dsr_sebelum_4dr
        }
        if let dsr_sebelum_4e = self.form.rowByTag("dsr_sebelum_4e")?.baseValue as? Bool
        {
            self.dsr_sebelum_4e = dsr_sebelum_4e
        }
        if let dsr_sebelum_4er = self.form.rowByTag("dsr_sebelum_4er")?.baseValue as? String
        {
            self.dsr_sebelum_4er = dsr_sebelum_4er
        }
        
        if let dsr_saat_1 = self.form.rowByTag("dsr_saat_1")?.baseValue as? Set<String>
        {
            self.dsr_saat_1 = dsr_saat_1
        }
        if let dsr_saat_2 = self.form.rowByTag("dsr_saat_2")?.baseValue as? Set<String>
        {
            self.dsr_saat_2 = dsr_saat_2
        }
        if let dsr_saat_3 = self.form.rowByTag("dsr_saat_3")?.baseValue as? Set<String>
        {
            self.dsr_saat_3 = dsr_saat_3
        }
        if let dsr_saat_4 = self.form.rowByTag("dsr_saat_4")?.baseValue as? Set<String>
        {
            self.dsr_saat_4 = dsr_saat_4
        }
        if let dsr_saat_5 = self.form.rowByTag("dsr_saat_5")?.baseValue as? Set<String>
        {
            self.dsr_saat_5 = dsr_saat_5
        }
        if let dsr_saat_6 = self.form.rowByTag("dsr_saat_6")?.baseValue as? Set<String>
        {
            self.dsr_saat_6 = dsr_saat_6
        }
        if let dsr_saat_7 = self.form.rowByTag("dsr_saat_7")?.baseValue as? Set<String>
        {
            self.dsr_saat_7 = dsr_saat_7
        }
        if let dsr_saat_8 = self.form.rowByTag("dsr_saat_8")?.baseValue as? Set<String>
        {
            self.dsr_saat_8 = dsr_saat_8
        }
        if let dsr_saat_9 = self.form.rowByTag("dsr_saat_9")?.baseValue as? Set<String>
        {
            self.dsr_saat_9 = dsr_saat_9
        }
        if let dsr_saat_10 = self.form.rowByTag("dsr_saat_10")?.baseValue as? Set<String>
        {
            self.dsr_saat_10 = dsr_saat_10
        }
        
        if let dsr_setelah_1 = self.form.rowByTag("dsr_setelah_1")?.baseValue as? Bool
        {
            self.dsr_setelah_1 = dsr_setelah_1
        }
        if let dsr_setelah_1r = self.form.rowByTag("dsr_setelah_1r")?.baseValue as? String
        {
            self.dsr_setelah_1r = dsr_setelah_1r
        }
        if let dsr_setelah_2 = self.form.rowByTag("dsr_setelah_2")?.baseValue as? Bool
        {
            self.dsr_setelah_2 = dsr_setelah_2
        }
        if let dsr_setelah_2r = self.form.rowByTag("dsr_setelah_2r")?.baseValue as? String
        {
            self.dsr_setelah_2r = dsr_setelah_2r
        }
        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        
        self.saveQuestionData("", questionID: "dsr_sebelum_1",textAnswer: self.dsr_sebelum_1r,tickAnswer: self.dsr_sebelum_1, id: csession)
        self.saveQuestionData("", questionID: "dsr_sebelum_2",textAnswer: self.dsr_sebelum_2r,tickAnswer: self.dsr_sebelum_2, id: csession)
        self.saveQuestionData("", questionID: "dsr_sebelum_3",textAnswer: self.dsr_sebelum_3r,tickAnswer: self.dsr_sebelum_3, id: csession)
        self.saveQuestionData("", questionID: "dsr_sebelum_4a",textAnswer: self.dsr_sebelum_4ar,tickAnswer: self.dsr_sebelum_4a, id: csession)
        self.saveQuestionData("", questionID: "dsr_sebelum_4b",textAnswer: self.dsr_sebelum_4br,tickAnswer: self.dsr_sebelum_4b, id: csession)
        self.saveQuestionData("", questionID: "dsr_sebelum_4c",textAnswer: self.dsr_sebelum_4cr,tickAnswer: self.dsr_sebelum_4c, id: csession)
        self.saveQuestionData("", questionID: "dsr_sebelum_4d",textAnswer: self.dsr_sebelum_4dr,tickAnswer: self.dsr_sebelum_4d, id: csession)
        self.saveQuestionData("", questionID: "dsr_sebelum_4e",textAnswer: self.dsr_sebelum_4er,tickAnswer: self.dsr_sebelum_4e, id: csession)
        
        for index in 1...10{
            if dsr_saat_1.contains("Customer ke-\(index)"){
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_1", textAnswer: "", tickAnswer: true, id: csession)
            }
            else{
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_1", textAnswer: "", tickAnswer: false, id: csession)
                
            }
        }
        for index in 1...10{
            if dsr_saat_2.contains("Customer ke-\(index)"){
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_2", textAnswer: "", tickAnswer: true, id: csession)
                
            }
            else{
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_2", textAnswer: "", tickAnswer: false, id: csession)
                
            }
        }
        for index in 1...10{
            if dsr_saat_3.contains("Customer ke-\(index)"){
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_3", textAnswer: "", tickAnswer: true, id: csession)
                
            }
            else{
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_3", textAnswer: "", tickAnswer: false, id: csession)
                
            }
        }
        for index in 1...10{
            if dsr_saat_4.contains("Customer ke-\(index)"){
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_4", textAnswer: "", tickAnswer: true, id: csession)
                
            }
            else{
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_4", textAnswer: "", tickAnswer: false, id: csession)
                
            }
        }
        for index in 1...10{
            if dsr_saat_5.contains("Customer ke-\(index)"){
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_5", textAnswer: "", tickAnswer: true, id: csession)
                
            }
            else{
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_5", textAnswer: "", tickAnswer: false, id: csession)
                
            }
        }
        for index in 1...10{
            if dsr_saat_6.contains("Customer ke-\(index)"){
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_6", textAnswer: "", tickAnswer: true, id: csession)
                
            }
            else{
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_6", textAnswer: "", tickAnswer: false, id: csession)
                
            }
        }
        for index in 1...10{
            if dsr_saat_7.contains("Customer ke-\(index)"){
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_7", textAnswer: "", tickAnswer: true, id: csession)
                
            }
            else{
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_7", textAnswer: "", tickAnswer: false, id: csession)
                
            }
        }
        for index in 1...10{
            if dsr_saat_8.contains("Customer ke-\(index)"){
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_8", textAnswer: "", tickAnswer: true, id: csession)
                
            }
            else{
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_8", textAnswer: "", tickAnswer: false, id: csession)
                
            }
        }
        for index in 1...10{
            if dsr_saat_9.contains("Customer ke-\(index)"){
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_9", textAnswer: "", tickAnswer: true, id: csession)
                
            }
            else{
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_9", textAnswer: "", tickAnswer: false, id: csession)
                
            }
        }
        for index in 1...10{
            if dsr_saat_10.contains("Customer ke-\(index)"){
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_10", textAnswer: "", tickAnswer: true, id: csession)
                
            }
            else{
                self.saveQuestionData("customer_\(index)", questionID: "dsr_saat_10", textAnswer: "", tickAnswer: false, id: csession)
                
            }
        }
        
        self.saveQuestionData("", questionID: "dsr_setelah_1", textAnswer: self.dsr_setelah_1r, tickAnswer: self.dsr_setelah_1, id: csession)
        
        self.saveQuestionData("", questionID: "dsr_setelah_2", textAnswer: self.dsr_setelah_2r, tickAnswer: self.dsr_setelah_2, id: csession)
        
        
        
        self.updateCoachingData(self.distributor, area: self.area, id: csession)
        
        self.performSegueWithIdentifier("dsrToSummary", sender: nil)
        
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

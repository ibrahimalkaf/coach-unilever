//
//  DSRComposer.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/27/16.
//  Copyright © 2016 baim. All rights reserved.
//

//
//  InvoiceComposer.swift
//  Print2PDF
//
//  Created by Gabriel Theodoropoulos on 23/06/16.
//  Copyright © 2016 Appcoda. All rights reserved.
//

import UIKit
import CoreData

class PDFFormComposer: NSObject {
    
    let pathToInvoiceDSRTemplate = NSBundle.mainBundle().pathForResource("dsr_template_revisi", ofType: "html")
     let pathToInvoiceFASATemplate = NSBundle.mainBundle().pathForResource("fasa_template_revisi", ofType: "html")
    
    //let pathToSingleItemHTMLTemplate = NSBundle.mainBundle().pathForResource("single_item", ofType: "html")
    
    //let pathToLastItemHTMLTemplate = NSBundle.mainBundle().pathForResource("last_item", ofType: "html")
    
    let senderInfo = "Gabriel Theodoropoulos<br>123 Somewhere Str.<br>10000 - MyCity<br>MyCountry"
    
    let dueDate = ""
    
    let paymentMethod = "Wire Transfer"
    
    let logoImageURL = "http://www.appcoda.com/wp-content/uploads/2015/12/blog-logo-dark-400.png"
    
    var invoiceNumber: String!
    
    var pdfFilename: String!
    
    
    override init() {
        super.init()
    }
    
    
    func renderDSRForm(invoiceNumber: String, invoiceDate: String, recipientInfo: String, items: [[String: String]], totalAmount: String) -> String! {
        // Store the invoice number for future use.
        self.invoiceNumber = invoiceNumber
        
        do {
            // Load the invoice HTML template code into a String variable.
            var HTMLContent = try String(contentsOfFile: pathToInvoiceDSRTemplate!)
            
            // Replace all the placeholders with real values except for the items.
            // The logo image.
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#", withString: "")
            
            
            // Invoice number.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#INVOICE_NUMBER#", withString: invoiceNumber)
            
            // Invoice date.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#INVOICE_DATE#", withString: invoiceDate)
            
            // Due date (we leave it blank by default).
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#DUE_DATE#", withString: dueDate)
            
            // Sender info.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#SENDER_INFO#", withString: senderInfo)
            
            // Recipient info.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#RECIPIENT_INFO#", withString: recipientInfo.stringByReplacingOccurrencesOfString("\n", withString: "<br>"))
            
            // Payment method.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#PAYMENT_METHOD#", withString: paymentMethod)
            
            // Total amount.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#TOTAL_AMOUNT#", withString: totalAmount)
            
            // The invoice items will be added by using a loop.
            //var allItems = ""
            
            // For all the items except for the last one we'll use the "single_item.html" template.
            // For the last one we'll use the "last_item.html" template.
            //for i in 0..<items.count {
            //    var itemHTMLContent: String!
                
                // Determine the proper template file.
                /*
                if i != items.count - 1 {
                    itemHTMLContent = try String(contentsOfFile: pathToSingleItemHTMLTemplate!)
                }
                else {
                    itemHTMLContent = try String(contentsOfFile: pathToLastItemHTMLTemplate!)
                }*/
                
                // Replace the description and price placeholders with the actual values.
                //itemHTMLContent = itemHTMLContent.stringByReplacingOccurrencesOfString("#ITEM_DESC#", withString: items[i]["item"]!)
                
                // Format each item's price as a currency value.
                //let formattedPrice = AppDelegate.getAppDelegate().getStringValueFormattedAsCurrency(items[i]["price"]!)
                //itemHTMLContent = itemHTMLContent.stringByReplacingOccurrencesOfString("#PRICE#", withString: formattedPrice)
                
                // Add the item's HTML code to the general items string.
                //allItems += itemHTMLContent
            //}
            
            // Set the items.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#ITEMS#", withString: allItems)
            
            // The HTML code is ready.
            return HTMLContent
            
        }
        catch {
            print("Unable to open and use HTML template files.")
        }
        
        return nil
    }
    
    func renderDSR(date:String, coachee:String, csession:String) -> String! {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        fetchRequest.predicate = NSPredicate(format: "id = %@", csession)
        
        do {
            
            // Load the invoice HTML template code into a String variable.
            var HTMLContent = try String(contentsOfFile: pathToInvoiceDSRTemplate!)
            // loaddata
            let result = try managedContext.executeFetchRequest(fetchRequest)
            
            //nama coach
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#COACHNAME#", withString: NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachname) as! String)
            
            //nama coachee
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#COACHEENAME#", withString: coachee)
            
            //tanggal
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#DATE#", withString: date)
            
         
            for i in 1...result.count {
                
                let qasession = result[i-1] as! NSManagedObject
                
                if let columnID = qasession.valueForKey("columnID"),
                    let questionID = qasession.valueForKey("questionID"),
                    let textAnswer = qasession.valueForKey("textAnswer"),
                    let tickAnswer = qasession.valueForKey("tickAnswer")
                {
                    
                    let question1 = QuestionObject(columnID: columnID as! String, questionID: questionID as! String, textAnswer: textAnswer as! String, tickAnswer: tickAnswer as! Bool)
                    
                    if question1.columnID.containsString("customer"){
                        
                        var tick = "Tidak"
                        if (question1.tickAnswer == true){
                            tick = "Ya"
                        }
                        
                        let varid = question1.questionID + question1.columnID.stringByReplacingOccurrencesOfString("customer", withString: "")
                        HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#\(varid)#", withString: tick)
                        
                    }
                    else if question1.questionID.containsString("summary"){
                        HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#\(question1.questionID)#", withString: String(question1.textAnswer))
                    }
                    else{
                        
                        var tick = "Tidak"
                        if (question1.tickAnswer == true){
                            tick = "Ya"
                        }

                        
                    HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#\(question1.questionID)#", withString: tick)
                    HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#\(question1.questionID)r#", withString: question1.textAnswer)
                    }
                    
                    
                }
            }
            
            return HTMLContent
            
        }
        catch {
            print("Unable to open and use HTML template files.")
        }
        
        return nil
    }
    
    func renderFASA(date:String, coachee:String, csession:String) -> String!  {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "CoachingQuestionAnswer")
        fetchRequest.predicate = NSPredicate(format: "id = %@", csession)

        do {
            // Load the invoice HTML template code into a String variable.
            var HTMLContent = try String(contentsOfFile: pathToInvoiceFASATemplate!)
            let result = try managedContext.executeFetchRequest(fetchRequest)
            
            //nama coach
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#COACH#", withString: NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachname) as! String)
            
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#COACHEE#", withString: coachee)
            
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#STORE#", withString: NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.store) as! String)
            
            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#TANGGAL#", withString: date)
            
            print("jumlah:",result.count)
            
            for i in 1...result.count {
                
                let qasession = result[i-1] as! NSManagedObject
                
                if let columnID = qasession.valueForKey("columnID"),
                    let questionID = qasession.valueForKey("questionID"),
                    let textAnswer = qasession.valueForKey("textAnswer"),
                    let tickAnswer = qasession.valueForKey("tickAnswer")
                {
                    let question = QuestionObject(columnID: columnID as! String, questionID: questionID as! String, textAnswer: textAnswer as! String, tickAnswer: tickAnswer as! Bool)
                    
                    if question.columnID.containsString("Produk A"){
                        print("ada produk A")
                        if question.textAnswer != ""{
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#A_\(question.questionID)#", withString: String(question.textAnswer))
                        }
                        else{
                            var tik = "Tidak"
                            if question.tickAnswer == true{
                                tik = "Ya"
                            }
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#A_\(question.questionID)#", withString: tik)
                        }
                    }
                    if question.columnID.containsString("Produk B"){
                        if question.textAnswer != ""{
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#B_\(question.questionID)#", withString: String(question.textAnswer))
                        }
                        else{
                            var tik = "Tidak"
                            if question.tickAnswer == true{
                                tik = "Ya"
                            }
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#B_\(question.questionID)#", withString: tik)
                        }
                    }
                    if question.columnID.containsString("Produk C"){
                        if question.textAnswer != ""{
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#C_\(question.questionID)#", withString: String(question.textAnswer))
                        }
                        else{
                            var tik = "Tidak"
                            if question.tickAnswer == true{
                                tik = "Ya"
                            }
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#C_\(question.questionID)#", withString: tik)
                        }
                    }
                    if question.columnID.containsString("Produk D"){
                        if question.textAnswer != ""{
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#D_\(question.questionID)#", withString: String(question.textAnswer))
                        }
                        else{
                            var tik = "Tidak"
                            if question.tickAnswer == true{
                                tik = "Ya"
                            }
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#D_\(question.questionID)#", withString: tik)
                        }
                    }
                    if question.columnID.containsString("Produk E"){
                        if question.textAnswer != ""{
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#E_\(question.questionID)#", withString: String(question.textAnswer))
                        }
                        else{
                            var tik = "Tidak"
                            if question.tickAnswer == true{
                                tik = "Ya"
                            }
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#E_\(question.questionID)#", withString: tik)
                        }
                    }
                    if question.columnID.containsString("Produk F"){
                        if question.textAnswer != ""{
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#F_\(question.questionID)#", withString: String(question.textAnswer))
                        }
                        else{
                            var tik = "Tidak"
                            if question.tickAnswer == true{
                                tik = "Ya"
                            }
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#F_\(question.questionID)#", withString: tik)
                        }
                    }
                    if question.columnID.containsString("Produk G"){
                        if question.textAnswer != ""{
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#G_\(question.questionID)#", withString: String(question.textAnswer))
                        }
                        else{
                            var tik = "Tidak"
                            if question.tickAnswer == true{
                                tik = "Ya"
                            }
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#G_\(question.questionID)#", withString: tik)
                        }
                    }
                    if question.columnID.containsString("Produk H"){
                        if question.textAnswer != ""{
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#H_\(question.questionID)#", withString: String(question.textAnswer))
                        }
                        else{
                            var tik = "Tidak"
                            if question.tickAnswer == true{
                                tik = "Ya"
                            }
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#H_\(question.questionID)#", withString: tik)
                        }
                    }
                    if question.columnID.containsString("Produk I"){
                        if question.textAnswer != ""{
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#I_\(question.questionID)#", withString: String(question.textAnswer))
                        }
                        else{
                            var tik = "Tidak"
                            if question.tickAnswer == true{
                                tik = "Ya"
                            }
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#I_\(question.questionID)#", withString: tik)
                        }
                    }
                    if question.columnID.containsString("Produk J"){
                        if question.textAnswer != ""{
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#J_\(question.questionID)#", withString: String(question.textAnswer))
                        }
                        else{
                            var tik = "Tidak"
                            if question.tickAnswer == true{
                                tik = "Ya"
                            }
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#J_\(question.questionID)#", withString: tik)
                        }
                    }
                    if question.columnID.containsString("Add 1"){
                        if question.textAnswer != ""{
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#1_\(question.questionID)#", withString: String(question.textAnswer))
                        }
                        else{
                            var tik = "Tidak"
                            if question.tickAnswer == true{
                                tik = "Ya"
                            }
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#1_\(question.questionID)#", withString: tik)
                        }
                    }
                    if question.columnID.containsString("Add 2"){
                        if question.textAnswer != ""{
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#2_\(question.questionID)#", withString: String(question.textAnswer))
                        }
                        else{
                            var tik = "Tidak"
                            if question.tickAnswer == true{
                                tik = "Ya"
                            }
                            HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#2_\(question.questionID)#", withString: tik)
                        }
                    }
                }
            }
            
            let regex = try! NSRegularExpression(pattern: "#.+#",
                                                 options: NSRegularExpressionOptions.CaseInsensitive)
            let range = NSMakeRange(0, HTMLContent.characters.count)
            HTMLContent = regex.stringByReplacingMatchesInString(HTMLContent,
                                                                   options: [],
                                                                   range: range,
                                                                   withTemplate: "")
            
            
            return HTMLContent
            
        }
        catch {
            print("Unable to open and use HTML template files.")
        }
        
        return nil
    }
    
    
    func renderFASAForm(invoiceNumber: String, invoiceDate: String, recipientInfo: String, items: [[String: String]], totalAmount: String) -> String! {
        // Store the invoice number for future use.
        self.invoiceNumber = invoiceNumber
        
        do {
            // Load the invoice HTML template code into a String variable.
            var HTMLContent = try String(contentsOfFile: pathToInvoiceFASATemplate!)
            
            // Replace all the placeholders with real values except for the items.
            // The logo image.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#", withString: "")
            
            
            // Invoice number.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#INVOICE_NUMBER#", withString: invoiceNumber)
            
            // Invoice date.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#INVOICE_DATE#", withString: invoiceDate)
            
            // Due date (we leave it blank by default).
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#DUE_DATE#", withString: dueDate)
            
            // Sender info.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#SENDER_INFO#", withString: senderInfo)
            
            // Recipient info.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#RECIPIENT_INFO#", withString: recipientInfo.stringByReplacingOccurrencesOfString("\n", withString: "<br>"))
            
            // Payment method.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#PAYMENT_METHOD#", withString: paymentMethod)
            
            // Total amount.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#TOTAL_AMOUNT#", withString: totalAmount)
            
            // The invoice items will be added by using a loop.
            //var allItems = ""
            
            // For all the items except for the last one we'll use the "single_item.html" template.
            // For the last one we'll use the "last_item.html" template.
            //for i in 0..<items.count {
              //  var itemHTMLContent: String!
                
                // Determine the proper template file.
                /*
                if i != items.count - 1 {
                    itemHTMLContent = try String(contentsOfFile: pathToSingleItemHTMLTemplate!)
                }
                else {
                    itemHTMLContent = try String(contentsOfFile: pathToLastItemHTMLTemplate!)
                }*/
                
                // Replace the description and price placeholders with the actual values.
                //itemHTMLContent = itemHTMLContent.stringByReplacingOccurrencesOfString("#ITEM_DESC#", withString: items[i]["item"]!)
                
                // Format each item's price as a currency value.
                //let formattedPrice = AppDelegate.getAppDelegate().getStringValueFormattedAsCurrency(items[i]["price"]!)
                //itemHTMLContent = itemHTMLContent.stringByReplacingOccurrencesOfString("#PRICE#", withString: formattedPrice)
                
                // Add the item's HTML code to the general items string.
                //allItems += itemHTMLContent
            //}
            
            // Set the items.
            //HTMLContent = HTMLContent.stringByReplacingOccurrencesOfString("#ITEMS#", withString: allItems)
            
            // The HTML code is ready.
            return HTMLContent
            
        }
        catch {
            print("Unable to open and use HTML template files.")
        }
        
        return nil
    }
    
    
    func exportHTMLContentToPDF(HTMLContent: String) {
        let printPageRenderer = DSRPrintPageRenderer()
        
        let printFormatter = UIMarkupTextPrintFormatter(markupText: HTMLContent)
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAtIndex: 0)
        
        let pdfData = drawPDFUsingPrintPageRenderer(printPageRenderer)
        
        pdfFilename = "\(AppDelegate.getAppDelegate().getDocDir())/Report\(invoiceNumber).pdf"
        pdfData.writeToFile(pdfFilename, atomically: true)
        
        print(pdfFilename)
    }
    
    func exportHTMLContentToPDF(HTMLContent: String, filename:String) {
        let printPageRenderer = DSRPrintPageRenderer()
        
        let printFormatter = UIMarkupTextPrintFormatter(markupText: HTMLContent)
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAtIndex: 0)
        
        let pdfData = drawPDFUsingPrintPageRenderer(printPageRenderer)
        
        pdfFilename = "\(AppDelegate.getAppDelegate().getDocDir())/Report_\(filename).pdf"
        pdfData.writeToFile(pdfFilename, atomically: true)
        
        print(pdfFilename)
    }

    
    
    func drawPDFUsingPrintPageRenderer(printPageRenderer: UIPrintPageRenderer) -> NSData! {
        let data = NSMutableData()
        
        UIGraphicsBeginPDFContextToData(data, CGRectZero, nil)
        
        UIGraphicsBeginPDFPage()
        
        printPageRenderer.drawPageAtIndex(0, inRect: UIGraphicsGetPDFContextBounds())
        
        UIGraphicsEndPDFContext()
        
        return data
    }
    
}


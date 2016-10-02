//
//  PreviewDSRPDF.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/27/16.
//  Copyright © 2016 baim. All rights reserved.
//

import UIKit
import MessageUI


class DSRPDF: UIViewController {
    
    @IBOutlet var webPreview2: UIWebView!
    @IBOutlet var webPreview: UIWebView!

    var invoiceInfo: [String: AnyObject]!
    
    var invoiceComposer: PDFFormComposer!
    
    var HTMLContent: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //createFASAAsHTML()
        createDSRAsHTML()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: IBAction Methods
    
    @IBAction func export(sender: AnyObject) {
        invoiceComposer.exportHTMLContentToPDF(HTMLContent)
        showOptionsAlert()
    }
    
    // MARK: Custom Methods
    
    func createFASAAsHTML() {
        invoiceComposer = PDFFormComposer()
        if let invoiceHTML = invoiceComposer.renderFASAForm("FASA",
                                                           invoiceDate: "1 Januari",
                                                           recipientInfo: "penerima",
                                                           items: [["aaa": "2000"]],
                                                           totalAmount: "2000") {
            
            webPreview.loadHTMLString(invoiceHTML, baseURL: NSURL(string: invoiceComposer.pathToInvoiceFASATemplate!))
            HTMLContent = invoiceHTML
        }
    }
    
    func createDSRAsHTML() {
        invoiceComposer = PDFFormComposer()
        
        if let invoiceHTML = invoiceComposer.renderDSR("10-2-12", coachee: "otong", csession: "-KRRNFL3VlQ3xBO0zQ3J") {
            
            HTMLContent = invoiceHTML
        }

        
        /*
        if let invoiceHTML = invoiceComposer.renderDSRForm("DSR",
                                                            invoiceDate: "1 Januari",
                                                            recipientInfo: "penerima",
                                                            items: [["aaa": "2000"]],
                                                            totalAmount: "2000") {
            
            //webPreview2.loadHTMLString(invoiceHTML, baseURL: NSURL(string: invoiceComposer.pathToInvoiceDSRTemplate!)!)
            HTMLContent = invoiceHTML
        }*/
    }
    
    
    
    func showOptionsAlert() {
        let alertController = UIAlertController(title: "Yeah!", message: "Your invoice has been successfully printed to a PDF file.\n\nWhat do you want to do now?", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionPreview = UIAlertAction(title: "Preview it", style: UIAlertActionStyle.Default) { (action) in
            let request = NSURLRequest(URL: NSURL(string: self.invoiceComposer.pdfFilename)!)
            self.webPreview2.loadRequest(request)
        }
        
        let actionEmail = UIAlertAction(title: "Send by Email", style: UIAlertActionStyle.Default) { (action) in
            dispatch_async(dispatch_get_main_queue(), {
                self.sendEmail()
            })
        }
        
        let actionNothing = UIAlertAction(title: "Nothing", style: UIAlertActionStyle.Default) { (action) in
            
        }
        
        alertController.addAction(actionPreview)
        alertController.addAction(actionEmail)
        alertController.addAction(actionNothing)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = MFMailComposeViewController()
            mailComposeViewController.setSubject("DSR Report")
            mailComposeViewController.addAttachmentData(NSData(contentsOfFile: invoiceComposer.pdfFilename)!, mimeType: "application/pdf", fileName: "DSR")
            presentViewController(mailComposeViewController, animated: true, completion: nil)
        }
    }
    
}
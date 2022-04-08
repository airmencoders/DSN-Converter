//
//  ReportViewController.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
// Reports to Google Sheets when users submit a DSN Conversion. 

import UIKit
import NotificationBannerSwift



class ReportViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate  {

    // Google Forms Variables
    var googleFormLink:String!
    var googleName :String!
    var googleEmail :String!
    var googleComments : String!
    var googleCommercial : String!
    var googleDSNvar : String!
    var googleLocationvar : String!
 

    
    @IBOutlet weak var commentText: DesignableTextField!
    
    // Ids
    var googleNameids = "entry_1679637001"
    var googleEmailids = "entry_1756892779"
    var googleCommentsids = "entry_818610863"
    var googleCommercialids = "entry_484636668"
    var googleDSNids = "entry_428445608"
    var googleLocationids = "entry_1056081706"
    
    @IBOutlet weak var commTxt: UITextField!
    @IBOutlet weak var dsnTxt: UITextField!
    @IBOutlet weak var locTxt: UITextField!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        commTxt.text = dnsCommercialGlobal
//        dsnTxt.text = dsnPhoneGlobal
//        locTxt.text = dsnLocationGlobal
        
//
        commentText.delegate = self
    }
    

   

    @IBAction func Exit(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func SendReport(_ sender: Any) {
        
        print("Press")
        
        WriteToGoogle ()
        
        
    }
    
    func setupOnlineLogs(formLink: String,nameField: String,emailField: String, commentsField: String, commercialField: String, dsnField: String, locationField: String ) {
        
        googleFormLink = formLink
        googleName = nameField
        googleEmail = emailField
        googleComments = commentsField
        googleCommercial = commercialField
        googleDSNvar = dsnField
        googleLocationvar = locationField
        
    }
    
    
    func WriteToGoogle () {
        setupOnlineLogs(formLink: "https://docs.google.com/forms/d/e/1FAIpQLSccRuoqnXK6EKfLSsUYHrQnN1OGsJTZ9LLuIClCrQ4pOgxQRg/formResponse", nameField: googleNameids ,emailField: googleEmailids,
                        commentsField:  googleCommentsids , commercialField: googleCommercialids , dsnField: googleDSNids, locationField: googleLocationids)
        
        
        let url = URL(string: googleFormLink)
        
        var postData = googleComments + "=" + "\(commentText.text!)"
        postData += "&" + googleCommercial + "=" + "\(commTxt.text!)"
        postData += "&" + googleDSNvar + "=" + "\(dsnTxt.text!)"
        postData += "&" + googleLocationvar + "=" + "\(locTxt.text!)"
        
        
        print(googleCommercial)
        //print(googleLocation)
        print(googleComments)
        //postData += "&" + googleDSN + "=" + "\(dnsCommercialGlobal)"
      //  postData += "&" + googleLocation + "=" + "\(dnsCommercialGlobal)"
        
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = postData.data(using: String.Encoding.utf8)
        
        #if os(OSX)
        if kCFCoreFoundationVersionNumber > kCFCoreFoundationVersionNumber10_10 {
            Foundation.URLSession.shared.dataTask(with: request).resume()
        } else {
            NSURLConnection(request: request, delegate: nil)?.start()
        }
        #elseif os(iOS)
        URLSession.shared.dataTask(with: request).resume()
        #endif
        
        let leftView = UIImageView(image: #imageLiteral(resourceName: "Contacts") )
        let banner = NotificationBanner(title: "DSN Converter", subtitle: "Your correction has been submitted.", leftView: leftView, style: .success)
        banner.show()
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        
        return true
    }
}

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
    var googleDSN : String!
    var googleLocationvar : String!
    
    @IBOutlet weak var errorPrefixLbl: UILabel!
    @IBOutlet weak var errorCommericalLbl: UILabel!
    @IBOutlet weak var errorLocationLbl: UILabel!
    
    
    
    // Ids
    var googleDSNids = "entry.1211320378"
    var googleCommercialids = "entry.972115246"
    var googleLocationids = "entry.999748559"
    var googleNameids = "entry.559878369"
    var googleEmailids = "entry.742138175"
    var googleCommentsids = "entry.360868702"
    
    
    
    
    @IBOutlet weak var commTxt: UITextField!
    @IBOutlet weak var dsnTxt: UITextField!
    @IBOutlet weak var locTxt: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var commentText: DesignableTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        commentText.delegate = self
        commTxt.delegate = self
        locTxt.delegate = self
        nameText.delegate = self
        emailTxt.delegate = self
        
        
    }
    @IBAction func Exit(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func SendReport(_ sender: Any) {
        WriteToGoogle ()
    }
    
    func setupOnlineLogs(formLink: String,nameField: String,emailField: String, commentsField: String, commercialField: String, dsnField: String, locationField: String ) {
        googleFormLink = formLink
        googleDSN = dsnField
        googleCommercial = commercialField
        googleLocationvar = locationField
        googleName = nameField
        googleEmail = emailField
        googleComments = commentsField
    }
    
    @IBAction func dsnPrefixTxt(_ sender: Any) {
        if dsnTxt.text == "" {
            let leftView = UIImageView(image: #imageLiteral(resourceName: "Contacts") )
            let banner = NotificationBanner(title: "DSN Converter", subtitle: "Please enter a valid Prefix (Ex: 480)", leftView: leftView, style: .danger)
            banner.show()
            errorPrefixLbl.isHidden = false
            
            errorPrefixLbl.text = "Enter a valid Prefix"
        }else {
            errorPrefixLbl.isHidden = true
        }
    }
    @IBAction func CommericalTxt(_ sender: Any) {
        if commTxt.text == "" {
            let leftView = UIImageView(image: #imageLiteral(resourceName: "Contacts") )
            let banner = NotificationBanner(title: "DSN Converter", subtitle: "Please enter a valid Conversion (Ex: 06371 47xxxx).", leftView: leftView, style: .danger)
            banner.show()
            errorCommericalLbl.isHidden = false
            errorCommericalLbl.text = "Enter a valid conversion"
        }else {
            errorCommericalLbl.isHidden = true
        }
    }
    @IBAction func LocationTxt(_ sender: Any) {
        if locTxt.text == "" {
            
            let leftView = UIImageView(image: #imageLiteral(resourceName: "Contacts") )
            let banner = NotificationBanner(title: "DSN Converter", subtitle: "Please enter a valid location (Ex: Ramstein AB).", leftView: leftView, style: .danger)
            banner.show()
            errorLocationLbl.isHidden = false
            errorLocationLbl.text = "Enter a valid location"
        }else {
            errorLocationLbl.isHidden = true
        }
    }
    func WriteToGoogle () {
        
        if dsnTxt.text == "" || commentText.text == "" || locTxt.text == "" {
            let leftView = UIImageView(image: #imageLiteral(resourceName: "phone-call-3") )
            let banner = NotificationBanner(title: "DSN Converter", subtitle: "Make sure all fields are completed.", leftView: leftView, style: .danger)
            banner.show()
            errorPrefixLbl.isHidden = false
            errorPrefixLbl.text = "Enter a valid Prefix"
            errorCommericalLbl.isHidden = false
            errorCommericalLbl.text = "Enter a valid conversion"
            errorLocationLbl.isHidden = false
            errorLocationLbl.text = "Enter a valid location"
            
            
        }else {
            
            errorPrefixLbl.isHidden = false
            errorCommericalLbl.isHidden = false
            errorLocationLbl.isHidden = false
            setupOnlineLogs(formLink: "https://docs.google.com/forms/d/e/1FAIpQLSciTZOi17dVqPMHf1i1THYva7LnHyUmU9BWHMOWFo62cpQjzQ/formResponse",
                            nameField: googleNameids,
                            emailField: googleEmailids,
                            commentsField: googleCommentsids,
                            commercialField: googleCommercialids,
                            dsnField: googleDSNids,
                            locationField: googleLocationids)
            
            
            let url = URL(string: googleFormLink)
            print("DSN:\(googleComments!)")
            var  postData =  googleDSN + "=" + "\(dsnTxt.text!)"
            postData += "&" + googleCommercial + "=" + "\(commTxt.text!)"
            postData += "&" + googleLocationvar + "=" + "\(locTxt.text!)"
            postData += "&" + googleName + "=" + "\(nameText.text!)"
            postData += "&" + googleEmail + "=" + "\(emailTxt.text!)"
            postData += "&" + googleComments + "=" + "\(commentText.text!)"
            
            
            
            
            
            
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
        
    }
    @IBAction func DoneEditing(_ sender: Any) {
        print("touched")
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        
        return true
    }
}

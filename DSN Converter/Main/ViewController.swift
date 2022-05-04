//
//  ViewController.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
// Test
// Main View


import UIKit
import PMAlertController
import CoreData
import ContactsUI
import CoreTelephony

// Global Variables
var dnsCommercialGlobal = " "
var dnsCommercialGlobalNoLbl = " "
var dsnPhoneGlobal = " "
var dsnLocationGlobal = " "
var dsnTimeGlobal = " "
var dsnDateGlobal = " "
var timedTapped = 0
var timedTappedMax = 5

class ViewController: UIViewController,CNContactViewControllerDelegate{
    //Variables
    var getDsnNumber = ""

    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Display background color depeding what is saved in value
        if let value = UserDefaults.standard.value(forKey: "dsnService"){
            if  0 == value as! Int {
                self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
            }else if 1 == value as! Int{
                self.view.backgroundColor = #colorLiteral(red: 0.1572559077, green: 0.4129788669, blue: 0.1819413052, alpha: 1)
            }else if 2 == value as! Int{
                self.view.backgroundColor = #colorLiteral(red: 0.1620297223, green: 0.4949354393, blue: 0.7333416692, alpha: 1)

            }
        }else {
            performSegue(withIdentifier: "OnBoardSegue", sender: nil)
        }
        //Time Tapped
        if let value = UserDefaults.standard.value(forKey: "TimeTapped"){
            timedTapped = value as! Int
            print("ViewDidLoad Time Tapped\(timedTapped)")
        }
        let dialView: BMDialViewOrg = BMDialViewOrg()
        dialView.setupDialPad(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.view.addSubview(dialView)
        dialView.callTapped = { number in
            print(number)
            //Gets the DsnNumber from number
            self.getDsnNumber = number
            
            if self.getDsnNumber.count == 0 {
                
            } else if self.getDsnNumber.count != 8 {
                print("ERRORRRR")
                let alertVC = PMAlertController(title: "DSN Converter", description: "The provided DSN: \(self.getDsnNumber) is incorrect.\n Make sure you are using the correct format.\n E.g: 4801234 ", image: UIImage(named: "img.png"), style: .alert)
                alertVC.addAction(PMAlertAction(title: "Dismiss", style: .cancel, action: { () -> Void in
                }))
                self.present(alertVC, animated: true, completion: nil)
            }else {
                dsnPhoneGlobal = self.getDsnNumber
                self.performSegue(withIdentifier: "PhoneSegue", sender: nil)
            }
        }
    }
    //MARK: ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {

        if let value = UserDefaults.standard.value(forKey: "dsnService"){
            if  0 == value as! Int {
                self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
            }else if 1 == value as! Int{
                self.view.backgroundColor = #colorLiteral(red: 0.1572559077, green: 0.4129788669, blue: 0.1819413052, alpha: 1)
            }else if 2 == value as! Int{
                self.view.backgroundColor = #colorLiteral(red: 0.1620297223, green: 0.4949354393, blue: 0.7333416692, alpha: 1)
            }
        }else {
            performSegue(withIdentifier: "OnBoardSegue", sender: nil)
        }
    }
}


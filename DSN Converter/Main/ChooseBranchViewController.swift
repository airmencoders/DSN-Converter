//
//  ChooseBranchViewController.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
//


import UIKit
import PMAlertController
import NotificationBannerSwift
class ChooseBranchViewController: UIViewController {

    
    @IBOutlet weak var dsnServicesSeg: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

//        if let value = UserDefaults.standard.value(forKey: "dsnService"){
//
//            if  0 == value as! Int {
//
//                self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
//                dsnServicesSeg.selectedSegmentIndex = value as! Int
//                
//
//            }else if 1 == value as! Int{
//                self.view.backgroundColor = #colorLiteral(red: 0.1572559077, green: 0.4129788669, blue: 0.1819413052, alpha: 1)
//                dsnServicesSeg.selectedSegmentIndex = value as! Int
//
//            }else if 2 == value as! Int{
//
//                self.view.backgroundColor = #colorLiteral(red: 0.1620297223, green: 0.4949354393, blue: 0.7333416692, alpha: 1)
//                dsnServicesSeg.selectedSegmentIndex = value as! Int
//            }
//
//        }else {
//            UserDefaults.standard.set(0, forKey: "dsnService")
//            self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
//
//        }
//
//
//
        
        
    }

    @IBAction func Done(_ sender: Any) {
        UserDefaults.standard.set("Accept", forKey: "dsnService")
        performSegue(withIdentifier: "MainSegue", sender: nil)
}

}

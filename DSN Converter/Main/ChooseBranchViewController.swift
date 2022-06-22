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

        // Do any additional setup after loading the view.
        





        if let value = UserDefaults.standard.value(forKey: "dsnService"){
            
            if  0 == value as! Int {
                
                self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
                dsnServicesSeg.selectedSegmentIndex = value as! Int
                
                
            }else if 1 == value as! Int{
                self.view.backgroundColor = #colorLiteral(red: 0.1572559077, green: 0.4129788669, blue: 0.1819413052, alpha: 1)
                dsnServicesSeg.selectedSegmentIndex = value as! Int
                
            }else if 2 == value as! Int{
                
                self.view.backgroundColor = #colorLiteral(red: 0.1620297223, green: 0.4949354393, blue: 0.7333416692, alpha: 1)
                dsnServicesSeg.selectedSegmentIndex = value as! Int
            }
            
        }else {
            UserDefaults.standard.set(0, forKey: "dsnService")
            self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)

        }
        
        
        
        
        
    }
    
    
    @IBAction func DSNServiceSegAction(_ sender: Any) {
        if dsnServicesSeg.selectedSegmentIndex == 0 {
            //Air Force
            UserDefaults.standard.set(0, forKey: "dsnService")
            self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
        }else if dsnServicesSeg.selectedSegmentIndex == 1 {
            UserDefaults.standard.set(1, forKey: "dsnService")
            self.view.backgroundColor = #colorLiteral(red: 0.1572559077, green: 0.4129788669, blue: 0.1819413052, alpha: 1)
        }else if dsnServicesSeg.selectedSegmentIndex == 2 {
            UserDefaults.standard.set(2, forKey: "dsnService")
            self.view.backgroundColor = #colorLiteral(red: 0.1620297223, green: 0.4949354393, blue: 0.7333416692, alpha: 1)
        }
    }
    
    @IBAction func AFBtn(_ sender: Any) {
        
//
        self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
        
         UserDefaults.standard.set("AirForce", forKey: "dsnService")
        
    }
    @IBAction func ArmyBtn(_ sender: Any) {
         self.view.backgroundColor = #colorLiteral(red: 0.1572559077, green: 0.4129788669, blue: 0.1819413052, alpha: 1)
//
          UserDefaults.standard.set("Army", forKey: "dsnService")
    }
    
    @IBAction func NavyBtn(_ sender: Any) {
        self.view.backgroundColor = #colorLiteral(red: 0.1620297223, green: 0.4949354393, blue: 0.7333416692, alpha: 1)
//    
          UserDefaults.standard.set("Navy", forKey: "dsnService")
    }

    
    
    
    @IBAction func Done(_ sender: Any) {
        
        if dsnServicesSeg.selectedSegmentIndex == 0 {
                performSegue(withIdentifier: "MainSegue", sender: nil)
            
        }else if dsnServicesSeg.selectedSegmentIndex == 1 {
            performSegue(withIdentifier: "MainSegue", sender: nil)
         
        }else if dsnServicesSeg.selectedSegmentIndex == 2 {
            performSegue(withIdentifier: "MainSegue", sender: nil)
            
        }else {
            
            //Notification
            let leftView = UIImageView(image: #imageLiteral(resourceName: "phone-call-3") )
            let banner = NotificationBanner(title: "DSN Converter", subtitle: "Please select a color to continue", leftView: leftView, style: .danger)
            banner.show()
            
        }
        
        
        
        
        
    }
    
}

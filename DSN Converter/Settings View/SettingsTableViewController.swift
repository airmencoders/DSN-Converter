//
//  SettingsTableViewController.swift
//  DSN Converter
//
//  Created by Mac Fusion on 11/23/18.
//  Copyright © 2018 ForceMobileStudios. All rights reserved.
//

import UIKit
import StoreKit
class SettingsTableViewController: UITableViewController {
  @IBOutlet var tableview: UITableView!



    override func viewDidLoad() {
        super.viewDidLoad()

        if let value = UserDefaults.standard.value(forKey: "dsnService"){
            
            if  0 == value as! Int {
                
                //backgroundImg.image = UIImage(named:"aircraft.png")
                self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
                self.tableview.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
                
                
            }else if 1 == value as! Int{
                self.view.backgroundColor = #colorLiteral(red: 0.1572559077, green: 0.4129788669, blue: 0.1819413052, alpha: 1)
                 self.tableview.backgroundColor = #colorLiteral(red: 0.1572559077, green: 0.4129788669, blue: 0.1819413052, alpha: 1)
              //  backgroundImg.image = UIImage(named:"jeep.png")
                
                
            }else if 2 == value as! Int{
                
                self.view.backgroundColor = #colorLiteral(red: 0.1620297223, green: 0.4949354393, blue: 0.7333416692, alpha: 1)
                 self.tableview.backgroundColor = #colorLiteral(red: 0.1620297223, green: 0.4949354393, blue: 0.7333416692, alpha: 1)             //  backgroundImg.image = UIImage(named:"submarine.png")
            }
            
        }
        
        
    }
  
    
    
   
    @IBAction func About(_ sender: Any) {
        if let url = URL(string: "http://forcemobilestudios.com/page9.html") {
            UIApplication.shared.open(url, options: [:])
        }
        
    }
    
    @IBAction func copyRights(_ sender: Any) {
        if let url = URL(string: "http://forcemobilestudios.com/page9.html") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func Facebook(_ sender: Any) {
        if let url = URL(string: "https://www.facebook.com/forcemobilestudios") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    @IBAction func Website(_ sender: Any) {
        if let url = URL(string: "https://forcemobilestudios.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    @IBAction func Review(_ sender: Any) {
        if #available( iOS 10.3,*){
            SKStoreReviewController.requestReview()
        }
        
    }
    
    //Need to work on it
    
    @IBAction func Share(_ sender: Any) {
        
        //Share
        
        let Text = "You should try DSN Europe.\n Download it on the App Store Now\n https://itunes.apple.com/tt/app/dsn-converter-europe/id1442345746?mt=8&ign-mpt=uo%3D2"
        // let ActualNumber = "\(self.departmentsPhone[indexPath.row])"
        let activyVC = UIActivityViewController(activityItems:[Text], applicationActivities: nil)
        
        self.present(activyVC,animated: true,completion: nil)
        
    }
    
    @IBAction func feedback(_ sender: Any) {
        if let url = URL(string: "http://forcemobilestudios.com/page9.html") {
            UIApplication.shared.open(url, options: [:])
        }
        
    }
    
    
}

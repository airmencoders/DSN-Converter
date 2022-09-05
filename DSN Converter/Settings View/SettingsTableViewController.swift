//
//  SettingsTableViewController.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
// Settings


import UIKit
import StoreKit
class SettingsTableViewController: UITableViewController {
    @IBOutlet var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func About(_ sender: Any) {
        if let url = URL(string: "https://airmencoders.us") {
            UIApplication.shared.open(url, options: [:])
        }
        
    }
    @IBAction func Review(_ sender: Any) {
        if #available( iOS 10.3,*){
            SKStoreReviewController.requestReview()
        }
    }
    
    @IBAction func Share(_ sender: Any) {
        //Share
        let Text = "You should try DSN Converter.\n Download it on the App Store Now\n https://apps.apple.com/us/app/dsn-europe/id1442345746"
        // let ActualNumber = "\(self.departmentsPhone[indexPath.row])"
        let activyVC = UIActivityViewController(activityItems:[Text], applicationActivities: nil)
        
        self.present(activyVC,animated: true,completion: nil)
        
    }
    
    @IBAction func feedback(_ sender: Any) {
        if let url = URL(string: "https://airmencoders.us") {
            UIApplication.shared.open(url, options: [:])
        }
        
    }
    
    
}

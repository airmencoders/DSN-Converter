//
//  BetaViewController.swift
//  DSN Converter
//
//  Created by Mac Fusion on 1/5/19.
//  Copyright © 2019 ForceMobileStudios. All rights reserved.
//

import UIKit
import MessageUI
class BetaViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func website(_ sender: Any) {
        
        guard let url = URL(string: "http://forcemobilestudios.com/page8.html") else { return }
        UIApplication.shared.open(url)
        
    }
    
    @IBAction func Emailus(_ sender: Any) {
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
        
        
        // Configure the fields of the interface.
        composeVC.setToRecipients(["help.forcemobilestudios@gmail.com"])
        
        composeVC.setSubject(" ")
        
        //   composeVC.addAttachmentData(imageData!, mimeType: "image/png", fileName: "image1")
        
        composeVC.setMessageBody(" ", isHTML: false)
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
        
    }
    
    
    @IBAction func Close(_ sender: Any) {
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)

        
    }
    @IBAction func Accept(_ sender: Any) {
        performSegue(withIdentifier: "SegueWelcome", sender: nil)
        UserDefaults.standard.set("Accepted", forKey: "UserWelcome")
        
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        // Check the result or perform other tasks.
        
        //   let leftView = UIImageView(image: #imageLiteral(resourceName: "speaker"))
        //  let banner = NotificationBanner(title: "AF Fitness", subtitle: " Email has been sent successfully.", leftView: leftView, style: .info)
        //  banner.show()
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
        dismiss(animated: true, completion: nil )
    }
}

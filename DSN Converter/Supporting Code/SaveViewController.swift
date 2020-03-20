//
//  SaveViewController.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
//


import UIKit

class SaveViewController: UIViewController {

    @IBOutlet weak var dsnLbl: UILabel!
    @IBOutlet weak var commLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(dnsCommercialGlobal)
        
        commLbl.text = dnsCommercialGlobal
        dsnLbl.text = dsnPhoneGlobal
        locationLbl.text = dsnLocationGlobal
        timeLbl.text = dsnTimeGlobal
        dateLbl.text = dsnDateGlobal
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil )
        
    }
}

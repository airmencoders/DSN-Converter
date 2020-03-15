//
//  FavoriteSignUpViewController.swift
//  DSN Converter
//
//  Created by Mac Fusion on 11/12/18.
//  Copyright © 2018 ForceMobileStudios. All rights reserved.
//

import UIKit
import CoreData
class FavoriteSignUpViewController: UIViewController {

    @IBOutlet weak var favNameText: DesignableTextField!
    @IBOutlet weak var dsnLbl: UILabel!
    @IBOutlet weak var commLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    var dsnFavoriteDatabase: [NSManagedObject] = []
    var managedObjectContext : NSManagedObjectContext?
  //  @IBOutlet weak var timeLbl: UILabel!
   // @IBOutlet weak var dateLbl: UILabel!
    var whatDateisit = ""
    var nameofFav = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
            
        
            
       
        
        //Get the time and Date
        //Date
        
        let dateDate = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd MMM yy"
        
        let dateResults = formatter.string(from: dateDate)
        whatDateisit = dateResults
        print(whatDateisit)
        
        
        
        
        // Do any additional setup after loading the view.
        print(dnsCommercialGlobal)
        
        commLbl.text = dnsCommercialGlobal
//        dsnLbl.text = dsnPhoneGlobal
       // locationLbl.text = dsnLocationGlobal
       // timeLbl.text = dsnTimeGlobal
      //  dateLbl.text = dsnDateGlobal

 }
    @IBAction func SaveInFav(_ sender: Any) {
         nameofFav = favNameText.text!
        // Save Call in Recents
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Favorites",
                                                in: managedContext)!
        
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        person.setValue(dnsCommercialGlobalNoLbl, forKey: "commercialPhoneNoLbl")
        person.setValue(dnsCommercialGlobal, forKeyPath: "commercialPhoneFav")
        person.setValue(dsnPhoneGlobal, forKeyPath: "dsnPhoneFav")
        person.setValue(dsnLocationGlobal, forKeyPath: "locationFav")
        person.setValue(whatDateisit, forKeyPath: "dateofAddFav")
        person.setValue(nameofFav, forKeyPath: "nameFav")
        
        do {
            try managedContext.save()
            dsnFavoriteDatabase.append(person)
            
            
            
            
            // self.dismiss(animated: true, completion: nil)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
        
        
        
        
        
        
    }
    @IBAction func Dimiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

//
//  ContactsSignUpViewController.swift
//  DSN Converter
//
//  Created by Mac Fusion on 11/15/18.
//  Copyright © 2018 ForceMobileStudios. All rights reserved.
//

import UIKit
import CoreData
import ContactsUI
class ContactsSignUpViewController: UIViewController,CNContactViewControllerDelegate {

    @IBOutlet weak var ContNameText: DesignableTextField!
    @IBOutlet weak var dsnLbl: UILabel!
    @IBOutlet weak var commLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    var dsnContoriteDatabase: [NSManagedObject] = []
    var managedObjectContext : NSManagedObjectContext?
    //  @IBOutlet weak var timeLbl: UILabel!
    // @IBOutlet weak var dateLbl: UILabel!
    var whatDateisit = ""
    var nameofCont = " "
    
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
        dsnLbl.text = dsnPhoneGlobal
        locationLbl.text = dsnLocationGlobal
        // timeLbl.text = dsnTimeGlobal
        //  dateLbl.text = dsnDateGlobal
        
    }
    @IBAction func SaveInCont(_ sender: Any) {
        
        
        
        nameofCont = ContNameText.text!
        
        
        // Open and Save Contacts.
        let contact = CNMutableContact()
        contact.givenName = nameofCont
        let commDSN = CNLabeledValue(label: "Commercial DSN", value: CNPhoneNumber(stringValue :"\(commLbl.text!)"))
        contact.phoneNumbers = [commDSN]
        //let dsnRaw = CNLabeledValue(label: "DSN", value: CNPhoneNumber(stringValue :"\(dsnLbl.text!)"))
       // contact.phoneNumbers = [dsnRaw]
        //contact.imageData = data // Set image data here
        let vc = CNContactViewController(forNewContact: contact)
        vc.delegate = self
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
        
        
        /*
        
        // Save Call in Recents
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Contacts",
                                                in: managedContext)!
        
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        person.setValue(dnsCommercialGlobal, forKeyPath: "commercialContact")
        person.setValue(dsnPhoneGlobal, forKeyPath: "dsnContact")
        person.setValue(dsnLocationGlobal, forKeyPath: "locationContact")
        person.setValue(whatDateisit, forKeyPath: "dateAddContact")
        person.setValue(nameofCont, forKeyPath: "nameContact")
        
        do {
            try managedContext.save()
            dsnContoriteDatabase.append(person)
            
            
            
            
            // self.dismiss(animated: true, completion: nil)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
        */
        
        
        
        func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) { self.dismiss(animated: true, completion: nil) }
        
        
    }
    @IBAction func Dimiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

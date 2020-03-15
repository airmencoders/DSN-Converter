//
//  Commented File.swift
//  CountdownLabel
//
//  Created by Mac Fusion on 11/25/18.
//

import Foundation
/*
 
 
 View did load
 //Checks that its a DSN by checking for 7 digits
 //if self.getDsnNumber.count == 8 {
 
 
 
 //Devides the Area code with "-" from the rest of the number
 if self.getDsnNumber.range(of: "-") != nil {
 
 //Counts how many times the user has tapped the Call Btn
 timedTapped += 1
 UserDefaults.standard.set(timedTapped, forKey: "TimeTapped")
 print("Button Tapped \(timedTapped)")
 
 if timedTapped > 1 {
 
 if self.rewardBasedAd.isReady {
 
 self.rewardBasedAd.present(fromRootViewController: self)
 print("Video Ads is ready ")
 }else {
 
 print("Video Ad is not ready")
 
 }
 
 }else {
 
 let inputComponets = self.getDsnNumber.characters.split {$0 == "-"}.map { (x) -> String in return String(x)}
 
 let areaCode = inputComponets [0]
 let phoneNumber = inputComponets [1]
 //Shows Area Code & Phone number
 print (String(areaCode))
 print (String(phoneNumber))
 
 //Check the number for the Area Code
 
 if areaCode == "480" {
 
 self.phoneOutput = self.Ext480Lbl + "-" + phoneNumber
 self.phoneOutPutNoLbl = self.Ext480NoLbl + phoneNumber
 self.DsnLocation = "Ramstein AB"
 
 }else if areaCode == "479" {
 
 self.phoneOutput = self.Ext479Lbl + "-" + phoneNumber
 self.phoneOutPutNoLbl = self.Ext479NoLbl + phoneNumber
 self.DsnLocation = "Ramstein AB"
 }else if areaCode == "489"{
 
 self.phoneOutput = self.Ext489Lbl + "-" + phoneNumber
 self.phoneOutPutNoLbl = self.Ext489NoLbl + phoneNumber
 self.DsnLocation = "Ramstein AB"
 
 }else if areaCode == "478" {
 self.phoneOutput = self.Ext478Lbl + "-" + phoneNumber
 self.phoneOutPutNoLbl = self.Ext478NoLbl + phoneNumber
 self.DsnLocation = "Ramstein AB"
 
 
 }else if areaCode == "452"{
 
 self.phoneOutput = self.Ext452Lbl + "-" + phoneNumber
 self.phoneOutPutNoLbl = self.Ext452NoLbl + phoneNumber
 self.DsnLocation = "Spangdahlem AB"
 
 }else if areaCode == "590" {
 self.phoneOutput = self.Ext590Lbl + "-" + phoneNumber
 self.phoneOutPutNoLbl = self.Ext590NoLbl + phoneNumber
 self.DsnLocation = "LRMC"
 
 
 
 }else if areaCode == "632" {
 self.phoneOutput = self.Ext632Lbl + "-" + phoneNumber
 self.phoneOutPutNoLbl = self.Ext632NoLbl + phoneNumber
 self.DsnLocation = "Aviano AB"
 
 }
 
 
 let alertVC = PMAlertController(title: "DSN Converter ", description: "Do you want to make this call?\n DSN: \(self.getDsnNumber) \n Commercial: \(self.phoneOutput)\n Location: \(self.DsnLocation)", image: UIImage(named: "img.png"), style: .alert)
 
 
 
 
 
 
 alertVC.addAction(PMAlertAction(title: "Call", style: .default, action: { () in
 print("Capture action OK")
 
 
 
 
 //Make the Call
 if let url = URL(string: "tel://\(self.phoneOutPutNoLbl ))"), UIApplication.shared.canOpenURL(url) {
 if #available(iOS 10, *) {
 UIApplication.shared.open(url)
 } else {
 UIApplication.shared.openURL(url)
 }
 }
 self.getTimefromTimer = self.whatTimeisit
 print("Get Time" + self.getTimefromTimer)
 
 
 
 // Save Call in Recents
 
 
 guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
 return
 }
 
 let managedContext = appDelegate.persistentContainer.viewContext
 
 let entity = NSEntityDescription.entity(forEntityName: "Recent",
 in: managedContext)!
 
 let person = NSManagedObject(entity: entity,
 insertInto: managedContext)
 
 person.setValue(self.phoneOutput, forKeyPath: "commercialPhone")
 person.setValue(self.getDsnNumber, forKeyPath: "dsnPhone")
 person.setValue(self.DsnLocation, forKeyPath: "location")
 person.setValue(self.whatDateisit, forKeyPath: "dateofCall")
 person.setValue(self.getTimefromTimer, forKeyPath: "timeofCall")
 
 do {
 try managedContext.save()
 self.dsnRecentDatabase.append(person)
 
 
 
 
 // self.dismiss(animated: true, completion: nil)
 } catch let error as NSError {
 print("Could not save. \(error), \(error.userInfo)")
 }
 
 
 
 }))
 
 alertVC.addAction(PMAlertAction(title: "Add to Favorites", style: .default, action: { () -> Void in
 
 dnsCommercialGlobal = self.phoneOutput
 dsnPhoneGlobal = self.getDsnNumber
 dsnLocationGlobal = self.DsnLocation
 dsnDateGlobal = self.whatDateisit
 dsnTimeGlobal = self.whatTimeisit
 self.performSegue(withIdentifier: "SaveFav", sender: nil)
 
 }))
 
 alertVC.addAction(PMAlertAction(title: "Save Contact", style: .default, action: { () -> Void in
 
 
 dnsCommercialGlobal = self.phoneOutput
 dsnPhoneGlobal = self.getDsnNumber
 dsnLocationGlobal = self.DsnLocation
 dsnDateGlobal = self.whatDateisit
 dsnTimeGlobal = self.whatTimeisit
 //self.performSegue(withIdentifier: "ContactSegue", sender: nil)
 
 /*
 let newContact = CNMutableContact()
 newContact.givenName = "selfish"
 newContact.phoneNumbers.append(CNLabeledValue(label: "home", value: CNPhoneNumber(stringValue: "123456")))
 let contactVC = CNContactViewController(forUnknownContact: newContact)
 contactVC.contactStore = CNContactStore()
 contactVC.delegate = self
 contactVC.allowsActions = false
 //self.navigationController?.pushViewController(contactVC, animated: true)
 let navigationController = UINavigationController(rootViewController: contactVC) //For presenting the vc you have to make it navigation controller otherwise it will not work, if you already have navigatiation controllerjust push it you dont have to make it a navigation controller
 self.present(navigationController, animated: true, completion: nil)
 
 */
 // Open and Save Contacts.
 let contact = CNMutableContact()
 let homePhone = CNLabeledValue(label: "Commercial DSN", value: CNPhoneNumber(stringValue :"\(self.phoneOutput)"))
 
 contact.phoneNumbers = [homePhone]
 contact.note = "Location: \(self.DsnLocation)\nThis commercial DSN was provided to you by DSN Converter - Europe."
 //contact.imageData = data // Set image data here
 let vc = CNContactViewController(forNewContact: contact)
 vc.delegate = self
 let nav = UINavigationController(rootViewController: vc)
 self.present(nav, animated: true, completion: nil)
 
 }))
 
 
 alertVC.addAction(PMAlertAction(title: "Share", style: .default, action: { () -> Void in
 
 }))
 
 alertVC.addAction(PMAlertAction(title: "Cancel", style: .cancel, action: { () -> Void in
 
 }))
 
 
 
 
 
 self.present(alertVC, animated: true, completion: nil)
 
 
 
 
 }
 
 
 }
 
 
 */

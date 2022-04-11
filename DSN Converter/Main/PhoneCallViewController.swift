//
//  PhoneCallViewController.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
// All DSN conversion with their prefix are here. 


import UIKit
import CoreData
import ContactsUI
import PMAlertController


class PhoneCallViewController:
    UIViewController,CNContactViewControllerDelegate{
    
    @IBOutlet weak var favBtn: ButtonModification!
    @IBOutlet weak var contactBtn: ButtonModification!
    @IBOutlet weak var sharebtn: ButtonModification!
    @IBOutlet weak var DsnNotFound: UIView!
    @IBOutlet weak var callBtn: ButtonModification!
    @IBOutlet weak var CallView: UIView!
    var getDsnNumber = ""
    var seconds = 100
    var dsnRecentDatabase: [NSManagedObject] = []
    var managedObjectContext : NSManagedObjectContext?
    var phoneOutput = ""
    var callCommericalNumber = ""
    var whatDateisit = ""
    var whatTimeisit = ""
    
    @IBOutlet weak var SubmitBtn: ButtonModification!
    // var getDsnNumber = ""
    var DsnLocation = ""
    var timer = Timer()
    var getTimefromTimer = ""
    
    @IBOutlet weak var commLbl: UILabel!
    @IBOutlet weak var dsnLbl: UILabel!
    @IBOutlet weak var LocationLbl: UILabel!
    @IBOutlet weak var reportaCorrection: UIButton!
    @IBOutlet weak var backgroundImg: UIImageView!
    
    //Decodable Struct - JSON
    struct DSNData: Decodable {
        let prefix:Int
        let number: String
        let location: String
    }
    //ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        getDsnNumber =  dsnPhoneGlobal
        //Devides the Area code with "-" from the rest of the number
        if getDsnNumber.range(of: "-") != nil {
            CallView.isHidden = false
            DsnNotFound.isHidden = true
            reportaCorrection.isHidden = false
            //Splits DSN in Prefix (480) or Postfix(XXXX)
            let inputComponets = getDsnNumber.split {$0 == "-"}.map { (x) -> String in return String(x)}
            let areaCode = inputComponets [0]
            let phoneNumber = inputComponets [1]
            //Call Function ReadDataJSON (Passing areaCode(DSN Prefix) and phoneNumber(DSN Postfix)
            ReadDataJSON(DsnPrefix: areaCode, DsnPostfix: phoneNumber)
        }
    }
    func ReadDataJSON(DsnPrefix:String, DsnPostfix:String) {
        guard let sourceURL = Bundle.main.url(forResource: "DSNList", withExtension: "json") else {fatalError("File Not Found")}
        guard let DSNDecoderData = try? Data(contentsOf: sourceURL) else {fatalError("DSN Decode Error")}
        let decoder = JSONDecoder()
        guard let DSNJSONArray = try? decoder.decode([DSNData].self, from: DSNDecoderData) else {fatalError("Problem with Dedoding DSN ")}
        //For Loop
        for dsn in DSNJSONArray {
            // If the DsnPrefix matches any of the JSON DSN then display the CallView
            if String(dsn.prefix) == DsnPrefix {
                print("DsnPrefix\(String(dsn.prefix))")
                let commercialNumber = dsn.number + DsnPostfix
                let baseLocation = dsn.location
                //Display Labels
                commLbl.text = commercialNumber
                LocationLbl.text = baseLocation
                DsnLocation = baseLocation
                dsnLbl.text = getDsnNumber
                dnsCommercialGlobal = commercialNumber
                dsnPhoneGlobal = getDsnNumber
            }
        }
        // If DSN is not in JSON File - User will have the ability to submit a request.
        if commLbl.text == "CommLbl" {
            commLbl.text = "Not Found"
            dsnLbl.text = getDsnNumber
            LocationLbl.text = "Not Found"
            DsnNotFound.isHidden = false
            CallView.isHidden = true
        }
        
    }
    @IBAction func MakeACall(_ sender: Any) {
        //Get the time and Date
        //Date
        let dateDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-YYYY"
        let dateResults = formatter.string(from: dateDate)
        whatDateisit = dateResults
        //Time
        let dateDateTime = Date()
        let formatterTime = DateFormatter()
        formatterTime.dateFormat = "HH:mm:ss"
        let timeResults = formatterTime.string(from: dateDateTime)
        whatTimeisit = timeResults
        //Remove all Spaces in the String
        callCommericalNumber = dnsCommercialGlobal.replacingOccurrences(of: " ", with: "")
        //Make the Call
        if let url = URL(string: "tel://\(callCommericalNumber ))"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        //Save Call CoreData to Display it in the RECENT Tab.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Recent",
                                                in: managedContext)!
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        person.setValue(callCommericalNumber, forKey: "commercialPhoneNoLbl")
        person.setValue(dnsCommercialGlobal, forKeyPath: "commercialPhone")
        person.setValue(getDsnNumber, forKeyPath: "dsnPhone")
        person.setValue(DsnLocation, forKeyPath: "location")
        person.setValue(whatDateisit, forKeyPath: "dateofCall")
        person.setValue(whatTimeisit, forKeyPath: "timeofCall")
        //  person.setValue(nameofFav, forKeyPath: "nameFav")
        do {
            try managedContext.save()
            dsnRecentDatabase.append(person)
            // self.dismiss(animated: true, completion: nil)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    //Save to Favorite ( Within the App)
    @IBAction func Favorite(_ sender: Any) {
        dnsCommercialGlobalNoLbl = dnsCommercialGlobal.replacingOccurrences(of: " ", with: "")
        dsnPhoneGlobal = getDsnNumber
        dsnLocationGlobal = DsnLocation
        dsnDateGlobal = whatDateisit
        dsnTimeGlobal = whatTimeisit
        performSegue(withIdentifier: "SaveFav", sender: nil)
    }
    @IBAction func SaveContacts(_ sender: Any) {
        // Open and Save Contacts.
        let contact = CNMutableContact()
        let homePhone = CNLabeledValue(label: "Commercial DSN", value: CNPhoneNumber(stringValue :"\(dnsCommercialGlobal)"))
        contact.phoneNumbers = [homePhone]
        contact.note = "Location: \(self.DsnLocation)\nThis commercial DSN was provided to you by DSN Converter."
        //contact.imageData = data // Set image data here
        let vc = CNContactViewController(forNewContact: contact)
        vc.delegate = self
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
        
    }
    
    
    
    func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) { self.dismiss(animated: true, completion: nil) }
    
    
    @objc func tick() {
        //Time
        
        let dateDate = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm:ss"
        
        let timeResults = formatter.string(from: dateDate)
        whatTimeisit = "\(timeResults)"
        // print(whatTimeisit)
        
        
    }
    
    @IBAction func Close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ShareBtn(_ sender: Any) {
        
        //Share
        
        
        
        
        let Text = "Commerical: \(phoneOutput)\n DSN: \(getDsnNumber)\n Location: \(DsnLocation) \nThis commerical DSN was provided to you by DSN Converter.\n Download it free on the App Store."
        // let ActualNumber = "\(self.departmentsPhone[indexPath.row])"
        let activyVC = UIActivityViewController(activityItems:[Text], applicationActivities: nil)
        
        self.present(activyVC,animated: true,completion: nil)
        
        
        
        
    }
    
    
}
extension PhoneCallViewController {
    
    
    
    
    
    
}

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
import Floaty


class PhoneCallViewController:
    UIViewController,CNContactViewControllerDelegate, FloatyDelegate{
    
    @IBOutlet weak var favBtn: ButtonModification!
    @IBOutlet weak var contactBtn: ButtonModification!
    @IBOutlet weak var sharebtn: ButtonModification!

    @IBOutlet weak var DsnNotFound: UIView!
    
    @IBOutlet weak var callBtn: ButtonModification!
    @IBOutlet weak var CallView: UIView!
    @IBOutlet weak var CallViewStack: UIStackView!
    
    //Statitics Variables
    
    var googleFormsLink: String = ""
    var googleDate:String = ""
    var googlePrefix:String = ""
    var googleLocation:String = ""
    var googleCountry:String = ""
    var googleUCC:String = ""
    
    // Ids
    
    var googleDateID = "entry.1938942754"
    var googlePrefixID = "entry.307678791"
    var googleLocationID = "entry.1708323532"
    var googleCountryID = "entry.971695373"
    var googleUCCID = "entry.300620858"
    
    var getDsnNumber = ""
    var seconds = 100
    var dsnRecentDatabase: [NSManagedObject] = []
    var managedObjectContext : NSManagedObjectContext?
    var phoneOutput = ""
    var callCommericalNumber = ""
    var whatDateisit = ""
    var whatTimeisit = ""
    var areaCodeValue = ""
    var countryValue = ""
    var uccValue = ""
    @IBOutlet weak var SubmitBtn: ButtonModification!
    // var getDsnNumber = ""
    var DsnLocation = ""
    var timer = Timer()
    var getTimefromTimer = ""
    
    var floaty = Floaty()

    @IBOutlet weak var commLbl: UILabel!
    @IBOutlet weak var dsnLbl: UILabel!
    @IBOutlet weak var LocationLbl: UILabel!
    @IBOutlet weak var reportaCorrection: UIButton!
   
    @IBOutlet weak var UCCLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    //Decodable Struct - JSON
    struct DSNData: Decodable {
        let prefix:Int
        let number: String
        let location: String
        let country: String
        let command: String
    }
    //ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        floaty.addDragging()
    
        
        getDsnNumber =  dsnPhoneGlobal
        //Devides the Area code with "-" from the rest of the number
        if getDsnNumber.range(of: "-") != nil {
            CallViewStack.isHidden = false
            DsnNotFound.isHidden = true
            reportaCorrection.isHidden = false
            //Splits DSN in Prefix (480) or Postfix(XXXX)
            let inputComponets = getDsnNumber.split {$0 == "-"}.map { (x) -> String in return String(x)}
            let areaCode = inputComponets [0]
            areaCodeValue = areaCode
            let phoneNumber = inputComponets [1]
            //Call Function ReadDataJSON (Passing areaCode(DSN Prefix) and phoneNumber(DSN Postfix)
            ReadDataJSON(DsnPrefix: areaCode, DsnPostfix: phoneNumber)
            //Display Flotting Button in UI
            layoutFAB()
        
        }
    }

    @IBAction func MakeACall(_ sender: Any) {
       Call()
    }
    
    @IBAction func Close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func AlertMessage(_ sender: Any) {
        let alertVC = PMAlertController(title: "DSN Converter ", description: "This is an Unsecured Line!\n Be aware that DSN Converter uses your commercial cell service to make phone calls. DO NOT discuss any sensative or classified information when using this app.", image: UIImage(named: "img.png"), style: .alert)
        alertVC.addAction(PMAlertAction(title: "Understood", style: .cancel, action: { () -> Void in
        }))
        self.present(alertVC, animated: true, completion: nil)
        
    }
}

// All Function are below
extension PhoneCallViewController {
    
    func Call() {
        GetDateAndTime()
        
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
    
    
    @objc func tick() {
        //Time
        
        let dateDate = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm:ss"
        
        let timeResults = formatter.string(from: dateDate)
        whatTimeisit = "\(timeResults)"
        // print(whatTimeisit)
        
        
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
                let unifiedCommand = dsn.command
                let country = dsn.country
                //Display Labels
                commLbl.text = commercialNumber
                LocationLbl.text = baseLocation
                UCCLbl.text = unifiedCommand
                dsnLbl.text = getDsnNumber
                countryLbl.text = country
                dnsCommercialGlobal = commercialNumber
                dsnPhoneGlobal = getDsnNumber
                DsnLocation = baseLocation
                countryValue = country
                uccValue = unifiedCommand
            }
        }
        // If DSN is not in JSON File - User will have the ability to submit a request.
        if commLbl.text == "CommLbl" {
            commLbl.text = "Not Found"
            dsnLbl.text = getDsnNumber
            LocationLbl.text = "Not Found"
            UCCLbl.text = "Not Found"
            countryLbl.text = "Not Found"
            DsnNotFound.isHidden = false
            CallViewStack.isHidden = true
            floaty.isHidden = true
        }
        
    }
    func layoutFAB() {
      let item = FloatyItem()
      item.hasShadow = false
      item.buttonColor = UIColor.red
      item.circleShadowColor = UIColor.red
      item.titleShadowColor = UIColor.blue
      item.titleLabelPosition = .right
//      item.title = "titlePosition right"
      item.handler = { item in
        
      }
      
      floaty.hasShadow = false
        if #available(iOS 13.0, *) {
            floaty.addItem("Call \(getDsnNumber)", icon: UIImage(systemName: "phone", withConfiguration: UIImage.SymbolConfiguration(pointSize:32, weight: .medium))) { item in
                self.Call()
            }
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            floaty.addItem("Add to Favorite", icon: UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(pointSize:32, weight: .medium))) { item in
                dnsCommercialGlobalNoLbl = dnsCommercialGlobal.replacingOccurrences(of: " ", with: "")
                dsnPhoneGlobal = self.getDsnNumber
                dsnLocationGlobal = self.DsnLocation
                dsnDateGlobal = self.whatDateisit
                dsnTimeGlobal = self.whatTimeisit
                self.performSegue(withIdentifier: "SaveFav", sender: nil)
            }
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            floaty.addItem("Add to Contacts", icon: UIImage(systemName: "person.crop.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize:32, weight: .medium))) {item in
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
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            floaty.addItem("DSN Correction", icon: UIImage(systemName: "iphone.homebutton.slash", withConfiguration: UIImage.SymbolConfiguration(pointSize:32, weight: .medium))) { item in
                self.performSegue(withIdentifier: "ReportDSN", sender: nil)
            }
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            floaty.addItem("Share", icon: UIImage(systemName: "square.and.arrow.up", withConfiguration: UIImage.SymbolConfiguration(pointSize:32, weight: .medium))) {item in
                //Share
                let Text = "Commerical: \(self.phoneOutput)\n DSN: \(self.getDsnNumber)\n Location: \(self.DsnLocation) \nThis commerical DSN was provided to you by DSN Converter.\n Download it free on the App Store."
                let activyVC = UIActivityViewController(activityItems:[Text], applicationActivities: nil)
                self.present(activyVC,animated: true,completion: nil)
            }
        } else {
            // Fallback on earlier versi
            
        }
     
      floaty.paddingX = self.view.frame.width/30 - floaty.frame.width/30
//      floaty.paddingY = self.view.frame.height/15 - floaty.frame.height/15
      floaty.fabDelegate = self
      
      self.view.addSubview(floaty)
      
    }
    func GetDateAndTime() {
        //Get the time and Date
        //Date
        let dateDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-YYYY"
        let dateResults = formatter.string(from: dateDate)
        whatDateisit = dateResults
        //Time
        let dateDateTime = Date()
        let formatterTime = DateFormatter()
        formatterTime.dateFormat = "HH:mm:ss"
        let timeResults = formatterTime.string(from: dateDateTime)
        whatTimeisit = timeResults
    }
}

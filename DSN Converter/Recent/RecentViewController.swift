//
//  RecentViewController.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
//


import UIKit
import CoreData
import PMAlertController


class RecentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var RecenttableView: UITableView!
    

    var dsnCommercialLocal = ""
  
    var dsnRecentDatabase: [NSManagedObject] = []
    
    var contactDatabase: [NSManagedObject] = []
   
    @IBOutlet weak var noRecelbl: UILabel!
    
   // var contactNameArray = [String]()
   // var commPhoneArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let value = UserDefaults.standard.value(forKey: "dsnService"){
//            if  0 == value as! Int {
//                self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
//            }else if 1 == value as! Int{
//                self.view.backgroundColor = #colorLiteral(red: 0.1572559077, green: 0.4129788669, blue: 0.1819413052, alpha: 1)
//            }else if 2 == value as! Int{
//                self.view.backgroundColor = #colorLiteral(red: 0.1620297223, green: 0.4949354393, blue: 0.7333416692, alpha: 1)
//            }
//        }

         RecenttableView.reloadData()
        
        RecenttableView.delegate = self
        RecenttableView.dataSource = self
        RecenttableView.rowHeight = 70
      
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate // UIApplication.shared().delegate as! AppDelegate is now UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let requestProfile = NSFetchRequest<NSFetchRequestResult>(entityName: "Recent")
        requestProfile.sortDescriptors = [NSSortDescriptor(key:"dateofCall",ascending:false)]
        requestProfile.sortDescriptors = [NSSortDescriptor(key:"timeofCall",ascending:false)]
        requestProfile.returnsObjectsAsFaults = false
        let requestData = NSFetchRequest<NSFetchRequestResult>(entityName: "Recent")
        requestData.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(requestProfile)
            for result in results as! [NSManagedObject] {
          
            }
            
            
            
        } catch {
            print("Request failed")
        }
       
        
        //Check if Database is empty
        var isEmpty : Bool {
            do{
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Recent")
                let count  = try context.count(for: request)
                return count == 0 ? true : false
            }catch{
                return true
            }
        }
        print("Database is empty:\(isEmpty)")
        //End of Check if Database is empty
        
        if isEmpty == true {
            
            noRecelbl.isHidden = false
            noRecelbl.text = "No Recents"
            
        }else {
            //Check for Data in History
            
            noRecelbl.isHidden = true
        }
        
        
    }
    
    

     
    
    override func viewWillAppear(_ animated: Bool ) {
        super.viewWillAppear(animated)
        
        print("ViewWillApear")
        
        RecenttableView.reloadData()
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Recent")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key:"timeofCall",ascending:false)]
        fetchRequest.sortDescriptors = [NSSortDescriptor(key:"timeofCall",ascending:false)]
        do {
            dsnRecentDatabase = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        //Check if Database is empty
        var isEmpty : Bool {
            do{
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Recent")
                let count  = try managedContext.count(for: request)
                return count == 0 ? true : false
            }catch{
                return true
            }
        }
        print("Database is empty:\(isEmpty)")
        //End of Check if Database is empty
        
        if isEmpty == true {
            
            noRecelbl.isHidden = false
            noRecelbl.text = "No Recents"
            
        }else {
            //Check for Data in History
            
            noRecelbl.isHidden = true
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("ViewDidAppear")
        RecenttableView.reloadData()
        /*
        // Get Data from Contacts
       let appDelegate = UIApplication.shared.delegate as! AppDelegate // UIApplication.shared().delegate as! AppDelegate is now UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        let requestDataContact = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        requestDataContact.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(requestDataContact)
            
            for result in results as! [NSManagedObject] {
                
                
                if let nameContactTemp = result.value(forKey: "nameContact") as? String {
                    //LastAFPTScore.text = String(airmanAFPTScore)
                    print("Name:" + nameContactTemp)
                    contactNameArray.append(nameContactTemp)
                    
                }
                if let commericialContactTemp = result.value(forKey: "commercialContact") as? String {
                    //LastAFPTScore.text = String(airmanAFPTScore)
                    print("Comm:" + commericialContactTemp)
                    commPhoneArray.append(commericialContactTemp)
                }
                
                
            }
        }catch {
            print("Request failed")
        }
        */
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dsnRecentDatabase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = RecenttableView.dequeueReusableCell(withIdentifier: "RecentSegue",for: indexPath) as? RecentTableViewCell {
            let person = dsnRecentDatabase[indexPath.row]

         cell.commercialLbl!.text = person.value(forKeyPath: "dsnPhone")! as? String
           // cell.dsnLbl!.text = person.value(forKeyPath: "dsnPhone")! as? String
           cell.locationLbl!.text = person.value(forKeyPath: "location")! as? String
            cell.timeLbl!.text = person.value(forKeyPath: "timeofCall")! as? String
            cell.dateLbl!.text = person.value(forKeyPath: "dateofCall")! as? String

            return cell
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let person = dsnRecentDatabase[indexPath.row]
        
        let commPhone = person.value(forKeyPath: "commercialPhoneNoLbl")
        
        print("CommPhone\(commPhone!)")
        
        let alertVC = PMAlertController(title: "DSN Converter ", description: "What do you want to do ? ", image: UIImage(named: "img.png"), style: .alert)
        
        
        
        alertVC.addAction(PMAlertAction(title: "Call", style: .default, action: { () in
            print("Capture action OK")
            
            if let url = URL(string: "tel://\(String(describing: commPhone!)))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
            
            
        }))
        
        //alertVC.addAction(PMAlertAction(title: "Add to Favorites", style: .default, action: { () -> Void in
            
           
            
       // }))
       
        /*
        alertVC.addAction(PMAlertAction(title: "Details", style: .default, action: { () -> Void in
            
            let person = self.dsnRecentDatabase[indexPath.row]
            
            let commPhone = person.value(forKey: "commercialPhone")
            let dsnPhone = person.value(forKey: "dsnPhone")
            let location = person.value(forKey: "location")
            let date = person.value(forKey: "dateofCall")
            let time = person.value(forKey: "timeofCall")
            
            dnsCommercialGlobal = commPhone as! String
            dsnPhoneGlobal = dsnPhone as! String
            dsnLocationGlobal = location as! String
            dsnDateGlobal = date as! String
            dsnTimeGlobal = time as! String
            self.performSegue(withIdentifier: "SaveContacts", sender: nil)
            
            
            
        }))
        */
        alertVC.addAction(PMAlertAction(title: "Share Contact", style: .default, action: { () -> Void in
            
        }))
        
        alertVC.addAction(PMAlertAction(title: "Cancel", style: .cancel, action: { () -> Void in
            
        }))
        
        
        self.present(alertVC, animated: true, completion: nil)
        
    }
  
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
            print("Deleted")
        
       // print( AirForceDatabase.count )
        let person = dsnRecentDatabase[indexPath.row]
        let recordtoDelete = person.value(forKey: "timeofCall") as! String
        
        if editingStyle == .delete {
            
            let moc = getContext()
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recent")
            let result = try? moc.fetch(fetchRequest)
            let resultdata = result as! [Recent] // result as entity
            
            dsnRecentDatabase.remove(at: indexPath.row)
            
            for object in resultdata { // Go through the fetched result
                if object.timeofCall == recordtoDelete { // If there is a match
                    moc.delete(object) // delete the object
                }
            }
            
            do {
                try moc.save() // Save the delete action
                
                
            } catch let error as NSError {
                
                
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
            
            
            //Check if Database is empty
            var isEmpty : Bool {
                do{
                    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Recent")
                    let count  = try moc.count(for: request)
                    return count == 0 ? true : false
                }catch{
                    return true
                }
            }
            print("Database is empty:\(isEmpty)")
            //End of Check if Database is empty
            
            if isEmpty == true {
                
                noRecelbl.isHidden = false
                noRecelbl.text = "No Recents"
                
            }else {
                //Check for Data in History
                
                noRecelbl.isHidden = true
            }

            
            
            
            viewDidAppear(true)
            
         //   performSegue(withIdentifier: "ReloadData", sender: nil)
            
            
        }
        
        
    }
    
  
}




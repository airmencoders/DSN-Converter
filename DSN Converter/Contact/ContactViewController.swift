//
//  ContactViewController.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
// Not in Use


import UIKit
import CoreData
import PMAlertController
class ContactViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var emptyContlbl: UILabel!
  //  @IBOutlet weak var ContView: UIView!
    //@IBOutlet weak var ContContLbl: UILabel!
    
    @IBOutlet weak var ContTableView: UITableView!
    //NSManagedObject for the CoreData
    var dsnContactsDatabase: [NSManagedObject] = []
    var sections: [NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegating the Table
        ContTableView.delegate = self
        ContTableView.dataSource = self
        //setting the Table to 64 Inches
        ContTableView.rowHeight = 70
        
        //Sets up Core Data
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate // UIApplication.shared().delegate as! AppDelegate is now UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let requestProfile = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        requestProfile.sortDescriptors = [NSSortDescriptor(key:"nameContact",ascending:false)]
        requestProfile.returnsObjectsAsFaults = false
        
        
        
        let requestData = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        
        requestData.returnsObjectsAsFaults = false
        
        
        do {
            
            let results = try context.fetch(requestProfile)
            
            for result in results as! [NSManagedObject] {
                
                
                if let commercialPhone = result.value(forKey: "commercialContact") as? String {
                    //LastAFPTScore.text = String(airmanAFPTScore)
                    print(commercialPhone)
                    
                    // dsnCommercialLocal = commercialPhone
                }
                if let dsnPhone = result.value(forKey: "dsnContact") as? String {
                    //LastAFPTScore.text = String(airmanAFPTScore)
                    print(dsnPhone)
                }
                if let locationPhone = result.value(forKey: "locationContact") as? String {
                    //LastAFPTScore.text = String(airmanAFPTScore)
                    print(locationPhone)
                }
                if let name = result.value(forKey: "nameContact") as? String {
                    //LastAFPTScore.text = String(airmanAFPTScore)
                    print(name)
                }
                
            }
            
            
            
        } catch {
            print("Request failed")
        }
        
        
        //Check if Database is empty
        var isEmpty : Bool {
            do{
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
                let count  = try context.count(for: request)
                return count == 0 ? true : false
            }catch{
                return true
            }
        }
        print("Database is empty:\(isEmpty)")
        //End of Check if Database is empty
        
        if isEmpty == true {
            
            emptyContlbl.isHidden = false
            emptyContlbl.text = "No Contacts"
            
        }else {
            //Check for Data in History
            
            emptyContlbl.isHidden = true
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool ) {
        super.viewWillAppear(animated)
        
        print("ViewWillApear")
        
        ContTableView.reloadData()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Contacts")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key:"nameContact",ascending:false)]
        
        
        do {
            dsnContactsDatabase = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("ViewDidAppear")
        ContTableView.reloadData()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate // UIApplication.shared().delegate as! AppDelegate is now UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        //Check if Database is empty
        var isEmpty : Bool {
            do{
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
                let count  = try context.count(for: request)
                return count == 0 ? true : false
            }catch{
                return true
            }
        }
        print("Database is empty:\(isEmpty)")
        //End of Check if Database is empty
        
        if isEmpty == true {
            
            emptyContlbl.isHidden = false
            emptyContlbl.text = "No Contacts"
            
        }else {
            //Check for Data in History
            
            emptyContlbl.isHidden = true
        }
        
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dsnContactsDatabase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = ContTableView.dequeueReusableCell(withIdentifier: "ContSegue",for: indexPath) as? ContactsTableViewCell {
            
            
            let person = dsnContactsDatabase[indexPath.row]
            
            
            cell.commLbl!.text = person.value(forKeyPath: "commercialContact")! as? String
            cell.dsnLbl!.text = person.value(forKeyPath: "dsnContact")! as? String
            cell.locationLbl!.text = person.value(forKeyPath: "locationContact")! as? String
            cell.nameLbl!.text = person.value(forKeyPath: "nameContact")! as? String
            // cell.!.text = person.value(forKeyPath: "dateofAddCont")! as? String
            
            
            return cell
        }
        return UITableViewCell()
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let person = dsnContactsDatabase[indexPath.row]
        
        let commPhone = person.value(forKey: "commercialContact")
        let commName = person.value(forKey: "nameContact")
        
        let alertVC = PMAlertController(title: "DSN Converter ", description: "Would you like to call \(String(describing: commName!))? ", image: UIImage(named: "img.png"), style: .alert)
        
        
        
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
        let person = dsnContactsDatabase[indexPath.row]
        let recordtoDelete = person.value(forKey: "nameContact") as! String
        
        if editingStyle == .delete {
            
            let moc = getContext()
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
            let result = try? moc.fetch(fetchRequest)
            let resultdata = result as! [Contacts] // result as entity
            
            dsnContactsDatabase.remove(at: indexPath.row)
            
            for object in resultdata { // Go through the fetched result
                if object.nameContact == recordtoDelete { // If there is a match
                    moc.delete(object) // delete the object
                }
            }
            
            do {
                try moc.save() // Save the delete action
                
                
            } catch let error as NSError {
                
                
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
            
            viewDidAppear(true)
            
            //   performSegue(withIdentifier: "ReloadData", sender: nil)
            
            
        }
        
        
    }
    
    
}

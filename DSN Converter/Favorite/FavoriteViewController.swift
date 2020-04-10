//
//  FavoriteViewController.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
// Favorite View 


import UIKit
import CoreData
import PMAlertController

class FavoriteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 

    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var emptyFavlbl: UILabel!
    @IBOutlet weak var favView: UIView!
    @IBOutlet weak var favContLbl: UILabel!
    var phoneOutput = ""
    var phoneOutputNoLbl = ""
    var getDsnNumber = ""
    var DsnLocation = ""
    var whatDateisit = ""
    var getTimefromTimer = ""
    var timer = Timer()
     var whatTimeisit = ""
    @IBOutlet weak var favTableView: UITableView!
    //NSManagedObject for the CoreData
    var dsnFavoriteDatabase: [NSManagedObject] = []
    var dsnRecentDatabase: [NSManagedObject] = []
    var sections: [NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let value = UserDefaults.standard.value(forKey: "dsnService"){
            
            if  0 == value as! Int {
                
                backgroundImg.image = UIImage(named:"aircraft.png")
                self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
                
                
            }else if 1 == value as! Int{
                self.view.backgroundColor = #colorLiteral(red: 0.1572559077, green: 0.4129788669, blue: 0.1819413052, alpha: 1)
                backgroundImg.image = UIImage(named:"jeep.png")
                
                
            }else if 2 == value as! Int{
                
                self.view.backgroundColor = #colorLiteral(red: 0.1620297223, green: 0.4949354393, blue: 0.7333416692, alpha: 1)
                backgroundImg.image = UIImage(named:"submarine.png")
            }
            
        }
        
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
        //Get the time and Date
        //Date
        
        let dateDate = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd MMM yy"
        
        let dateResults = formatter.string(from: dateDate)
        whatDateisit = dateResults
        print(whatDateisit)
        
        
        //Delegating the Table
        favTableView.delegate = self
        favTableView.dataSource = self
        //setting the Table to 64 Inches
        favTableView.rowHeight = 70
        
       //Sets up Core Data
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate // UIApplication.shared().delegate as! AppDelegate is now UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let requestProfile = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        requestProfile.sortDescriptors = [NSSortDescriptor(key:"dateofAddFav",ascending:true)]
        requestProfile.returnsObjectsAsFaults = false
        
        
        
        let requestData = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        
        requestData.returnsObjectsAsFaults = false
        
        
        do {
            
            let results = try context.fetch(requestProfile)
            
            for result in results as! [NSManagedObject] {
                
                
                if let commercialPhone = result.value(forKey: "commercialPhoneFav") as? String {
                    //LastAFPTScore.text = String(airmanAFPTScore)
                    print(commercialPhone)
                    phoneOutput = commercialPhone
                    
                   // dsnCommercialLocal = commercialPhone
                }
                if let commercialPhoneNoLbl = result.value(forKey: "commercialPhoneNoLbl") as? String {
                    //LastAFPTScore.text = String(airmanAFPTScore)
                    print(commercialPhoneNoLbl)
                    phoneOutputNoLbl = commercialPhoneNoLbl
                    
                    // dsnCommercialLocal = commercialPhone
                }
                
                
                if let dsnPhone = result.value(forKey: "dsnPhoneFav") as? String {
                    //LastAFPTScore.text = String(airmanAFPTScore)
                    print(dsnPhone)
                    
                    getDsnNumber = dsnPhone
                }
                if let locationPhone = result.value(forKey: "locationFav") as? String {
                    //LastAFPTScore.text = String(airmanAFPTScore)
                    print(locationPhone)
                    DsnLocation = locationPhone
                }
                if let name = result.value(forKey: "nameFav") as? String {
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
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
                let count  = try context.count(for: request)
                return count == 0 ? true : false
            }catch{
                return true
            }
        }
        print("Database is empty:\(isEmpty)")
        //End of Check if Database is empty
        
        if isEmpty == true {
           
            emptyFavlbl.isHidden = false
            emptyFavlbl.text = "No Favorites"
            
        }else {
            //Check for Data in History
        
            emptyFavlbl.isHidden = true
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool ) {
        super.viewWillAppear(animated)
        
        print("ViewWillApear")
        
        favTableView.reloadData()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorites")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key:"dateofAddFav",ascending:false)]
        
        
        do {
            dsnFavoriteDatabase = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("ViewDidAppear")
        favTableView.reloadData()
      
        let appDelegate = UIApplication.shared.delegate as! AppDelegate // UIApplication.shared().delegate as! AppDelegate is now UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        //Check if Database is empty
        var isEmpty : Bool {
            do{
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
                let count  = try context.count(for: request)
                return count == 0 ? true : false
            }catch{
                return true
            }
        }
        print("Database is empty:\(isEmpty)")
        //End of Check if Database is empty
        
        if isEmpty == true {
            
            emptyFavlbl.isHidden = false
            emptyFavlbl.text = "No Favorites"
            
        }else {
            //Check for Data in History
            
            emptyFavlbl.isHidden = true
        }
     
        
    }
    
  
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dsnFavoriteDatabase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = favTableView.dequeueReusableCell(withIdentifier: "FavSegue",for: indexPath) as? FavTableViewCell {
            
            
            let person = dsnFavoriteDatabase[indexPath.row]
            
            
            cell.commercialLbl!.text = person.value(forKeyPath: "commercialPhoneFav")! as? String
             cell.dsnLbl!.text = person.value(forKeyPath: "dsnPhoneFav")! as? String
            cell.locationLbl!.text = person.value(forKeyPath: "locationFav")! as? String
            cell.nameLbl!.text = person.value(forKeyPath: "nameFav")! as? String
           // cell.!.text = person.value(forKeyPath: "dateofAddFav")! as? String
            
            
            return cell
        }
        return UITableViewCell()
        

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let person = dsnFavoriteDatabase[indexPath.row]
        
        let commPhone = person.value(forKey: "commercialPhoneFav")
        let commName = person.value(forKey: "nameFav")
        let commPhoneNoLbl = person.value(forKey: "commercialPhoneNoLbl")
        let dsnPhonelocal = person.value(forKey: "dsnPhoneFav")
        let dsnLocationlocal = person.value(forKey: "locationFav")
        
        let alertVC = PMAlertController(title: "DSN Converter ", description: "Would you like to call \(String(describing: commName!))? ", image: UIImage(named: "img.png"), style: .alert)
        
        
        
        alertVC.addAction(PMAlertAction(title: "Call", style: .default, action: { () in
            print("Capture action OK")
            
            print(commPhone!)
            
            if let url = URL(string: "tel://\(commPhoneNoLbl!))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
            
            self.getTimefromTimer = self.whatTimeisit
            print("Get Time" + self.getTimefromTimer)
            
            // Save Call in Recents
            /*
            
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
            
            
            
            */
            
            
            
            
            
            
            
            
            
        }))
        
        alertVC.addAction(PMAlertAction(title: "Share Contact", style: .default, action: { () -> Void in
            
            
            //Share
            
            
            
            
            let Text = "Commerical: \(String(describing: commPhone!))\n DSN: \(String(describing: dsnPhonelocal!))\n Location: \(String(describing: dsnLocationlocal!)) \nThis commerical DSN was provided to you by DSN Converter."
            // let ActualNumber = "\(self.departmentsPhone[indexPath.row])"
            let activyVC = UIActivityViewController(activityItems:[Text], applicationActivities: nil)
            
            self.present(activyVC,animated: true,completion: nil)
            
            
            
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
        let person = dsnFavoriteDatabase[indexPath.row]
        let recordtoDelete = person.value(forKey: "nameFav") as! String
        
        if editingStyle == .delete {
            
            let moc = getContext()
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
            let result = try? moc.fetch(fetchRequest)
            let resultdata = result as! [Favorites] // result as entity
            
            dsnFavoriteDatabase.remove(at: indexPath.row)
            
            for object in resultdata { // Go through the fetched result
                if object.nameFav == recordtoDelete { // If there is a match
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
    @objc func tick() {
        //Time
        
        let dateDate = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm:ss"
        
        let timeResults = formatter.string(from: dateDate)
        whatTimeisit = "\(timeResults)"
        // print(whatTimeisit)
        
        
    }
    
}


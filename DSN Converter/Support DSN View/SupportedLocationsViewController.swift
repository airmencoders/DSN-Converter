//
//  SupportedLocationsViewController.swift
//  DSN Converter
//
//  Created by Mac Fusion on 11/11/18.
//  Copyright © 2018 ForceMobileStudios. All rights reserved.
//

import UIKit

class SupportedLocationsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    @IBOutlet weak var ChoicesSegs: UISegmentedControl!
    
    @IBOutlet weak var backgroundImg: UIImageView!
    
      @IBOutlet weak var SupportedLocation: UITableView!
  
 
        
            
            var AFdsnNumber: [String] = ["480","479","478","489","452","632","226","268","236","238","676","672","722","535","359"]
            var AFlocations :[String] = ["Ramstein AB","Ramstein AB","Ramstein AB","Vogelweh","Spangdahlem AB","Aviano AB","RAF Lakenheath","RAF Alconbury/Molesworth","RAF Croughton","RAF Mildenhall","Incirlik AB","Incirlik AB","Moron AB","Lajes Field","Volkel AB"]
            var AFcountryArray :[String] = ["Germany","Germany","Germany","Germany","Germany","Italy","United Kindom","United Kindom","United Kindom","United Kindom","Turkey","Turkey","Spain","Portugal","Netherlands"]
            //var AFserviceArray: [String] = ["USAF","USAF","USAF","USAF","USAF","USAF","USAF","USAF","USAF","USAF","USAF","USAF","USAF","USAF","USAF"]
            
            var ARdsnNumber: [String] = ["368","361","597","423","366","590","467","468","440","474","475","569","526","476","599","466","520","522","485","531","545","483","484","493","581","541","542","421","431","430","420","336","337","338","537","546","548","570","634","633","637","360"]
            var ARlocations: [String] = ["USAG - Brussels","Chievres AB/Caserne","Chievres AB/Caserne","SHAPE","SHAPE","Health Services","Ansbach","Bavaria","Bavaria","Bavaria","Bavaria","Bavaria","Bavaria","Bavaria","Bavaria","Bavaria","Bavaria","Bavaria","Baumholder","Baumholder","Schools","Kaiserslautern","Kaiserslautern","Kaiserslautern","Kaiserslautern","Kaiserslautern","Kaiserslautern","Stuttgart","Stuttgart","Stuttgart","Stuttgart","Wiesbaden","Wiesbaden","Wiesbaden","Wiesbaden","Wiesbaden","Wiesbaden","Wiesbaden","USAG Italy","USAG Italy","USAG Italy","Schinnen"]
            var ARcountryArray: [String] = ["Belgium","Belgium","Belgium","Belgium","Belgium","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Germany","Italy","Italy","Italy","Netherlands"]
    
    
            var NAdsnNumber: [String] = ["624","626","629","727"]
            var NAlocations :[String] = ["NAS Sigonella","NSA Geata","NSA Naples","NAVSTA Rota"]
            var NAcountryArray :[String] = ["Italy","Italy","Italy","Spain"]
    
   // @IBOutlet weak var colorDesagnible: DisagnableSignin!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let value = UserDefaults.standard.value(forKey: "dsnService"){
            
            if  0 == value as! Int {
                
                backgroundImg.image = UIImage(named:"aircraft.png")
                self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
                ChoicesSegs.selectedSegmentIndex = 0
                
                
            }else if 1 == value as! Int{
                self.view.backgroundColor = #colorLiteral(red: 0.1572559077, green: 0.4129788669, blue: 0.1819413052, alpha: 1)
                backgroundImg.image = UIImage(named:"jeep.png")
                ChoicesSegs.selectedSegmentIndex = 1
                
            }else if 2 == value as! Int{
                
                self.view.backgroundColor = #colorLiteral(red: 0.1620297223, green: 0.4949354393, blue: 0.7333416692, alpha: 1)
                backgroundImg.image = UIImage(named:"submarine.png")
                ChoicesSegs.selectedSegmentIndex = 2
            }
            
        }
        
        // Do any additional setup after loading the view.
        
        SupportedLocation.delegate = self
        SupportedLocation.dataSource = self
        SupportedLocation.rowHeight = 69
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        
        switch ChoicesSegs.selectedSegmentIndex {
        case 0:
            return AFlocations.count
        case 1:
            return ARlocations.count
        case 2 :
            return NAlocations.count
        default:
            break
            
        }
        
        return 0
    }
    
  
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = SupportedLocation.dequeueReusableCell(withIdentifier: "SupportSegue",for: indexPath) as? SupportTableViewCell  {
                
                
                switch ChoicesSegs.selectedSegmentIndex {
                case 0:
                    cell.locationLbl.text = AFlocations[indexPath.row]
                    cell.dsnNumber.text = AFdsnNumber[indexPath.row]
                    cell.countryLbl.text = AFcountryArray[indexPath.row]
                  //  cell.serviceLbl.text = AFserviceArray[indexPath.row]
                case 1:
                    
                    cell.locationLbl.text = ARlocations[indexPath.row]
                    cell.dsnNumber.text = ARdsnNumber[indexPath.row]
                    cell.countryLbl.text = ARcountryArray[indexPath.row]
                  //  cell.serviceLbl.text = ARserviceArray[indexPath.row]
                case 2:
                    cell.locationLbl.text = NAlocations[indexPath.row]
                    cell.dsnNumber.text = NAdsnNumber[indexPath.row]
                    cell.countryLbl.text = NAcountryArray[indexPath.row]
                    
                default:
                    break
                    
                }
                
                 return cell
            
    
         
                //cell.AfiPicImg.image = SideImage[indexPath.row]
              //  cell.textLabel?.text = Locations[indexPath.row]
                
                
            }
            
            return UITableViewCell()
        }
    @IBAction func segnebtedChaged(_ sender: Any) {
        
        SupportedLocation.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
    }

  
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

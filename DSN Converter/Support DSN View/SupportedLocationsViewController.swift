//
//  SupportedLocationsViewController.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
//


import UIKit

class SupportedLocationsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    @IBOutlet weak var ChoicesSegs: UISegmentedControl!
    
    @IBOutlet weak var backgroundImg: UIImageView!
    
    @IBOutlet weak var SignUpBtn: ButtonModification!
    @IBOutlet weak var SupportedLocation: UITableView!
  
    @IBOutlet weak var NoDataYet: UILabel!
    @IBOutlet weak var ParagrahText: UITextView!
    struct DSNData: Decodable {
        let prefix:Int
        let number: String
        let location: String
        let country: String
        let command: String
    }
        
            var EUCOM = [DSNData]()
    
            
    
   // @IBOutlet weak var colorDesagnible: DisagnableSignin!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NoDataYet.isHidden = true
        ParagrahText.isHidden = true
        SignUpBtn.isHidden = true
        ReadDataJSON()
        if let value = UserDefaults.standard.value(forKey: "dsnService"){
            if  0 == value as! Int {
                self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
            }else if 1 == value as! Int{
                self.view.backgroundColor = #colorLiteral(red: 0.1572559077, green: 0.4129788669, blue: 0.1819413052, alpha: 1)
            }else if 2 == value as! Int{
                self.view.backgroundColor = #colorLiteral(red: 0.1620297223, green: 0.4949354393, blue: 0.7333416692, alpha: 1)
            }
        }
        SupportedLocation.delegate = self
        SupportedLocation.dataSource = self
        SupportedLocation.rowHeight = 69
        
    }
    
    func ReadDataJSON() {
        guard let sourceURL = Bundle.main.url(forResource: "DSNList", withExtension: "json") else {fatalError("File Not Found")}
        guard let DSNDecoderData = try? Data(contentsOf: sourceURL) else {fatalError("DSN Decode Error")}
        let decoder = JSONDecoder()
        do{
        EUCOM = try decoder.decode([DSNData].self, from: DSNDecoderData)
        } catch{
                print("Error")
            }
        SupportedLocation.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        
        switch ChoicesSegs.selectedSegmentIndex {
        case 0:
            NoDataYet.isHidden = true
            ParagrahText.isHidden = true
            SignUpBtn.isHidden = true
            return EUCOM.count
        
        case 1:
            NoDataYet.isHidden = false
            ParagrahText.isHidden = false
            SignUpBtn.isHidden = false
            NoDataYet.text = "Coming Soon"
       
        default:
            break
            
        }
        
        return 0
    }
    
  
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = SupportedLocation.dequeueReusableCell(withIdentifier: "SupportSegue",for: indexPath) as? SupportTableViewCell  {
                
                
                switch ChoicesSegs.selectedSegmentIndex {
                case 0:
                    cell.locationLbl.text = EUCOM[indexPath.row].location
                    cell.dsnNumber.text = String (EUCOM[indexPath.row].prefix)
                    cell.countryLbl.text = EUCOM[indexPath.row].country
                    cell.convertionLbl.text = EUCOM[indexPath.row].number + " XXXX"
                case 1: break
                    
                    
              
                    
                default:
                    break

                }
                 return cell
            }
            
            return UITableViewCell()
        }
    @IBAction func segnebtedChaged(_ sender: Any) {
        
        SupportedLocation.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
    }

  
    @IBAction func SignUpBtn(_ sender: Any) {
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

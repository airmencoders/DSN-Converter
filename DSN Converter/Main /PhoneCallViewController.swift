//
//  PhoneCallViewController.swift
//  DSN Converter
//
//  Created by Mac Fusion on 11/25/18.
//  Copyright © 2018 ForceMobileStudios. All rights reserved.
//

import UIKit
import CoreData
import ContactsUI
import PMAlertController


class PhoneCallViewController:
UIViewController,CNContactViewControllerDelegate{
    
    
    
    ///////////////////////////
    ///////////////////////////////////                                                  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ///////////////////////////////////////////                 STORAGE AREA                        ////////////////////////////\\\\\\\\\\\\\
    /////////////////////////////////////////////////                                              \\\\\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    //Ramstein - Germany - USAF
    let Ext480Lbl = "+49 6371 47"
    let Ext480NoLbl = "+49637147"
    let Ext478Lbl = "+49 6371 405"
    let Ext478NoLbl = "+496371405"
    let Ext479Lbl = "+49 6371 46"
    let Ext479NoLbl = "+49637146"
    let Ext489Lbl = "+49 631 536"
    let Ext489NoLbl = "+49631536"
    
    
   
    
    
    //Spangdahlem - Germany - USAF
    let Ext452Lbl = "+49 6565 61"
    let Ext452NoLbl = "+49656561"
    //let Ext496Lbl = "06302-67"
    // let Ext496NoLbl = "0630267"
    //  let Ext486Lbl = "06371-86"
    // let Ext486NoLbl = "0637186"
    
    
    //Aviano - Italy - USAF
    let Ext632Lbl = "+39 0434 30"
    let Ext632NoLbl = "+39043430"
    
    
    //United Kindom - USAF
    
    //RAF Lakenheath - UK - USAF
    let Ext226Lbl = "+44 1638 52"
    let Ext226NoLbl = "+44163852"
    //RAF ALCONBURY/MOLESWORTH - UK - USAF
    let Ext268Lbl = "+44 1480 84"
    let Ext268NoLbl = "+44148084"
    //RAF Croughton - UK - USAF
    let Ext236Lbl = "+44 1280 70"
    let Ext236NoLbl = "+44128070"
    //RAF Mildenhall - UK - USAF
    let Ext238Lbl = "+44 1638 54"
    let Ext238NoLbl = "+44163852"
    
    // TURKEY - USAF
    
    //INCIRLIK AB
    let Ext676Lbl = "+90 322 316"
    let Ext676NoLbl = "+90322316"
    let Ext672Lbl = "+90 312 422"
    let Ext672NoLbl = "+90312422"
    
    
    // SPAIN - MORON - USAF
    let Ext722Lbl = "+34 95 584"
    let Ext722NoLbl = "+3495584"
    
    // PORTGUGAL - LAJES FIELD - USAF
    
    let Ext535Lbl = "+351 295 57"
    let Ext535NoLbl = "+35129557"
    
    // NETHERLANDS - VOLKEL AIR BASE - USAF
    
    let Ext359Lbl = "+31 413 33"
    let Ext359NoLbl = "+3141333"
    
    
    
    
    
    /////////////////////////////----------------------------/////////////////////////////////////////////////////////////////////////U.S ARMY ///////////////////////////////////////////
    
    
    // BELGIUM - USAG BENELUX (BRUSSELS)
    
 
    
    let Ext368Lbl = "+32 02717"
    let Ext368NoLbl = "+3202717"
    
   // let Ext566Lbl = "+32 02686"
   // let Ext566NoLbl = "+3202686"
    
    // BELGIUM - Chièvres Air Base/Caserne Daumerie
    
    let Ext361Lbl = "+32 06827"
    let Ext361NoLbl = "+3206827"
    
    let Ext597Lbl = "+32 06825"
    let Ext597NoLbl = "+3206825"
    
    // BELGIUM - SHAPE
    
    
    let Ext423Lbl = "+32 06544"
    let Ext423NoLbl = "+3206544"
    
    let Ext366Lbl = "+32 06532"
    let Ext366NoLbl = "+3206532"
    
    
    //Landstuhl - Germany - ARMY
    let Ext590Lbl = "+49 6371 9464"
    let Ext590NoLbl = "+4963719464"
    
    //GERMANY - USAG ANSBACH
    
    let Ext467Lbl = "+49 9802 83"
    let Ext467NoLbl = "+49980283"
    
    let Ext468Lbl = "+49 9811 83"
    let Ext468NoLbl = "+49981183"
    
    // GERMANY - USAG BAVARIA - Garmisch
    
    let Ext440Lbl = "+49 8821 750"
    let Ext440NoLbl = "+498821750"
    
    // GERMANY - USAG BAVARIA - Grafenwoehr/Vilsek
    //474 - 9641-454
    let Ext474Lbl = "+49 9641 454"
    let Ext474NoLbl = "+499641454"
    
    // GERMANY - USAG BAVARIA - Grafenwoehr/Vilsek
    //475 - 9641-83
    let Ext475Lbl = "+49 9641 83"
    let Ext475NoLbl = "+49964183"
    
    // GERMANY - USAG BAVARIA - Grafenwoehr/Vilsek
    //
    let Ext569Lbl = "+49 9641 70 569"
    let Ext569NoLbl = "+49964170569"
    
    // GERMANY - USAG BAVARIA - Grafenwoehr/Vilsek
    //
    let Ext526Lbl = "+49 9641 70 526"
    let Ext526NoLbl = "+49964170526"
    
    // GERMANY - USAG BAVARIA - Grafenwoehr/Vilsek
    //
    let Ext476Lbl = "+49 9662 83"
    let Ext476NoLbl = "+49966283"
    
    // GERMANY - USAG BAVARIA - Grafenwoehr/Vilsek
    //
    let Ext599Lbl = "+49 9641 70 599"
    let Ext599NoLbl = "+49964170599"
    
    // GERMANY - USAG BAVARIA - Grafenwoehr/Vilsek
    //
    let Ext466Lbl = "+49 9472 83"
    let Ext466NoLbl = "+49947283"
    
    // GERMANY - USAG BAVARIA - Grafenwoehr/Vilsek
    //
    let Ext520Lbl = "+49 9472 83"
    let Ext520NoLbl = "+49947283"
    
    // GERMANY - USAG BAVARIA - Grafenwoehr/Vilsek
    //
    let Ext522Lbl = "+49 9472 708"
    let Ext522NoLbl = "+499472708"
    
    // GERMANY - BAUMHOLDER
    let Ext485Lbl = "+49 678 36"
    let Ext485NoLbl = "+4967836"
    
    // GERMANY - BAUMHOLDER
    let Ext531Lbl = "+49 611 143 531"
    let Ext531NoLbl = "+49611143531"
    
    // GERMANY - SCHOOL
    let Ext545Lbl = "+49 611 143 545"
    let Ext545NoLbl = "+49611143545"
    // GERMANY - Kaiserslautern
    let Ext483Lbl = "+49 631 411"
    let Ext483NoLbl = "+49631411"
    
    // GERMANY - Kaiserslautern
    let Ext484Lbl = "+49 631 413"
    let Ext484NoLbl = "+49631413"
    // GERMANY - Kaiserslautern
    let Ext493Lbl = "+49 631 3406"
    let Ext493NoLbl = "+496313406"
    // GERMANY - Kaiserslautern
    let Ext581Lbl = "+49 631 411"
    let Ext581NoLbl = "+49631411"
    
    // GERMANY - Kaiserslautern
    let Ext541Lbl = "+49 6111 43 541"
    let Ext541NoLbl = "+49611143541"
    
    // GERMANY - Stuttgart
    let Ext421Lbl = "+49 7117 29"
    let Ext421NoLbl = "+49711729"
    
    // GERMANY - Stuttgart
    let Ext431Lbl = "+49 7031 15"
    let Ext431NoLbl = "+49703115"
    // GERMANY - Stuttgart
    let Ext430Lbl = "+49 7116 80"
    let Ext430NoLbl = "+49711680"
    
    // GERMANY - Stuttgart
    let Ext420Lbl = "+49 7118 19"
    let Ext420NoLbl = "+49711819"
    
    // GERMANY - Wiesbaden
    let Ext336Lbl = "+49 6118 16"
    let Ext336NoLbl = "+49611816"
    // GERMANY - Wiesbaden
    let Ext337Lbl = "+49 6117 05"
    let Ext337NoLbl = "+49611705"
    // GERMANY - Wiesbaden
    let Ext338Lbl = "+49 6113 80"
    let Ext338NoLbl = "+49611380"
    // GERMANY - Wiesbaden
    let Ext537Lbl = "+49 6111 43 537"
    let Ext537NoLbl = "+49611143537"
    
    // GERMANY - Wiesbaden
    let Ext546Lbl = "+49 6111 43 546"
    let Ext546NoLbl = "+49611143546"
    
    // GERMANY - Wiesbaden
    let Ext548Lbl = "+49 6111 43 548"
    let Ext548NoLbl = "+49611143548"
    // GERMANY - Wiesbaden
    let Ext570Lbl = "+49 6119 744"
    let Ext570NoLbl = "+496119744"
    
    
    // ITALY ////////////////////// US ARMY /////////////////// ITALY /////////////////////US ARMY \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    // ITALY - USAG Italy
    let Ext634Lbl = "+39 0444 71"
    let Ext634NoLbl = "+39044471"
    // ITALY - USAG Italy
    let Ext637Lbl = "+39 0444 61"
    let Ext637NoLbl = "+39044461"
    // ITALY - USAG Italy
    let Ext633Lbl = "+39 050 54"
    let Ext633NoLbl = "+3905054"
// NETHELANDs ////////////////////// US ARMY /////////////////// NETHELANDS /////////////////////US ARMY \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    // NETHERLANDS - SCHINNEN
    let Ext360Lbl = "+31 046 443"
    let Ext360NoLbl = "+31046443"
    
    
     /////////////////////////////----------------------------//////////U.S NAVY ////////////U.S NAVY //////////////////////////////
    
    // ITALY - NAS Sigonella
    let Ext624Lbl = "+39 095 56"
    let Ext624NoLbl = "+3909556"
    // ITALY - NSA Geata
    let Ext626Lbl = "+39 081 568"
    let Ext626NoLbl = "+39081568"
    // ITALY - NSA Naples
    let Ext629Lbl = "+39 081 811"
    let Ext629NoLbl = "+39081811"
    // SPAIN - Naval Station Rota
    let Ext727Lbl = "+34 956 82"
    let Ext727NoLbl = "+3495682"
    
    
    
    
    
    
    
    
    
    
    
    ///////////////////////////
    ///////////////////////////////////                            END OF                      \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ///////////////////////////////////////////                 STORAGE AREA                        ////////////////////////////\\\\\\\\\\\\\
    /////////////////////////////////////////////////                                              \\\\\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var lblUpgrade: UILabel!
    
    var getDsnNumber = ""
   
    //Testing Interstitial
    
    
    
    @IBOutlet weak var favBtn: ButtonModification!
    @IBOutlet weak var contactBtn: ButtonModification!
    @IBOutlet weak var sharebtn: ButtonModification!
    @IBOutlet weak var learnMoreBtn: ButtonModification!
    @IBOutlet weak var DsnNotFound: UIView!
    
    @IBOutlet weak var callBtn: ButtonModification!
    
    @IBOutlet weak var CallView: UIView!
    
    
    var showAds: String!
    var seconds = 100
    var dsnRecentDatabase: [NSManagedObject] = []
    var managedObjectContext : NSManagedObjectContext?
    var phoneOutput = ""
    var phoneOutPutNoLbl = ""
    var whatDateisit = ""
    var whatTimeisit = ""
    
    
    
    
    
    @IBOutlet weak var SubmitBtn: ButtonModification!
    // var getDsnNumber = ""
    var DsnLocation = ""
    var timer = Timer()
    var getTimefromTimer = ""
    @IBOutlet weak var commLbl: UILabel!
    
    @IBOutlet weak var LocationLbl: UILabel!
    @IBOutlet weak var dsnLbl: UILabel!
    //video ads
    
    @IBOutlet weak var reportaCorrection: UIButton!
  
    
    @IBOutlet weak var backgroundImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDsnNumber =  dsnPhoneGlobal
     
        
        
        if let value = UserDefaults.standard.value(forKey: "dsnService"){
            
            if  0 == value as! Int {
                
                backgroundImg.image = UIImage(named:"aircraft-2.png")
              //  self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
                
                
            }else if 1 == value as! Int{
              //  self.view.backgroundColor = #colorLiteral(red: 0.1572559077, green: 0.4129788669, blue: 0.1819413052, alpha: 1)
                backgroundImg.image = UIImage(named:"jeep-2.png")
                
                
            }else if 2 == value as! Int{
                
             //   self.view.backgroundColor = #colorLiteral(red: 0.1620297223, green: 0.4949354393, blue: 0.7333416692, alpha: 1)
                backgroundImg.image = UIImage(named:"submarine-2.png")
            }
            
        }
        
        
        
    
        
      
        
        
        
       
        
        
        
        //Checks that its a DSN by checking for 7 digits
        //if getDsnNumber.count == 8 {
        
        
        
        //Devides the Area code with "-" from the rest of the number
        if getDsnNumber.range(of: "-") != nil {
            
                 
                CallView.isHidden = false
             DsnNotFound.isHidden = true
             reportaCorrection.isHidden = false

            
                let inputComponets = getDsnNumber.characters.split {$0 == "-"}.map { (x) -> String in return String(x)}
                
                let areaCode = inputComponets [0]
                let phoneNumber = inputComponets [1]
                //Shows Area Code & Phone number
                print (String(areaCode))
                print (String(phoneNumber))
                
                //Check the number for the Area Code
                
                if areaCode == "480" {
                 
                    
                    phoneOutput = Ext480Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext480NoLbl + phoneNumber
                    DsnLocation = "Ramstein AB"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                }else if areaCode == "479" {
                    
                    phoneOutput = Ext479Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext479NoLbl + phoneNumber
                    DsnLocation = "Ramstein AB"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                }else if areaCode == "489"{
                    
                    phoneOutput = Ext489Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext489NoLbl + phoneNumber
                    DsnLocation = "Ramstein AB"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                }else if areaCode == "478" {
                    phoneOutput = Ext478Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext478NoLbl + phoneNumber
                    DsnLocation = "Ramstein AB"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                }else if areaCode == "452"{
                    
                    phoneOutput = Ext452Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext452NoLbl + phoneNumber
                    DsnLocation = "Spangdahlem AB"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                }else if areaCode == "632" {
                    phoneOutput = Ext632Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext632NoLbl + phoneNumber
                    DsnLocation = "Aviano AB"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                }else if areaCode == "226"{
                    
                    phoneOutput = Ext226Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext226NoLbl + phoneNumber
                    DsnLocation = "RAF Lakenheath"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "268"{
                    
                    phoneOutput = Ext268Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext268NoLbl + phoneNumber
                    DsnLocation = "RAF Alconbury/Molesworth"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "236"{
                    
                    phoneOutput = Ext236Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext236NoLbl + phoneNumber
                    DsnLocation = "RAF Croughton"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "238"{
                    
                    phoneOutput = Ext238Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext238NoLbl + phoneNumber
                    DsnLocation = "RAF Mildenhall"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "676"{
                    
                    phoneOutput = Ext676Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext676NoLbl + phoneNumber
                    DsnLocation = "Incirlik Air Base"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "672"{
                    
                    phoneOutput = Ext672Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext672NoLbl + phoneNumber
                    DsnLocation = "Incirlik Air Base"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "722"{
                    
                    phoneOutput = Ext722Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext722NoLbl + phoneNumber
                    DsnLocation = "Moron Air Base"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "535"{
                    
                    phoneOutput = Ext535Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext535NoLbl + phoneNumber
                    DsnLocation = "Lajes Field"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "359"{
                    
                    phoneOutput = Ext359Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext359NoLbl + phoneNumber
                    DsnLocation = "Volkel Air Base"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    /////////////////////// US ARMY //// /// // // / / /
                    
                        ////////////////////// BELGIUM //////////////////////////
                }else if areaCode == "566"{
                    
                    phoneOutput = "Unsupported."
                //    phoneOutput = Ext566Lbl + "" + phoneNumber
                 //   phoneOutPutNoLbl = Ext566NoLbl + phoneNumber
                    DsnLocation = "N/A"
                   LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                
                }else if areaCode == "368"{
                    
                    phoneOutput = Ext368Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext368NoLbl + phoneNumber
                    DsnLocation = "USAG - Brussels"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                    
                }else if areaCode == "361"{
                    
                    phoneOutput = Ext361Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext361NoLbl + phoneNumber
                    DsnLocation = "Chievres AB/Caserne"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                    
                }else if areaCode == "597"{
                    
                    phoneOutput = Ext597Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext597NoLbl + phoneNumber
                    DsnLocation = "Chievres AB/Caserne"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                    
                }else if areaCode == "423"{
                    
                    phoneOutput = Ext423Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext423NoLbl + phoneNumber
                    DsnLocation = "SHAPE"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                    
                }else if areaCode == "366"{
                    
                    phoneOutput = Ext366Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext366NoLbl + phoneNumber
                    DsnLocation = "SHAPE"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                    
                }
                    
                    ////////////////////// GERMANY //////////////////////////
                    
                else if areaCode == "590" {
                    phoneOutput = Ext590Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext590NoLbl + phoneNumber
                    DsnLocation = "Health Services"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }    else if areaCode == "467" {
                    phoneOutput = Ext467Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext467NoLbl + phoneNumber
                    DsnLocation = "Ansbach"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }    else if areaCode == "468" {
                    phoneOutput = Ext468Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext468NoLbl + phoneNumber
                    DsnLocation = "Bavaria"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }   else if areaCode == "440" {
                    phoneOutput = Ext440Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext440NoLbl + phoneNumber
                    DsnLocation = "Bavaria"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                } else if areaCode == "474" {
                    phoneOutput = Ext474Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext474NoLbl + phoneNumber
                    DsnLocation = "Bavaria"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "475" {
                    phoneOutput = Ext475Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext475NoLbl + phoneNumber
                    DsnLocation = "Bavaria"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "569" {
                    phoneOutput = Ext569Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext569NoLbl + phoneNumber
                    DsnLocation = "Bavaria"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "526" {
                    phoneOutput = Ext526Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext526NoLbl + phoneNumber
                    DsnLocation = "Bavaria"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "476" {
                    phoneOutput = Ext476Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext476NoLbl + phoneNumber
                    DsnLocation = "Bavaria"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "599" {
                    phoneOutput = Ext599Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext599NoLbl + phoneNumber
                    DsnLocation = "Bavaria"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "466" {
                    phoneOutput = Ext466Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext466NoLbl + phoneNumber
                    DsnLocation = "Bavaria"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "520" {
                    phoneOutput = Ext520Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext520NoLbl + phoneNumber
                    DsnLocation = "Bavaria"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "522" {
                    phoneOutput = Ext522Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext522NoLbl + phoneNumber
                    DsnLocation = "Bavaria"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "485" {
                    phoneOutput = Ext485Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext485NoLbl + phoneNumber
                    DsnLocation = "Baumholder"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "531" {
                    phoneOutput = Ext531Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext531NoLbl + phoneNumber
                    DsnLocation = "Baumholder"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                    
                }else if areaCode == "545" {
                    phoneOutput = Ext545Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext545NoLbl + phoneNumber
                    DsnLocation = "Schools"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                 
                }else if areaCode == "483" {
                    phoneOutput = Ext483Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext483NoLbl + phoneNumber
                    DsnLocation = "Kaiserslautern"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "484" {
                    phoneOutput = Ext484Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext484NoLbl + phoneNumber
                    DsnLocation = "Kaiserslautern"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "493" {
                    phoneOutput = Ext493Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext493NoLbl + phoneNumber
                    DsnLocation = "Kaiserslautern"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "581" {
                    phoneOutput = Ext581Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext581NoLbl + phoneNumber
                    DsnLocation = "Kaiserslautern"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "541" {
                    phoneOutput = Ext541Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext541NoLbl + phoneNumber
                    DsnLocation = "Kaiserslautern"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "421" {
                    phoneOutput = Ext421Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext421NoLbl + phoneNumber
                    DsnLocation = "Stuttgart"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "431" {
                    phoneOutput = Ext431Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext431NoLbl + phoneNumber
                    DsnLocation = "Stuttgart"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "430" {
                    phoneOutput = Ext430Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext430NoLbl + phoneNumber
                    DsnLocation = "Stuttgart"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "420" {
                    phoneOutput = Ext420Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext420NoLbl + phoneNumber
                    DsnLocation = "Stuttgart"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "336" {
                    phoneOutput = Ext336Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext336NoLbl + phoneNumber
                    DsnLocation = "Wiesbaden"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "337" {
                    phoneOutput = Ext337Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext337NoLbl + phoneNumber
                    DsnLocation = "Wiesbaden"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "338" {
                    phoneOutput = Ext338Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext338NoLbl + phoneNumber
                    DsnLocation = "Wiesbaden"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "537" {
                    phoneOutput = Ext537Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext537NoLbl + phoneNumber
                    DsnLocation = "Wiesbaden"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "546" {
                    phoneOutput = Ext546Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext546NoLbl + phoneNumber
                    DsnLocation = "Wiesbaden"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "548" {
                    phoneOutput = Ext548Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext548NoLbl + phoneNumber
                    DsnLocation = "Wiesbaden"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "570" {
                    phoneOutput = Ext570Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext570NoLbl + phoneNumber
                    DsnLocation = "Wiesbaden"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "634" {
                    phoneOutput = Ext634Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext634NoLbl + phoneNumber
                    DsnLocation = "USAG Italy"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "633" {
                    phoneOutput = Ext633Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext633NoLbl + phoneNumber
                    DsnLocation = "USAG Italy"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "637" {
                    phoneOutput = Ext637Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext637NoLbl + phoneNumber
                    DsnLocation = "USAG Italy"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }else if areaCode == "360" {
                    phoneOutput = Ext360Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext360NoLbl + phoneNumber
                    DsnLocation = "Schinnen"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }
                    
                    /////////////////////// US NAVY //// /// // // / / /
                    
                    ////////////////////// ITALY //////////////////////////
                    
                else if areaCode == "624" {
                    phoneOutput = Ext624Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext624NoLbl + phoneNumber
                    DsnLocation = "NAS Sigonella"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }
                else if areaCode == "626" {
                    phoneOutput = Ext626Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext626NoLbl + phoneNumber
                    DsnLocation = "NSA Geata"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }
                else if areaCode == "629" {
                    phoneOutput = Ext629Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext629NoLbl + phoneNumber
                    DsnLocation = "NSA Naples"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }
                else if areaCode == "727" {
                    phoneOutput = Ext727Lbl + "" + phoneNumber
                    phoneOutPutNoLbl = Ext727NoLbl + phoneNumber
                    DsnLocation = "NAVSTA Rota"
                    LocationLbl.text = DsnLocation
                    dsnLocationGlobal = DsnLocation
                    
                }
                    
                    
                
                else {
                    
                    print("Incorrect")
                    
                    phoneOutput = "DSN Not Found"
                   // phoneOutPutNoLbl = Ext632NoLbl + phoneNumber
                    DsnLocation = "Unknown"
                    LocationLbl.text = DsnLocation
                    callBtn.isEnabled = false
                    callBtn.alpha = 0.5
                    favBtn.isEnabled = false
                    favBtn.alpha = 0.5
                    contactBtn.isEnabled = false
                    contactBtn.alpha = 0.5
                    sharebtn.isEnabled = false
                    sharebtn.alpha = 0.5
                 
                        CallView.isHidden = true
                        DsnNotFound.isHidden = false
                        reportaCorrection.isHidden = true
                    
            }
                
                
    
            
            
            
            commLbl.text = phoneOutput
            dsnLbl.text = getDsnNumber
            dnsCommercialGlobal = phoneOutput
            dsnPhoneGlobal = getDsnNumber
            
            
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
 
        
        
        
        
        //Make the Call
        if let url = URL(string: "tel://\(self.phoneOutPutNoLbl ))"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Recent",
                                                in: managedContext)!
        
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        person.setValue(phoneOutPutNoLbl, forKey: "commercialPhoneNoLbl")
        person.setValue(phoneOutput, forKeyPath: "commercialPhone")
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
    
    @IBAction func Favorite(_ sender: Any) {
        
     //    dismiss(animated: true, completion: nil)
        dnsCommercialGlobal = phoneOutput
        dnsCommercialGlobalNoLbl = phoneOutPutNoLbl
        dsnPhoneGlobal = getDsnNumber
        dsnLocationGlobal = DsnLocation
        dsnDateGlobal = whatDateisit
        dsnTimeGlobal = whatTimeisit
        performSegue(withIdentifier: "SaveFav", sender: nil)
       
        
        
    }
    
    
    @IBAction func SaveContacts(_ sender: Any) {
        
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
        
        
        
        
        let Text = "Commerical: \(phoneOutput)\n DSN: \(getDsnNumber)\n Location: \(DsnLocation) \nThis commerical DSN was provided to you by DSN Europe.\n Download it free on the App Store."
        // let ActualNumber = "\(self.departmentsPhone[indexPath.row])"
        let activyVC = UIActivityViewController(activityItems:[Text], applicationActivities: nil)
        
        self.present(activyVC,animated: true,completion: nil)
        
        
        
        
    }
   
    
}
extension PhoneCallViewController {
    
    
    
    
    
    
}

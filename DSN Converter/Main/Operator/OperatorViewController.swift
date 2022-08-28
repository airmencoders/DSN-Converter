//
//  OperatorViewController.swift
//  DSN Converter
//
//  Created by Roger Rivl on 8/18/22.
//  Copyright © 2022 ForceMobileStudios. All rights reserved.
//

import UIKit

class OperatorViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var operatorsTableView: UITableView!

    let operatorsData:[(operator: String, phoneNumber: String)] = [("🇩🇪 Germany", "+49 6371 471110"), ("🇵🇹 Portugal","+351 295 571110"),("🇬🇧 United Kingdom", "+44 163 8521110"), ("🇮🇹 Italy", "+39 043 4301110"), ("🇹🇷 Turkey", "+90 322 3161110"), ("🇪🇸Spain","+34 955 848111"),("🇺🇸 United States","+1 707 424 1110")]


    override func viewDidLoad() {
        operatorsTableView.delegate = self
        operatorsTableView.dataSource = self
        operatorsTableView.rowHeight = 70

//        if let value = UserDefaults.standard.value(forKey: "dsnService"){
//            if  0 == value as! Int {
//                self.view.backgroundColor = #colorLiteral(red: 0.1045187339, green: 0.2495509088, blue: 0.4657436013, alpha: 1)
//            }else if 1 == value as! Int{
//                self.view.backgroundColor = #colorLiteral(red: 0.1572559077, green: 0.4129788669, blue: 0.1819413052, alpha: 1)
//            }else if 2 == value as! Int{
//                self.view.backgroundColor = #colorLiteral(red: 0.1620297223, green: 0.4949354393, blue: 0.7333416692, alpha: 1)
//            }
//        }
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        operatorsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = operatorsTableView.dequeueReusableCell(withIdentifier: "operatorsSegue",for: indexPath) as? OperatorTableViewCell {
            cell.countryLbl!.text = operatorsData[indexPath.row].operator
            cell.phoneLbl!.text =  operatorsData[indexPath.row].phoneNumber
            return cell
        }
        return UITableViewCell()
    }
    // Tap to call
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let operatorsPhone = operatorsData[indexPath.row].phoneNumber.replacingOccurrences(of: " ", with: "")

        print(operatorsPhone)
      
        if let url = URL(string: "tel://\(operatorsPhone))"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }

    }
    func tableView(_ tableView: UITableView,
                       trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Call action
        let call = UIContextualAction(style: .normal,
                                         title: "Call") { [weak self] (action, view, completionHandler) in
            self?.handleMakeACall(indexValue: indexPath.row)
                                            completionHandler(true)
        }
        call.backgroundColor = .systemBlue
        call.image = UIImage(systemName: "phone.circle")

        // Share action
        let share = UIContextualAction(style: .normal,
                                         title: "Share") { [weak self] (action, view, completionHandler) in
            self?.handleShare(indexValue: indexPath.row)
                                            completionHandler(true)
        }
        share.backgroundColor = .systemGray
        share.image = UIImage(systemName:"square.and.arrow.up.circle")
        return UISwipeActionsConfiguration(actions: [share,call])
    }

    private func handleMakeACall(indexValue:Int) {
        let operatorsPhone = operatorsData[indexValue].phoneNumber.replacingOccurrences(of: " ", with: "")
        if let url = URL(string: "tel://\(operatorsPhone))"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

    private func handleShare(indexValue:Int) {
        let operatorsPhone = operatorsData[indexValue].phoneNumber.replacingOccurrences(of: " ", with: "")
        let countryOperator = operatorsData[indexValue].operator

        let Text =  "Switchboard Operator: \(operatorsPhone)\n Operator Location: \(countryOperator)\n\n Download DSN Europe free on the App Store."
        let activyVC = UIActivityViewController(activityItems:[Text], applicationActivities: nil)
        self.present(activyVC,animated: true,completion: nil)

    }


}







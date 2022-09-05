//
//  SupportTableViewCell.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
//


import UIKit

class SupportTableViewCell: UITableViewCell {

    @IBOutlet weak var dsnNumber: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var convertionLbl: UILabel!
    @IBOutlet weak var serviceLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

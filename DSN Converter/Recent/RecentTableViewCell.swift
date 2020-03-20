//
//  RecentTableViewCell.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
//


import UIKit

class RecentTableViewCell: UITableViewCell {
    @IBOutlet var timeLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var locationLbl: UILabel!
    @IBOutlet var dsnLbl: UILabel!
    @IBOutlet var commercialLbl: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

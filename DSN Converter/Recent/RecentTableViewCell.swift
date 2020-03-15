//
//  RecentTableViewCell.swift
//  DSN Converter
//
//  Created by Mac Fusion on 11/10/18.
//  Copyright © 2018 ForceMobileStudios. All rights reserved.
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

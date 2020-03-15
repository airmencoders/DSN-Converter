//
//  SupportTableViewCell.swift
//  DSN Converter
//
//  Created by Mac Fusion on 11/11/18.
//  Copyright © 2018 ForceMobileStudios. All rights reserved.
//

import UIKit

class SupportTableViewCell: UITableViewCell {

    @IBOutlet weak var dsnNumber: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
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

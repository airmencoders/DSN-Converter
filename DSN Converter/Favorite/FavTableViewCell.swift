//
//  FavTableViewCell.swift
//  DSN Converter
//
//  Created by Mac Fusion on 11/12/18.
//  Copyright © 2018 ForceMobileStudios. All rights reserved.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var commercialLbl: UILabel!
    @IBOutlet weak var dsnLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  ContactsTableViewCell.swift
//  DSN Converter
//
//  Created by Mac Fusion on 11/15/18.
//  Copyright © 2018 ForceMobileStudios. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var dsnLbl: UILabel!
    @IBOutlet weak var commLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

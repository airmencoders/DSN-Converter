//
//  FavTableViewCell.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
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

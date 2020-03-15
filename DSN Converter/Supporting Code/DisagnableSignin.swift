//
//  DisagnableSignin.swift
//  AADD RAB
//
//  Created by Mac Fusion on 9/2/17.
//  Copyright © 2017 DnRtek. All rights reserved.
//

import UIKit
import CoreData
@IBDesignable class DisagnableSignin: UIView {

    @IBInspectable var cornerRadius :CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            
        }
        
    }
    

}

//
//  ButtonModification.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
//


import UIKit

@IBDesignable class ButtonModification: UIButton {

    @IBInspectable var cornerRadius :CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            
        }
        
    }

    @IBInspectable var borderColor : UIColor = UIColor.clear  {
        didSet {
            self.layer.borderColor = borderColor.cgColor
            
        }
        
    }
    @IBInspectable var BorderWidth :CGFloat = 0.1 {
        didSet {
            self.layer.borderWidth = BorderWidth
            
        }
        
    }
    
    
    
    
}

//
//  DisagnableSignin.swift
//  DSN Converter
//
//  Created by Roger Rivl on 11/9/18.
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

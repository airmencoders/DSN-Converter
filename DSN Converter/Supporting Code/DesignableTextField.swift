//
//  DesignableTextField.swift
//  AADD RAB
//
//  Created by Mac Fusion on 9/2/17.
//  Copyright © 2017 DnRtek. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField {

    @IBInspectable var leftImage: UIImage? {
        
        didSet{
            
            updateView()
        
            
        }
        
        
        
    }
    
    @IBInspectable var leftPadding : CGFloat = 0 {
        
        didSet {
            updateView()
            
        }
        
    }
    
    func updateView() {
        if let image = leftImage {
            
            
            leftViewMode = .always
            
            let imageView = UIImageView(frame: CGRect (x:leftPadding, y:0, width: 20, height: 20))
           
            imageView.image = image
            var width = leftPadding + 20
            
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                
                width += 8
                
            }
            let view = UIView(frame:CGRect(x: 0, y: 0, width: width, height: 20))
            
            view.addSubview(imageView)
            
            leftView = view
            
        }else {
            leftViewMode = .never
            
            
            
        }
        
        
    }

}

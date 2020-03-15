//
//  PhoneDigitOrg.swift
//  DSN Converter
//
//  Created by Mac Fusion on 11/9/18.
//  Copyright © 2018 ForceMobileStudios. All rights reserved.
//

import UIKit

class PhoneDigitOrg: NSObject {
    public var number: String?
    public var letters: String?
    init(number: String, letters: String) {
        self.number = number
        self.letters = letters
    }
}


//
//  PhoneDigitOrg.swift
//  DSN Converter
//
//  Created by https://github.com/IamSaurav/BMDialPad
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


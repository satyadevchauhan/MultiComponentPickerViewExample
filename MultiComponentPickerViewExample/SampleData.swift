//
//  SampleData.swift
//  MultiComponentPickerViewExample
//
//  Created by Satyadev Chauhan on 14/01/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import UIKit

struct SampleData {
    static let countries = ["IND", "USA", "UK", "NZ"]
    static let points = ["10", "20", "30", "40", "50", "60", "70", "80", "90"]
}

extension String {
    
    func countryAttribute() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.font, value: UIFont(name: "HelveticaNeue", size: 16)!, range: NSRange(location: 0, length: self.count))
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: self.count))
        return attributedString
    }
    
    func pointAttribute() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.font, value: UIFont(name: "HelveticaNeue-Italic", size: 16)!, range: NSRange(location: 0, length: self.count))
        attributedString.addAttribute(.foregroundColor, value: UIColor.green, range: NSRange(location: 0, length: self.count))
        return attributedString
    }
}

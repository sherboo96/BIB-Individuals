//
//  LabelEx.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 15/09/2021.
//

import UIKit

extension UILabel {
    func setActivePart(orignalText: String, hyberText: [String], hyberTextColor: [String], hyberTextFont: [UIFont]) {
        let text = orignalText
        self.text = text
        let underlineAttriString = NSMutableAttributedString(string: text)
        
        for idx in 0 ..< hyberText.count {
            let range = (text as NSString).range(of: hyberText[idx])
            underlineAttriString.addAttribute(NSAttributedString.Key.font, value: hyberTextFont[idx], range: range)
            underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.hexStringToUIColor(hex: hyberTextColor[idx]), range: range)
        }
        
        self.attributedText = underlineAttriString
        self.isUserInteractionEnabled = true
    }
}

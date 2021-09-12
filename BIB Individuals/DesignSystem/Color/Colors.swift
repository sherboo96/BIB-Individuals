//
//  Colors.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import UIKit.UIColor

extension DesignSystem {
    enum Colors: String {
        case primary = "Primary"
        case secondary = "Secondary"
        case textPrimary = "TextPrimary"
        case textSecondary = "TextSecondary"
        case textError = "TextError"
        case white = "White"
        
        var color: UIColor {
                return UIColor(named: self.rawValue)!
        }
    }
}

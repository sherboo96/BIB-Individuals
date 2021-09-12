//
//  Fonts.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import Foundation

enum Fonts: String {
    case regular = "Poppins-Regular"
    case semiBold = "Poppins-SemiBold"
    case medium = "Poppins-Medium"
    case bold = "Poppins-Bold"

    var name: String {
        return self.rawValue
    }
}

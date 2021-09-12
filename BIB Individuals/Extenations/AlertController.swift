//
//  AlertController.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import UIKit
import FTIndicator

extension UIAlertController {
    static func showAlertMessage(_ message: String) {
        FTIndicator.showNotification(withTitle: kAppName , message: message)
    }
    
}

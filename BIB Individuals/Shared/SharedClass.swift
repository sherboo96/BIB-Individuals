//
//  SharedClass.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import Foundation

final class SharedClass {
    static var sharedManager = SharedClass()
    
    var user: UserInfo?
    
    func signout() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
    }
}

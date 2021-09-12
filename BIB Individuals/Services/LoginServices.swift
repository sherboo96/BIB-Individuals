//
//  LoginServices.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import Foundation

class LoginServices {
    static let instance = LoginServices()
    
    func loginAPICall(callback: @escaping (UserInfo, Error?) -> ()) {
        let userData: UserInfo = UserInfo(userID: "18202224", userName: "Mahmoud", address: "Benha", profile: "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg")
        callback(userData, nil)
    }
}

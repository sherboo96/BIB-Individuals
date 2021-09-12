//
//  LoginInteractor.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import Foundation

class LoginInteractor: LoginInteractorInputProtocol {
    var presnter: LoginInteractorOutputProtocol?
    
    func checkUserCreditionals(userCreditionals: [String]) {
        LoginServices.instance.loginAPICall { [weak self] (userInfo, error) in
            guard let self = self else { return }
            if error == nil {
                self.presnter?.getUserAuthSuccessfully(userInfo: userInfo)
            } else {
                self.presnter?.getUserAuthError(message: error?.localizedDescription ?? "Data Error")
            }
        }
    }
    
}

//
//  LoginProtocol.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import Foundation

protocol LoginViewProtocol: AnyObject {
    var presenter: LoginPresenterProtocol! { get set }
    func showLoaderView()
    func hideLoaderView()
    func showError(message: String)
}

protocol LoginPresenterProtocol: AnyObject {
    var view: LoginViewProtocol? { get set }
    func loginUser(userCreditionals: [String])
}

protocol LoginRouterProtocol {
    func routeToMainScreen(view: LoginViewProtocol?, userInfo: UserInfo)
}

protocol LoginInteractorInputProtocol {
    var presnter: LoginInteractorOutputProtocol? { get set }
    func checkUserCreditionals(userCreditionals: [String])
}

protocol LoginInteractorOutputProtocol: AnyObject {
    func getUserAuthSuccessfully(userInfo: UserInfo)
    func getUserAuthError(message: String)
}

//
//  LoginPresenter.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol
    var router: LoginRouterProtocol
    var userInfo: UserInfo?
    
    init(view: LoginViewProtocol, interactor: LoginInteractorInputProtocol, router: LoginRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func loginUser(userCreditionals: [String]) {
        self.view?.showLoaderView()
        self.interactor.checkUserCreditionals(userCreditionals: userCreditionals)
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    func getUserAuthSuccessfully(userInfo: UserInfo) {
        self.view?.hideLoaderView()
        self.router.routeToMainScreen(view: view, userInfo: userInfo)
    }
    
    func getUserAuthError(message: String) {
        self.view?.hideLoaderView()
        self.view?.showError(message: message)
    }
}

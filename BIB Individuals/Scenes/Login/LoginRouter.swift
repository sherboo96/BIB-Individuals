//
//  LoginRouter.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    weak var view: UIViewController?
    
    static func buildLogin() -> UIViewController {
        let view = LoginVC()
        let router = LoginRouter()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presnter = presenter
        router.view = view
        return view
    }
    
    func routeToMainScreen(view: LoginViewProtocol?, userInfo: UserInfo) {
        let VC = CustomTabBarController()
        if let view = view as? UIViewController {
            view.modalPresentationStyle = .fullScreen
            view.present(VC, animated: true, completion: nil)
        }
        
    }
}

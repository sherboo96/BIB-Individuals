//
//  HomeRouter.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    weak var view: UIViewController?
    
    static func buildSHomeVC() -> UIViewController {
        let view = HomeVC()
        let router = HomeRouter()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presnter = presenter
        router.view = view
        return view
    }
}

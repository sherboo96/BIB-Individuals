//
//  HomePresenter.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol
    var router: HomeRouterProtocol
    
    var services = [Service]()
    
    init(view: HomeViewProtocol, interactor: HomeInteractorInputProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    var servicesCount: Int {
        return services.count
    }
    
    func getAllServices() {
        self.view?.showLoaderView()
        self.interactor.getAllServices()
    }
    
    func configCell(cell: HomeCellViewProtocol, indexPath: IndexPath) {
        let service = services[indexPath.row]
        cell.setTitle(name: service.serviceName)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func getServicesSuccessfully(services: [Service]) {
        self.view?.hideLoaderView()
        self.services = services
        self.view?.reloadData()
    }
    
    func getServicesAuthError(message: String) {
        self.view?.hideLoaderView()
        self.view?.showError(message: message)
    }
}

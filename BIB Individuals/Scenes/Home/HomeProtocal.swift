//
//  HomeProtocal.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol! { get set }
    func showLoaderView()
    func hideLoaderView()
    func showError(message: String)
    func reloadData()
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var servicesCount: Int { get }
    func getAllServices()
    func configCell(cell: HomeCellViewProtocol, indexPath: IndexPath)
}

protocol HomeRouterProtocol {
    
}

protocol HomeInteractorInputProtocol {
    var presnter: HomeInteractorOutputProtocol? { get set }
    func getAllServices()
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func getServicesSuccessfully(services: [Service])
    func getServicesAuthError(message: String)
}

protocol HomeCellViewProtocol {
    func setTitle(name: String)
}

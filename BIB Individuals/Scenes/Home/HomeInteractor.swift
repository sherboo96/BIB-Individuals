//
//  HomeInteractor.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    var presnter: HomeInteractorOutputProtocol?
    
    func getAllServices() {
        ServicesServices.instance.getServicesAPICall { [weak self] (services, error) in
            guard let self = self else { return }
            if error == nil {
                self.presnter?.getServicesSuccessfully(services: services)
            } else {
                self.presnter?.getServicesAuthError(message: error?.localizedDescription ?? "Error")
            }
        }
    }
    
}

//
//  ServicesServices.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import Foundation

class ServicesServices {
    static let instance = ServicesServices()
    
    func getServicesAPICall(callback: @escaping ([Service], Error?) -> ()) {
        var services = [Service]()
        services.append(Service(serviceID: "8237328", serviceName: "One"))
        services.append(Service(serviceID: "8237329", serviceName: "two"))
        services.append(Service(serviceID: "8237330", serviceName: "three"))
        services.append(Service(serviceID: "8237331", serviceName: "four"))
        services.append(Service(serviceID: "8237332", serviceName: "five"))
        callback(services, nil)
    }
}

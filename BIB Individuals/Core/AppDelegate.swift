//
//  AppDelegate.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        self.setInitialVC()
        return true
    }
}

extension AppDelegate {
    func setInitialVC() {
        let loginView = LoginRouter.buildLogin()
        window?.rootViewController = loginView
        window?.makeKeyAndVisible()
    }
}

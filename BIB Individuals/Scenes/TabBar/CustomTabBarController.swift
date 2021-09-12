//
//  CustomTabBarController.swift
//  BIB Individuals
//
//  Created by Mahmoud Sherbeny on 12/09/2021.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    lazy var middleButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = button.frame.width / 2
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarUI()
        self.setupTabBarItems()
    }
    
    func setupTabBarUI() {
        self.setValue(CustomTabBar(), forKey: "tabBar")
        tabBar.tintColor = DesignSystem.Colors.primary.color
        tabBar.unselectedItemTintColor = DesignSystem.Colors.primary.color
        tabBar.unselectedItemTintColor = DesignSystem.Colors.secondary.color
        self.addMiddleButton()
    }
    
    private func setupTabBarItems() {
        self.viewControllers = TabBarItems.allCases.map({ return viewControllerForTabBarItems($0)})
    }
    
    private func addMiddleButton() {
        view.addSubview(middleButton)
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            middleButton.widthAnchor.constraint(equalToConstant: 50),
            middleButton.heightAnchor.constraint(equalToConstant: 50),
            middleButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -20)
        ])
    }
    
    func viewControllerForTabBarItems(_ item: TabBarItems) -> UIViewController {
        switch item {
        case .Home:
            let view = HomeRouter.buildSHomeVC()
            view.tabBarItem = tabBarItem(for: item)
            return view
        case .Renewals:
            let view = LoginVC()
            view.tabBarItem = tabBarItem(for: item)
            return view
        case .Services:
            let view = LoginVC()
            return view
        case .Claims:
            let view = LoginVC()
            view.tabBarItem = tabBarItem(for: item)
            return view
        case .Blog:
            let view = LoginVC()
            view.tabBarItem = tabBarItem(for: item)
            return view
        }
    }
    
    private func tabBarItem(for item: TabBarItems) -> UITabBarItem {
        let tabBarItem: UITabBarItem
        switch item {
        case .Home:
            tabBarItem = .init(title: "Home", image: #imageLiteral(resourceName: "uncheck"), selectedImage: #imageLiteral(resourceName: "uncheck"))
        case .Renewals:
            tabBarItem = .init(title: "Renewals", image: #imageLiteral(resourceName: "uncheck"), selectedImage: #imageLiteral(resourceName: "uncheck"))
        case .Services:
            tabBarItem = .init(title: "Services", image: #imageLiteral(resourceName: "uncheck"), selectedImage: #imageLiteral(resourceName: "uncheck"))
        case .Claims:
            tabBarItem = .init(title: "Claims", image: #imageLiteral(resourceName: "uncheck"), selectedImage: #imageLiteral(resourceName: "uncheck"))
        case .Blog:
            tabBarItem = .init(title: "Blog", image: #imageLiteral(resourceName: "uncheck"), selectedImage: #imageLiteral(resourceName: "uncheck"))
        }
        return tabBarItem
    }

    enum TabBarItems: CaseIterable {
        case Home
        case Renewals
        case Services
        case Claims
        case Blog
    }

}

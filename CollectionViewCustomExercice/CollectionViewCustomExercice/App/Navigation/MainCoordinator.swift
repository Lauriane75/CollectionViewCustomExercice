//
//  MainCoordinator.swift
//  CollectionViewCustomExercice
//
//  Created by Lau on 02/06/2021.
//

import UIKit

protocol CoordinatorProtocol {
    func start()
}

class MainCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    
    var window: UIWindow?
    
    fileprivate let navigationController = UINavigationController()
    
    private let screens: Screens
    
    private var listCoordinator: ListCoordinator
    
    // MARK: - Initializer
    
    init(window: UIWindow?, screens: Screens) {
        self.window = window
        self.screens = screens
        self.listCoordinator = ListCoordinator(screens: screens, navigationController: navigationController)
    }
    
    // MARK: - Functions
    
    func start() {
        // need to stop running test here
        createNavigationController(navigationController: navigationController)
        
        listCoordinator.start()
    }
    
    // MARK: - Private Functions
    
    private func createNavigationController(navigationController: UINavigationController) {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        let navBar = navigationController.navigationBar
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.tintColor = .white
    }
    
    
}

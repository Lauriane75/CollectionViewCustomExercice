//
//  File.swift
//  CollectionViewCustomExercice
//
//  Created by Lau on 02/06/2021.
//

import UIKit

class ListCoordinator {
    
    // MARK: - Properties
    
    private let screens: Screens
    
    private let navigationController: UINavigationController
    
    // MARK: - Initializer
    
    
    init(screens: Screens, navigationController: UINavigationController) {
        self.screens = screens
        self.navigationController = navigationController
    }
}

// MARK: - CoordinatorProtocol

extension ListCoordinator: CoordinatorProtocol {
    func start() {
        createListView()
    }
    
    // MARK: - Private Functions
    
    private func createListView() {
        let viewController = screens.createListViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    private func createDetailView() {
        let viewController = screens.createDetailViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: false)
    }
    
}

extension ListCoordinator: ListViewModelDelegate {
    func showDetailView() {
        createDetailView()
    }
}

extension ListCoordinator: DetailViewModelDelegate {
    
}

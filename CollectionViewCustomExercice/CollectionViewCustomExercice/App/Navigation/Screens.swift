//
//  Screens.swift
//  CollectionViewCustomExercice
//
//  Created by Lau on 02/06/2021.
//

import UIKit

class Screens {
    
    // MARK: - Properties
    
    private let context: Context

    // MARK: - Initializer
    
    init(context: Context) {
        self.context = context
    }

    // MARK: - Functions
    
    func createListViewController(delegate: ListViewModelDelegate?) -> UIViewController {
        let viewController = ListViewController()
        let repository = Repository(context: context)
        let viewModel = ListViewModel(repository: repository, delegate: delegate)
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func createDetailViewController(delegate: DetailViewModelDelegate?) -> UIViewController {
        let viewController = DetailViewController()
        let repository = Repository(context: context)
        let viewModel = DetailViewModel(repository: repository, delegate: delegate)
        viewController.viewModel = viewModel
        
        return viewController
    }

    
}

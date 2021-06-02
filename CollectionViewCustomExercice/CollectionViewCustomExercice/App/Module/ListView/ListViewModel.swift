//
//  ListViewModel.swift
//  CollectionViewCustomExercice
//
//  Created by Lau on 02/06/2021.
//

import Foundation

protocol ListViewModelDelegate: AnyObject {
    func showDetailView()
}


final class ListViewModel {
    
    // MARK: - Properties
    
    private let repository: RepositoryType
    
    private weak var delegate: ListViewModelDelegate?
    
    // MARK: - Initializer
    
    init(repository: RepositoryType, delegate: ListViewModelDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }
    
    // MARK: - Output
    
    var buttonText: ((String) -> Void)?
    
    // MARK: - Input
    
    func viewDidLoad() {
        buttonText?("See Detail")
    }
    
    func viewWillAppear() {
        
    }
    
    func didPressDetailButton() {
        delegate?.showDetailView()
    }
    
}

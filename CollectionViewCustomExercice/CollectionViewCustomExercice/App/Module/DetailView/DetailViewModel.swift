//
//  DetailViewModel.swift
//  CollectionViewCustomExercice
//
//  Created by Lau on 02/06/2021.
//

import Foundation

protocol DetailViewModelDelegate: AnyObject {
    
}


class DetailViewModel: DetailViewModelDelegate {
    
    // MARK: - Properties
    
    private let repository: RepositoryType
    
    private weak var delegate: DetailViewModelDelegate?
    
    // MARK: - Initializer
    
    init(repository: RepositoryType, delegate: DetailViewModelDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }
    
    // MARK: - Output
    
    var labelText: ((String) -> Void)?
    
    // MARK: - Input
    
    func viewDidLoad() {
        labelText?("This is the detail view")
    }
    
    func viewWillAppear() {
        
    }
    // MARK: - Private Functions
    
    
    
}


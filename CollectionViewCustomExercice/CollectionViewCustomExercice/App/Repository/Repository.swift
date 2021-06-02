//
//  Repository.swift
//  CollectionViewCustomExercice
//
//  Created by Lau on 02/06/2021.
//

import Foundation

protocol RepositoryType {
    func getData()
    
}

class Repository: RepositoryType {
    
    // MARK: - Properties
    
    private let token = Token()
    private let context: Context
    
    // MARK: - Initializer
    
    init(context: Context) {
        self.context = context
    }
    
    // MARK: - Functions
    
    func getData() {
        print("get data")
    }
    
}

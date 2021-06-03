//
//  Repository.swift
//  CollectionViewCustomExercice
//
//  Created by Lau on 02/06/2021.
//

import Foundation

protocol RepositoryType {
    func getProductList(completion: @escaping (CompletionResult<Product>) -> Void, error: @escaping (String) -> Void)
    
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
    
    func getProductList(completion: @escaping (CompletionResult<Product>) -> Void, error: @escaping (String) -> Void) {
        let urlString = "https://sephoraios.github.io/items.json"
        
        guard let url = URL(string: urlString) else { return }
        
        context.client.request(type: Product.self, endPointType: .GET, url: url, cancelledBy: token) { product in
            switch product {
            case .success(value: let productItem):
                let result: Product = productItem
                completion(.success(value: result))
            case .failure(error: let onError):
                error(onError.localizedDescription)
                print("error = \(String(describing: error))")
            }
        }
    }
}

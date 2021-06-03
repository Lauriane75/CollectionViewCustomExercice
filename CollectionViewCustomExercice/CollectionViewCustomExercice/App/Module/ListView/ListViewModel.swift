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
//        delegate?.showDetailView()
//        repository.getProductList { result in
//            switch result {
//            case .success(value: let productItem):
//                print("productItem = \(productItem.id)")
//            case .failure(error: let error):
//                print("error = \(error.localizedDescription)")
//            }
//        } error: { _ in
//            print("call database")
//        }
        
        getProduct { result in
            switch result {
            case .success(let product):
                print("product = \(product.count)")
            case .failure(let error):
                print("error = \(error.localizedDescription)")
            }
        }

    }
    
    func getProduct(completion: @escaping(Result<[Product], Error>) -> Void) {
        
        let urlString = "https://sephoraios.github.io/items.json"
        
        guard let url = URL(string: urlString) else { print("invalid URL"); return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { print("Error = \(String(describing: error?.localizedDescription))"); return }
            guard data != nil else { return }
            do {
                let result = try JSONDecoder().decode(Product.self, from: data!)
                completion(.success([result]))
                print("succcess = \(result.id)")

            } catch {
                completion(.failure(error.localizedDescription as! Error))
                print("error = \(error.localizedDescription)")

            }
        }.resume()
    }
    
    
    
}

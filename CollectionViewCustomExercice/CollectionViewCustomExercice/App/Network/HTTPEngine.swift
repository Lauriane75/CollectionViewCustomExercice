//
//  HTTPEngine.swift
//  CollectionViewCustomExercice
//
//  Created by Lau on 02/06/2021.
//

import Foundation

typealias HTTPCompletionHandler = (Data?, HTTPURLResponse?, Error?) -> Void

enum URLSessionEngineError: Error {
    case invalideURLResponseType
}

final class HTTPEngine {
    
    // MARK: - Properties
    
    private let session: URLSession
    
    // MARK: - Initializer
    
    init(configuration: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: configuration)
    }
    
    func send(request: URLRequest,
              cancelledBy token: Token,
              completion: @escaping HTTPCompletionHandler) {
        let task = session.dataTask(with: request) { (data, urlResponse, _) in
            if urlResponse != nil, let httpURLResponse = urlResponse as? HTTPURLResponse {
                completion(data, httpURLResponse, nil)
            } else {
                completion(data, nil, URLSessionEngineError.invalideURLResponseType)
            }
        }
        task.resume()
        token.willDealocate = {
            task.cancel()
        }
    }
    
    deinit {
        session.invalidateAndCancel()
    }
    
}

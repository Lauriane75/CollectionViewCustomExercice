//
//  Context.swift
//  CollectionViewCustomExercice
//
//  Created by Lau on 02/06/2021.
//

import Foundation

final class Context {
    
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
}

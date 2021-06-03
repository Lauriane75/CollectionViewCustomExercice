//
//  Token.swift
//  CollectionViewCustomExercice
//
//  Created by Lau on 02/06/2021.
//

import Foundation

final class Token {
    
    init() {}
    
    deinit {
        willDealocate?()
    }
    
    var willDealocate:(() -> Void)?
    
}

//
//  Product.swift
//  CollectionViewCustomExercice
//
//  Created by Lau on 03/06/2021.
//

import Foundation

struct Product: Decodable {
    let id: String
    let image: String
}

struct ProductItem: Equatable {
    let id: String
    let image: String
}

//
//  DataStruct.swift
//  Pizzas
//
//  Created by juliemoorled on 14.10.2022.
//

import Foundation

struct JSONData: Decodable {
    let categories: [Category]
}

struct Category: Decodable {
    let name: String
    let products: [Product]
}

struct Product: Decodable {
    let title: String
    let description: String
    let price: String
    let image_url: String
    let category: Category?
}

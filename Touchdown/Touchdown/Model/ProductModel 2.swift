//
//  ProductModel.swift
//  Touchdown
//
//  Created by Ryan J. W. Kim on 2021/09/21.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let description: String
    let price: Int
    let color: [Double]

    var red: Double{ return color[0]}
    var green: Double{ return color[1]}
    var blue: Double{ return color[2]}
    var formattedPrice: String { return "$\(price)" }
    
}

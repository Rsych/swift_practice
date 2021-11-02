//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Ryan J. W. Kim on 2021/09/21.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}

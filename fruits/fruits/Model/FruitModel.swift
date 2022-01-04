//
//  FruitModel.swift
//  fruits
//
//  Created by Tamiel on 2021/09/07.
//

import SwiftUI

// MARK: - FRUITS DATA MODEL

struct Fruit: Identifiable {
    var id = UUID() // universal unique id
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
    
}

//
//  Order.swift
//  CupcakeCorner
//
//  Created by Ryan J. W. Kim on 2021/10/20.
//

import Foundation

class Order: ObservableObject {
    static let types = ["vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streeAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streeAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
}

//
//  ExpenseItemModel.swift
//  iExpense
//
//  Created by Ryan J. W. Kim on 2021/10/10.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}


class Expense: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            	
            if let encoded = try?
                encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Item")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "Item")
        {
            let decoder = JSONDecoder()
            
            if let decoded = try?
                decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}

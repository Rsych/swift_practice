//
//  HabitItemModel.swift
//  HabitRoyale
//
//  Created by Ryan J. W. Kim on 2021/10/18.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let progress: Int
    let finished: Bool
}
class Habit: ObservableObject {
    @Published var items = [HabitItem]() {
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
                decoder.decode([HabitItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}

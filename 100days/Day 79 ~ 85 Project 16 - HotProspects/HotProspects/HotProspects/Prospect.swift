//
//  Prospect.swift
//  HotProspects
//
//  Created by Ryan J. W. Kim on 2021/11/05.
//

import SwiftUI

class Prospect: Identifiable, Codable, Comparable {
    static func == (lhs: Prospect, rhs: Prospect) -> Bool {
        lhs.id == rhs.id
    }
    
    static func < (lhs: Prospect, rhs: Prospect) -> Bool {
        lhs.name > rhs.name
    }
    
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

class Prospects: ObservableObject {
    static let saveKey = "SavedData"
    static let fileName = "prospect.json"
    @Published private(set) var people: [Prospect]
    
    
    init() {
//        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
//                self.people = decoded
//                return
//            }
//        }
//        self.people = []
        self.people = loadData(file: Self.fileName) ?? []
    }
    
    private func save() {
//        if let encoded = try? JSONEncoder().encode(people) {
//            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
//        }
        saveData(of: people, to: Self.fileName)
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
}

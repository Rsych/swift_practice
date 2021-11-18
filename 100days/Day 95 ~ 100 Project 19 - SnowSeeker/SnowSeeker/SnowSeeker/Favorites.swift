//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Ryan J. W. Kim on 2021/11/18.
//

import SwiftUI

class Favorites: ObservableObject {
    // user's favorite resorts
    private var resorts: Set<String>
    
    // UserDefaults key
    private let saveKey = "Favorites"
    
    init() {
        // load our saved data
        
        self.resorts = []
    }
    
    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    // add resort to our set, updates all views and save
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    // removes the resort from our set, updates all view and save
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        // save data
    }
}

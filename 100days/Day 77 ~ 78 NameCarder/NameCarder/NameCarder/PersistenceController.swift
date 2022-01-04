//
//  PersistenceController.swift
//  NameCarder
//
//  Created by Ryan J. W. Kim on 2021/11/02.
//

import Foundation
import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()
    
    // Storage for CoreData
    let container: NSPersistentContainer
    
    // An initializer to load CoreData
    init(inMemory: Bool = false) {
        // Change below name followed by your model name
        container = NSPersistentContainer(name: "Model")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
      func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // show some error
            }
        }
    }
}

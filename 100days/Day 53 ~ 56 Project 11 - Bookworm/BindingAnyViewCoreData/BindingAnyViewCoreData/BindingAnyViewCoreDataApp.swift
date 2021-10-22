//
//  BindingAnyViewCoreDataApp.swift
//  BindingAnyViewCoreData
//
//  Created by Ryan J. W. Kim on 2021/10/22.
//

import SwiftUI

@main
struct BindingAnyViewCoreDataApp: App {
    let persistenceContainer = PersistenceController.shared // <- so need add this line

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext) // <- and here <-

        }
    }
}

//
//  fruitsApp.swift
//  fruits
//
//  Created by Tamiel on 2021/09/03.
//

import SwiftUI

@main
struct fruitsApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}

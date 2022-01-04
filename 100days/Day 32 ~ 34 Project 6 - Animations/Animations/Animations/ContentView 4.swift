//
//  ContentView.swift
//  Animations
//
//  Created by Ryan J. W. Kim on 2021/10/06.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var selectedTab = 0
    
    // MARK: - Body
    var body: some View {
        
        TabView(selection: $selectedTab) {
            ImplicitAnimations()
                .tabItem {
                    Label("Implicit", systemImage: "1.circle")
                }
            CustomizingAnimations()
                .tabItem {
                    Label("Customization", systemImage: "2.circle")
                }
            AnimationBindings()
                .tabItem {
                    Label("Animation Binding", systemImage: "3.circle")
                }
            ExplicitAnimations()
                .tabItem {
                    Label("Explicit Animations", systemImage: "4.circle")
                }
        }
    }
}
// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

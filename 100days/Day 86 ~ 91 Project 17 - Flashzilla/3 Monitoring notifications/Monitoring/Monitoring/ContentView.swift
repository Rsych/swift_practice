//
//  ContentView.swift
//  Monitoring
//
//  Created by Ryan J. W. Kim on 2021/11/08.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            TriggerTimer()
                .tabItem {
                    Label("TriggerTimer", systemImage: "1.circle")
                } .tag(0)
            NotifiedBackground()
                .tabItem {
                    Label("NotifiedBackground", systemImage: "2.circle")
                } .tag(1)
            AccessibilitySupport()
                .tabItem {
                    Label("Accessibility support", systemImage: "3.circle")
                } .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

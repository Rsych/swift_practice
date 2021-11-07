//
//  ContentView.swift
//  GesturesHaptic
//
//  Created by Ryan J. W. Kim on 2021/11/07.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            GesturesUse()
                .tabItem {
                    Label("GestureUse", systemImage: "1.circle")
                } .tag(0)
            Gesturespriorities()
                .tabItem {
                    Label("Gesture priority", systemImage: "2.circle")
                } .tag(1)
            GestureDrag()
                .tabItem {
                    Label("Drag", systemImage: "3.circle")
                } .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

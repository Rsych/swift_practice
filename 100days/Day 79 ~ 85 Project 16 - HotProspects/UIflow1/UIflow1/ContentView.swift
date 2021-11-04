//
//  ContentView.swift
//  UIflow1
//
//  Created by Ryan J. W. Kim on 2021/11/04.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var selectedTab = 0
    // MARK: - Body
    var body: some View {
        TabView(selection: $selectedTab) {
            CustomValueEnvironmentObj()
                .tabItem {
                    Label("One", systemImage: "star")
                } .tag(0)
            SwiftResultTypes()
                .tabItem {
                    Label("Two", systemImage: "star.fill")
                } .tag(1)
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

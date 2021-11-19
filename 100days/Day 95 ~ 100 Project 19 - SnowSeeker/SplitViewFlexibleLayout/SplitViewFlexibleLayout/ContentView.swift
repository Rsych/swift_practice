//
//  ContentView.swift
//  SplitViewFlexibleLayout
//
//  Created by Ryan J. W. Kim on 2021/11/16.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var selectedTab = 0
    // MARK: - Body
    var body: some View {
        TabView(selection: $selectedTab) {
            SplitSideViews()
                .tabItem {
                    Label("SplitSideViews", systemImage: "1.circle")
                } .tag(0)
            OptionalAlertAndSheet()
                .tabItem {
                    Label("Optional Alert and Sheet", systemImage: "2.circle")
                } .tag(1)
            BindingAlertAndSheet()
                .tabItem {
                    Label("Binding Alert and Sheet", systemImage: "3.circle")
                } .tag(2)
            GroupsLayoutContainers()
                .tabItem {
                    Label("Groups LayoutContainers", systemImage: "4.circle")
                } .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

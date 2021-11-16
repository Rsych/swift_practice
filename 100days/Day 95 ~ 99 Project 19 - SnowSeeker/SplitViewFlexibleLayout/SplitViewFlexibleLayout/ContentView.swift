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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

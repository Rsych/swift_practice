//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Ryan J. W. Kim on 2021/11/12.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var selectedTab = 0
    // MARK: - Body
    var body: some View {
        TabView(selection: $selectedTab) {
            HowLayoutWorks()
                .tabItem {
                    Label("HowLayoutWorks", systemImage: "1.circle")
                } .tag(0)
            AlignmentAndGuide()
                .tabItem {
                    Label("Alignment and guides", systemImage: "2.circle")
                } .tag(1)
            CustomAlignment()
                .tabItem {
                    Label("Custom alignment", systemImage: "3.circle")
                } .tag(2)
            AbsolutePosition()
                .tabItem {
                    Label("Absolute positioning", systemImage: "4.circle")
                } .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

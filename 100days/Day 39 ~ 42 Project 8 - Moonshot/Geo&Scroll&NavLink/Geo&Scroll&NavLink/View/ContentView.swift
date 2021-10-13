//
//  ContentView.swift
//  Geo&Scroll&NavLink
//
//  Created by Ryan J. W. Kim on 2021/10/10.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var selectedTab = 0
    
    // MARK: - Body
    var body: some View {
        TabView(selection: $selectedTab) {
            ResizingGeometryReader()
                .tabItem {
                    Label("Resizing", systemImage: "1.circle")
                } //: Tab 1
            ScrollViewExample()
                .tabItem {
                    Label("ScrollView", systemImage: "2.circle")
                } //: Tab 2
            WorkingCodableData()
                .tabItem {
                    Label("Codable", systemImage: "3.circle")
                }
        } //: TabView
    } //: Body
} //: View

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}

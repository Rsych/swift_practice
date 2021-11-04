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
                    Label("CustomEnvironment", systemImage: "star")
                } .tag(0)
            SwiftResultTypes()
                .tabItem {
                    Label("ResultType", systemImage: "star.fill")
                } .tag(1)
            PublishingObservableObj()
                .tabItem {
                    Label("Publishing", systemImage: "star")
                } .tag(2)
            ImageInterpolation()
                .tabItem {
                    Label("Interpolation", systemImage: "star")
                } .tag(3)
            CreateContextMenu()
                .tabItem {
                    Label("ContextMenu", systemImage: "star")
                } .tag(4)
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

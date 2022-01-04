//
//  ContentView.swift
//  Accessibility_test
//
//  Created by Ryan J. W. Kim on 2021/11/02.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            LabelsVoicdOver()
                .tabItem {
                    Label("LabelVoiceOver", systemImage: "1.circle")
                } .tag(0)
            
            HidingGroupingAccessibilityData()
                .tabItem {
                    Label("HidingGrouping accessibility data", systemImage: "2.circle")
                } .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

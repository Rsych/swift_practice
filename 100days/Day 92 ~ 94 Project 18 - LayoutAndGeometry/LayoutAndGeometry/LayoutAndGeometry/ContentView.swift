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
            CoverFlowScrollView()
                .tabItem {
                    Label("Cover Flow scrollView", systemImage: "1.circle")
                } .tag(0)
            ScrollViewEffectDNA()
                .tabItem {
                    Label("ScrollView Effect", systemImage: "2.circle")
                } .tag(1)
            HowLayoutWorks()
                .tabItem {
                    Label("HowLayoutWorks", systemImage: "3.circle")
                } .tag(2)
            AlignmentAndGuide()
                .tabItem {
                    Label("Alignment and guides", systemImage: "4.circle")
                } .tag(3)
            CustomAlignment()
                .tabItem {
                    Label("Custom alignment", systemImage: "5.circle")
                } .tag(4)
            AbsolutePosition()
                .tabItem {
                    Label("Absolute positioning", systemImage: "6.circle")
                } .tag(5)
            FramesAndCoordinates()
                .tabItem {
                    Label("Frames&Coordinates", systemImage: "7.circle")
                } .tag(6)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

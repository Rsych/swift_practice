//
//  ContentView.swift
//  NameCarder
//
//  Created by Ryan J. W. Kim on 2021/11/02.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            ImagePickerView()
                .tabItem {
                    Label("NameCard", systemImage: "1.circle")
                } .tag(0)
            NameListView()
                .tabItem {
                    Label("Card List", systemImage: "2.circle")
                } .tag(1)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  HotProspects
//
//  Created by Ryan J. W. Kim on 2021/11/05.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var selectedTab = 0
    
    var prospects = Prospects()
    // MARK: - Body
    var body: some View {
        TabView(selection: $selectedTab) {
            ProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                } .tag(0)
            
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                } .tag(1)
            
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                } .tag(2)
            
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                } .tag(3)
        } //: TabView
        .environmentObject(prospects)
    } //: body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

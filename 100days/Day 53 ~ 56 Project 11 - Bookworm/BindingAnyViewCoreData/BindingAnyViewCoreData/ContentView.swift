//
//  ContentView.swift
//  BindingAnyViewCoreData
//
//  Created by Ryan J. W. Kim on 2021/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var whichTab = 0
    
    var body: some View {
        TabView(selection: $whichTab) {
            CustomComponentWithBinding()
                .tabItem {
                    Label("Binding", systemImage: "1.circle")
                }
            
            SizeClassAnyView()
                .tabItem {
                    Label("AnyView", systemImage: "2.circle")
                }
            CoreData()
                .tabItem {
                    Label("CoreData", systemImage: "3.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

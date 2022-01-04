//
//  ContentView.swift
//  HabitRoyale
//
//  Created by Ryan J. W. Kim on 2021/10/18.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var selectedTab = 0
    
    // MARK: - Body
    var body: some View {
        TabView(selection: $selectedTab) {
            HabitListView()
                .tabItem {
                    Label("First Menu", systemImage: "1.circle")
                }
            Spacer()
        }
    } //: body
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


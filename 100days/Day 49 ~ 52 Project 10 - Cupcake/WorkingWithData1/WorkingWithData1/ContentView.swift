//
//  ContentView.swift
//  WorkingWithData1
//
//  Created by Ryan J. W. Kim on 2021/10/19.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State var selectedTab = 0
    
    // MARK: - Body
    var body: some View {
        TabView(selection: $selectedTab) {
            CodableDataURLSession()
                .tabItem {
                    Label("URLSession", systemImage: "1.circle")
                } //: TabItem1
            ValidatingDisablingForm()
                .tabItem {
                    Label("Validating Disabling form", systemImage: "2.circle")
                }
        }
    }
}
// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

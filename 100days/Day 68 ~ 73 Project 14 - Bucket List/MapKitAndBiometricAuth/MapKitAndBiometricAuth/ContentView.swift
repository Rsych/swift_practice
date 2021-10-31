//
//  ContentView.swift
//  MapKitAndBiometricAuth
//
//  Created by Ryan J. W. Kim on 2021/10/30.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State var tabSelection = 0
    var body: some View {
        TabView(selection: $tabSelection) {
            ConformanceToComparableCustomType()
                .tabItem {
                    Label("Conformance", systemImage: "1.circle")
                }
                .tag(0)
            
            WritindDataToDocuments()
                .tabItem {
                    Label("Write Data", systemImage: "2.circle")
                }
                .tag(1)
            
            SwitchingViewEnums()
                .tabItem {
                    Label("Enum Views", systemImage: "3.circle")
                }
            MapContentView()
                .tabItem {
                    Label("MapKit", systemImage: "4.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

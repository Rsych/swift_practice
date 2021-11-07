//
//  ContentView.swift
//  Haptics
//
//  Created by Ryan J. W. Kim on 2021/11/07.
//
import CoreHaptics
import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    
    // MARK: - Body
    var body: some View {
        
        TabView(selection: $selectedTab) {
            VibrationsCoreHaptics()
                .tabItem {
                    Label("Vibration", systemImage: "1.circle")
                } .tag(0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

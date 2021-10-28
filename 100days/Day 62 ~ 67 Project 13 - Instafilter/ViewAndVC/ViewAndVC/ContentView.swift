//
//  ContentView.swift
//  ViewAndVC
//
//  Created by Ryan J. W. Kim on 2021/10/28.
//

import SwiftUI

struct ContentView: View {
    @State var selectedNum = 0
    var body: some View {
        TabView(selection: $selectedNum) {
            WrapperBeStruct()
                .tabItem {
                    Label("Custom Binding", systemImage: "1.circle")
                }
                .tag(0)
            
            MultipleActionSheet()
                .tabItem {
                    Label("MultipleActionSheet", systemImage: "2.circle")
                }
                .tag(1)
            CoreImageIntegration()
                .tabItem {
                    Label("CoreImage", systemImage: "3.circle")
                }
                .tag(3)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

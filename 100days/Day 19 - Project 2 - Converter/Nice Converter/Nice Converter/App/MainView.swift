//
//  MainView.swift
//  Nice Converter
//
//  Created by Ryan J. W. Kim on 2021/09/30.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
        ContentView()
            .tabItem {
                Image(systemName: "thermometer")
                    .foregroundColor(.black)
                Text("Temperature")
            }
        DistanceConverterView()
            .tabItem {
                Image(systemName: "ruler")
                    .foregroundColor(.black)
                Text("Length")
                
            }
        WeightConverterView()
            .tabItem {
                Image(systemName: "ruler")
                    .foregroundColor(.black)
                Text("Length")
                
            }
    }
}
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

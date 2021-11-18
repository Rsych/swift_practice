//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Ryan J. W. Kim on 2021/11/16.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @ObservedObject var favirotes = Favorites()
    
    enum FilterType {
        case abc, country, price, favorite
    }
    @State var filter:FilterType = .abc
    
    var filteredResorts: [Resort] {
        switch filter {
        case .abc:
            return resorts.sorted(by: { $0.name < $1.name })
        case .country:
            return resorts.sorted(by: { $0.country > $1.country })
        case .price:
            return resorts.sorted(by: { $0.price > $1.price })
        case .favorite:
            return resorts.sorted()
        }
    }
    // MARK: - Body
    var body: some View {
        NavigationView {
            ResortListView(filteredResorts: filteredResorts)
                .navigationBarTitle("Resorts")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu("Sort") {
                            
                            Text("Country")
                        }
                    }
                } //: toolbar
            // secondary view
            WelcomeView()
        } //: NavView
        .phoneOnlyStackNavigationView()
        
        // every navView presents will get that Favorites instance
        .environmentObject(favirotes)
    } //: body
} //: contentview

extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(.stack))
        } else {
            return AnyView(self)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

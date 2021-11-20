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
    
    @State private var selectedFilter:FilterType = .abc
    var filteredResorts: [Resort] {
        // search result
        let searchList = searchResults
        
        switch selectedFilter {
        case .abc:
            print("abc selected")
            return searchList.sorted(by: { $0.name < $1.name })
        case .country:
            print("country selected")
            return searchList.sorted(by: { $0.country < $1.country })
        case .price:
            print("price selected")
            return searchList.sorted(by: { $0.price < $1.price })
        case .favorite:
            print("favorite selected")
            return searchList.sorted()
        }
    }
    
    // search within resorts
    @State private var searchText = ""
    var searchResults: [Resort] {
        if searchText.isEmpty {
            return resorts
        } else {
            //            return resorts.filter { $0.name.contains(searchText) }
            return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            
            ResortListView(filteredResorts: filteredResorts)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Looking for a resort?"){
                    // If search is not typed it suggest
                    if searchText.isEmpty {
                        ForEach(searchResults) {
                            Text("Are you looking for \($0.name)?").searchCompletion($0.name)
                        } //: search loop
                    } //: if search empty
                    // not good but check if needed later
                    // or just put suggestion with plain txt later
//                    else {
//                        ForEach(searchResults) {
//                            Text("Maybe you looking for \($0.name)?").searchCompletion($0.name)
//                        } //: search loop
//                    } //: if search else
                } //: search completion
                .navigationBarTitle("Resorts")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu("Sort") {
                            Button {
                                selectedFilter = .abc
                            } label: {
                                Text("Abc")
                            } //: ABC sort
                            Button {
                                selectedFilter = .country
                            } label: {
                                Text("Country")
                            } //: Country sort
                            Button {
                                selectedFilter = .price
                            } label: {
                                Text("Price")
                            } //: Price sort
                        } //: Sort Menu
                    } //: ToolbarItem trailing
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

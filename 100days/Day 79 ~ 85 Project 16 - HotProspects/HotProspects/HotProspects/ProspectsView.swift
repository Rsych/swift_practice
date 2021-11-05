//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Ryan J. W. Kim on 2021/11/05.
//

import SwiftUI

struct ProspectsView: View {
    // MARK: - Properties
    enum FilterType {
        case none, contacted, uncontacted
    }
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    // MARK: - Body
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle(title)
        } //: NAV View
    } //: body
    
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}

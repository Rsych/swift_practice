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
    } //: Filtertype enum
    
    @EnvironmentObject var prospects: Prospects
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
    } //: computed properties with switch
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            Text("People: \(prospects.people.count)")
                .navigationTitle(title)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            let prospect = Prospect()
                            prospect.name = "Ryan"
                            prospect.emailAddress = "aliefj@gmail.com"
                            self.prospects.people.append(prospect)
                        } label: {
                            Label("Scan", systemImage: "qrcode.viewfinder")
                        }

                    }
                }
        } //: NAV View
    } //: body
    
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}

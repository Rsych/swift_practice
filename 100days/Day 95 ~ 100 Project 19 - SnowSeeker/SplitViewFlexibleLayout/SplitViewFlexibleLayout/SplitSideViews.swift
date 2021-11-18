//
//  SplitSideViews.swift
//  SplitViewFlexibleLayout
//
//  Created by Ryan J. W. Kim on 2021/11/16.
//

import SwiftUI

struct SplitSideViews: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("New secondary")) {
                Text("Hello, World!")
            } //: NavLink
                .navigationTitle("Primary")
            Text("Secondary")
        } //: NavView
    } //: body
} //: contentview

struct SplitSideViews_Previews: PreviewProvider {
    static var previews: some View {
        SplitSideViews()
    }
}

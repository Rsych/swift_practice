//
//  GroupsLayoutContainers.swift
//  SplitViewFlexibleLayout
//
//  Created by Ryan J. W. Kim on 2021/11/16.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Ryan")
            Text("Second Third")
            Text("Devices: MacBook, iPhone")
        }
    }
} //: UserView struct

struct GroupsLayoutContainers: View {
    // MARK: - Properties
    @Environment(\.horizontalSizeClass) var sizeClass
    
    // MARK: - Body
    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack {
                    UserView()
                } //: VStack
            } else {
                // could be shorter this way
                HStack(content: UserView.init)
            } //: layout condition
        } //: Group
    } //: body
} //: contentview

struct GroupsLayoutContainers_Previews: PreviewProvider {
    static var previews: some View {
        GroupsLayoutContainers()
    }
}

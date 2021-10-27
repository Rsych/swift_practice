//
//  UserListView.swift
//  FriendFace
//
//  Created by Ryan J. W. Kim on 2021/10/27.
//

import SwiftUI

struct UserListView: View {
    // MARK: - Properties
    let users: [User]
    var body: some View {
        NavigationView{
            List {
                ForEach(users, id: \.self) { user in
                    NavigationLink {
                        if #available(iOS 15.0, *) {
                            DetailView(user: user)
                        } else {
                            // Fallback on earlier versions
                        }
                    } label: {
                        Text(user.name)
                    }
                    
                    } //: NAV LINK
                } //: Loop
            } //: List
        } //: NavigationView
    }


struct UserListView_Previews: PreviewProvider {
    static let users: [User] = FetchData().users
    static var previews: some View {
        UserListView(users: [User]())
    }
}

//
//  DetailView.swift
//  FriendFace
//
//  Created by Ryan J. W. Kim on 2021/10/27.
//

import SwiftUI

struct DetailView: View {
// MARK: - Properties
    let user: User
    let users: [User]
// MARK: - Body
    var body: some View {
        VStack{
            Spacer()
        Text(user.name)
            Text("\(user.friends!.count) Friends")
            Spacer()
            NavigationLink {
                FriendListView(friends: user.friends!, users: users)
            } label: {
                Text("See Friends")
            }
Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User.example, users: [User]())
    }
}

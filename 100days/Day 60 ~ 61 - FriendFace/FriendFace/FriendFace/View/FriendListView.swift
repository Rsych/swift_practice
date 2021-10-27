//
//  FriendListView.swift
//  FriendFace
//
//  Created by Ryan J. W. Kim on 2021/10/27.
//

import SwiftUI

struct FriendListView: View {
    // MARK: - Properties
    let friends : [Friend]
    let users: [User]
    var body: some View {
        VStack{
            ForEach(friends, id: \.self) { friend in
                NavigationLink(destination: findFriendName(from: friend, in: users)) {
                    Text(friend.name)
                }
                .isDetailLink(false)
            }
        }
    }
    func findFriendName(from friend: Friend, in user: [User]) -> some View {
        guard let user = user.first(where: { $0.name == friend.name }) else {
            return AnyView(Text("No Match"))
        }
        return AnyView(DetailView(user: user, users: [User]()))
    }
}




struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView(friends: [Friend](), users: [User]())
    }
}

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
    
    // MARK: - Body
    var body: some View {
        VStack{
            List(friends, id: \.self) { friend in
                NavigationLink {
                    findFriendName(from: friend, in: [User]())
                } label: {
                    Text(friend.name)
                } //: NAV Link
            } //: List
        } //: VStack
    }
    
    // TODO: Fix this damn Thing
    func findFriendName(from friend: Friend, in user: [User]) -> some View {
        guard let user = user.first(where: { $0.name == friend.name }) else {
            return AnyView(Text("No Match"))
        }
        return AnyView(DetailView(user: user))
    }
}




struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView(friends: [Friend]())
    }
}

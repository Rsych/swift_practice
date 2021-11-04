//
//  FriendListView.swift
//  FriendFace
//
//  Created by Ryan J. W. Kim on 2021/10/27.
//

import SwiftUI

@available(iOS 15.0, *)
struct FriendListView: View {
    // MARK: - Properties
    
//    @ObservedObject var friends = FriendFetch()
    @ObservedObject var users = FetchData()
    @ObservedObject var friends = FriendFetch()
        let user: User
//    let friend: Friend
    // MARK: - Body
    var body: some View {
        VStack{
            List(user.friends, id: \.self) { friend in
                NavigationLink {
//                    FriendListView(user: user)
                    findFriendName(from: friend, in: [User]())
                } label: {
                    Text(friend.name)
                } //: NAV Link
            } //: List
            .listStyle(.plain)
        } //: VStack
        .navigationTitle("Friends of \(user.name)")
    }
    
    // TODO: Fix this damn Thing
    func findFriendName(from friend: Friend, in user: [User]) -> some View {
        guard let user = user.first(where: { $0.id == friend.id }) else {
            return AnyView(Text("\(friend.name), \n\(friend.id)"))
//            return AnyView(DetailView(user: friend.id))
        }
        return AnyView(DetailView(user: user))
    }
}




@available(iOS 15.0, *)
struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        
        FriendListView(users: FetchData(), user: User.example)
    }
}

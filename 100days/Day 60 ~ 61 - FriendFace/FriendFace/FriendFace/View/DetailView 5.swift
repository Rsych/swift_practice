//
//  DetailView.swift
//  FriendFace
//
//  Created by Ryan J. W. Kim on 2021/10/27.
//

import SwiftUI

@available(iOS 15.0, *)
struct DetailView: View {
    // MARK: - Properties
    @ObservedObject var users = FetchData()
    @ObservedObject var friends = FriendFetch()
        let user: User
    
    // MARK: - Body
    var body: some View {
        Form {
            Section{
                HStack{
                    Section{
                        Text("Name")
                        Spacer()
                        Text(user.name)
                    }
                }
                HStack{
                    Section{
                        Text("Status")
                        Spacer()
                        Text(user.isActive ? "Active" : "Not Active")
                    }
                    
                }
                HStack{
                    Section{
                        Text("Age")
                        Spacer()
                        Text("\(user.age) old")
                    }
                }
                HStack{
                    Section{
                        Text("Friend status")
                        Spacer()
                        Text("Has \(user.friends.count) Friends")
                    }
                }
                HStack{
                    Section{
                        Text("Working at")
                        Spacer()
                        Text(user.company)
                    }
                }
                HStack{
                    Section{
                        Text("Address")
                        Spacer()
                        Text(user.address)
                    }
                }
                HStack{
                    Section{
                        Text("Founded on ")
                        Spacer()
                        Text(user.registered.formatted(date: .long, time: .omitted))
                    }
                }
                HStack{
                    Section{
                        Text("Email")
                        Spacer()
                        Text(user.email)
                    }
                }
            } //: Section 1
//            Text("\(user.friends.description)")
            .font(.headline)
            .foregroundColor(.gray)
            
            
            NavigationLink {
                FriendListView(user: user)
            } label: {
                Text("See Friends")
            } //: NAV Link
            
        } //: Form
        .navigationTitle("Detail of \(user.name)")
        
    } //: Body
        
}
    

@available(iOS 15.0, *)
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User.example)
    }
}

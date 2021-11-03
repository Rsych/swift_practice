//
//  ContentView.swift
//  FriendFace
//
//  Created by Ryan J. W. Kim on 2021/10/27.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
//    @StateObject var fetchData = FetchData()
    @ObservedObject var users = FetchData()
    // MARK: - Body
    var body: some View {
    
          
        UserListView(users: users)
        
      
    } //: body
    
} //: ContentView

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

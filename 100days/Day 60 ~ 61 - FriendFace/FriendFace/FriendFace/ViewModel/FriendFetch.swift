//
//  FriendFetch.swift
//  FriendFace
//
//  Created by Ryan J. W. Kim on 2021/10/27.
//

import Foundation

class FriendFetch: ObservableObject, Identifiable {
    @Published var friends: [Friend] = []
    private var friend: Friend?
    
    init(friend : Friend? = nil) {
        self.friend = friend
    }
    func friendFetch() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let decoder = JSONDecoder()
           
            if let data = data {
                
                
                do {
                    let friends = try decoder.decode([Friend].self, from: data)
                    DispatchQueue.main.async {
                        self.friends = friends
                    }
                    print(friends)
                } catch {
                    //TODO: Show error
                    print(error)
                }
            }
        }
        task.resume()
    }
    
}

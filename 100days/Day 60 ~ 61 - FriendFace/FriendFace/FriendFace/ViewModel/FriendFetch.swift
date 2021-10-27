//
//  FriendFetch.swift
//  FriendFace
//
//  Created by Ryan J. W. Kim on 2021/10/27.
//

import Foundation

class FriendFetch: ObservableObject {
    @Published var friends = [Friend]()
    
    init() {
        
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

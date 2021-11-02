//
//  BundleDecodable.swift
//  FriendFace
//
//  Created by Ryan J. W. Kim on 2021/10/27.
//

import Foundation

class FetchData: ObservableObject {
    
    @Published var users = [User]()
   
    init() {
        fetchAllUser()
    }
    
    func fetchAllUser() {
    //TODO show error if cannot create url
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in         
            let decoder = JSONDecoder()
            let formatter = DateFormatter()
            
            formatter.dateFormat = "YYYY-MM-dd"
            
            decoder.dateDecodingStrategy = .iso8601
            
            if let data = data {
                
                
                do {
                    let users = try decoder.decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.users = users
                    }
                    print(users)
                } catch {
                    //TODO: Show error
                    print(error)
                }
            }
        }
        task.resume()
    }
}

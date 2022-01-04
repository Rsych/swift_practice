//
//  CodableDataURLSession.swift
//  WorkingWithData1
//
//  Created by Ryan J. W. Kim on 2021/10/19.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct CodableDataURLSession: View {
    // MARK: - Properties
    @State var results = [Result]()
    // MARK: - Body
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }//: VStack
        } //: List
        .onAppear(perform: loadData)
    }//: body
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            // data is whatever data was returned from the request
            // response is description of the data
            // error is error occurred
            
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data - go back to the main thread
                    DispatchQueue.main.async {
                        // update UI
                        self.results = decodedResponse.results
                    }
                    // Everything is good we exit
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}//: contentview

struct CodableDataURLSession_Previews: PreviewProvider {
    static var previews: some View {
        CodableDataURLSession()
    }
}

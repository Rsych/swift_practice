//
//  SwiftResultTypes.swift
//  UIflow1
//
//  Created by Ryan J. W. Kim on 2021/11/04.
//

import SwiftUI

enum NetworkError: Error {
    case badURL, requestFailed, unknown
}

struct SwiftResultTypes: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                fetchData(from: "https://www.apple.com") { result in
                    switch result {
                    case .success(let str):
//                        print(str)
                        print("success")
                    case .failure(let error):
                        switch error {
                        case .badURL:
                            print("Bad URL")
                        case .requestFailed:
                            print("Network problems")
                        case .unknown:
                            print("Unknown error")
                        }
                    }
                }
            } //: onappear
    } //: body
    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        // check if url is ok else return failure
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    // if we're here everything worked
                    let stringData = String(decoding: data, as: UTF8.self)
                    completion(.success(stringData))
                } else if error != nil {
                    completion(.failure(.requestFailed))
                } else {
                    completion(.failure(.unknown))
                }
            }
        }.resume()
    } //: fetchData func
}


struct SwiftResultTypes_Previews: PreviewProvider {
    static var previews: some View {
        SwiftResultTypes()
    }
}


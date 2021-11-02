//
//  CodableBundleExtension.swift
//  Touchdown
//
//  Created by Ryan J. W. Kim on 2021/09/21.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1. locate json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // 2. create a property for data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to locate \(file) from bundle.")
        }
        // 3. create a decoder
        let decoder = JSONDecoder()
        // 4. create a property for the decoded data
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to locate \(file) from bundle.")
        }
        // 5. return the ready-to-use data
        return decodedData
    }
}

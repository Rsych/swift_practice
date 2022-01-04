//
//  CodableConformancePublished.swift
//  WorkingWithData1
//
//  Created by Ryan J. W. Kim on 2021/10/19.
//

import SwiftUI

class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Ryan"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
    
}

struct CodableConformancePublished: View {
    // MARK: - Properties
    
    
    // MARK: - Body
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
// MARK: - Preview
struct CodableConformancePublished_Previews: PreviewProvider {
    static var previews: some View {
        CodableConformancePublished()
    }
}

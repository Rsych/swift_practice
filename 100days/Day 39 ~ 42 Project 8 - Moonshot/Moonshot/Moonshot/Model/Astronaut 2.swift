//
//  AstronautStruct.swift
//  Moonshot
//
//  Created by Ryan J. W. Kim on 2021/10/13.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}

//
//  MissionStruct.swift
//  Moonshot
//
//  Created by Ryan J. W. Kim on 2021/10/13.
//

import Foundation



struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    } // nested struct
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    var image: String {
        "apollo\(id)"
    }
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium // Change to date style, .short, .medium, .long, .full
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    var formattedNames: String {
        var crewNames = [String]()
        for crew in crew {
            crewNames.append(crew.name)
            
        }
        return crewNames.joined(separator: ", ")
    }
}

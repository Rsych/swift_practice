//
//  VideoModel.swift
//  Africa
//
//  Created by Ryan J. W. Kim on 2021/09/15.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}

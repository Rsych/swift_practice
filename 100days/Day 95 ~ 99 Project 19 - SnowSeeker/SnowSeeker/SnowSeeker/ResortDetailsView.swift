//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Ryan J. W. Kim on 2021/11/17.
//

import SwiftUI

struct ResortDetailsView: View {
    // MARK: - Properties
    let resort: Resort
    
    var size: String {
        switch resort.size {
        case 1:
            return "Small"
        case 2:
            return "Average"
        default:
            return "Large"
        }
    } //: Computed properties for size
    
    var price: String {
        String(repeating: "$", count: resort.price)
    }
    // MARK: - Properties
    var body: some View {
        Group {
            Text("Size: \(size)")
                .layoutPriority(1)
            Spacer().frame(height: 0)
            Text("Price: \(price)")
                .layoutPriority(1)
        }
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ResortDetailsView(resort: Resort.example)
            .previewLayout(.sizeThatFits)
    }
}

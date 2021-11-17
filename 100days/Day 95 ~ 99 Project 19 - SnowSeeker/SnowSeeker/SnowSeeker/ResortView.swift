//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Ryan J. W. Kim on 2021/11/17.
//

import SwiftUI

struct ResortView: View {
    // MARK: - Properties
    @Environment(\.horizontalSizeClass) var sizeClass
    
    let resort: Resort
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                Group {
                    HStack {
                        if sizeClass == .compact {
                            Spacer()
                            VStack {
                                ResortDetailsView(resort: resort)
                            } //: compact Vstack
                            VStack {
                                SkiDetailsView(resort: resort)
                            } //: compact Vstack
                            Spacer()
                        } else {
                            // if landscape or bigger screen
                            ResortDetailsView(resort: resort)
                            Spacer().frame(height: 0)
                            SkiDetailsView(resort: resort)
                        }
                    } //: HStack for details
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top)
                    
                    Text(resort.description)
                        .padding(.vertical)
                    
                    Text("Facilities")
                        .font(.headline)
                    //                    Text(resort.facilities.joined(separator: ", "))
                    Text(ListFormatter.localizedString(byJoining: resort.facilities))
                        .padding(.vertical)
                } //: Group
                .padding(.horizontal)
            } //: Vstack
        } //: Scrollview
        .navigationTitle(Text("\(resort.name), \(resort.country)"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: Resort.example)
.previewInterfaceOrientation(.portrait)
    }
}

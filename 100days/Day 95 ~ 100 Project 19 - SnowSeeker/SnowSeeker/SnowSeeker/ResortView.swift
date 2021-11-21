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
    @EnvironmentObject var favorites: Favorites
    @State private var selectedFacility: Facility?
    
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
                            VStack(alignment: .leading) {
                                ResortDetailsView(resort: resort)
                            } //: compact Vstack
                            VStack(alignment: .trailing) {
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
//                    Text(ListFormatter.localizedString(byJoining: resort.facilities))
                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            facility.icon
                                .font(.title)
                                .onTapGesture {
                                    selectedFacility = facility
                                }
                        } //: facilities icon loop
                    } //: facilities Hstack
                        .padding(.vertical)
                } //: Group
                .padding(.horizontal)
                
                Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
                    if favorites.contains(resort) {
                        favorites.remove(resort)
                    } else {
                        favorites.add(resort)
                    }
                } //: Add or remove fav button
                .padding()
            } //: Vstack
        } //: Scrollview
        .navigationTitle(Text("\(resort.name), \(resort.country)"))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if favorites.contains(resort) {
                        favorites.remove(resort)
                    } else {
                        favorites.add(resort)
                    }
                } label: {
                    Image(systemName: favorites.contains(resort) ? "heart.fill" : "heart")
                        .foregroundColor(favorites.contains(resort) ? .red : .white)
                }
            } //: trailing toolbar
        } //: toolbar
        .navigationBarTitleDisplayMode(.inline)
        .alert(item: $selectedFacility) { facility in
            facility.alert
        }
    }
}


struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: Resort.example)
.previewInterfaceOrientation(.portrait)
    }
}

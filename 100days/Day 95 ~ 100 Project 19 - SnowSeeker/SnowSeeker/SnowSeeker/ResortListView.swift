//
//  ResortListView.swift
//  SnowSeeker
//
//  Created by Ryan J. W. Kim on 2021/11/18.
//

import SwiftUI

struct ResortListView: View {
    let filteredResorts: [Resort]
    @ObservedObject var favirotes = Favorites()
    var body: some View {
        List(filteredResorts) { resort in
            NavigationLink {
                // destination
                ResortView(resort: resort)
            } label: {
                Image(resort.country)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 25)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1))
                VStack(alignment: .leading, spacing: nil) {
                    Text(resort.name)
                        .font(.headline)
                    Text("\(resort.runs) runs")
                        .foregroundColor(.secondary)
                } //: Vstack for name and runs
                .layoutPriority(1)
                
                // favorite heart icon
                if self.favirotes.contains(resort) {
                    Spacer()
                    Image(systemName: "heart.fill")
                        .accessibility(label: Text("This is a favorite resort"))
                        .foregroundColor(.red)
                }
            } //: NavLink
        } //: List
    }
}

struct ResortListView_Previews: PreviewProvider {
    static var previews: some View {
        ResortListView(filteredResorts: Resort.allResorts)
    }
}

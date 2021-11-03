//
//  LocationView.swift
//  NameCarder
//
//  Created by Ryan J. W. Kim on 2021/11/03.
//

import SwiftUI

struct LocationView: View {
    // MARK: - Properties
    let locationFetcher = LocationFetcher()
    // MARK: - Body
    var body: some View {
            VStack {
                Button("Start Tracking Location") {
                    self.locationFetcher.start()
                }

                Button("Read Location") {
                    if let location = self.locationFetcher.lastKnownLocation {
                        print("Your location is \(location)")
                    } else {
                        print("Your location is unknown")
                    }
                }
            }
        }
    }

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

//
//  MapView.swift
//  Africa
//
//  Created by Ryan J.W. Kim on 2021/09/13.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    
    @State private var region: MKCoordinateRegion = {
        var mapCordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCordinates, span: mapZoomLevel)
        return mapRegion
    }()
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    // BODY: - BODY
    var body: some View {
        // MARK: - No1 Basic MAP
        //        Map(coordinateRegion: $region)
        // MARK: - No2 Advanced MAP
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // (A) PIN: OLD STYLE ( always static)
            //             MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B) MARKER: New style (always static)
            //            MapMarker(coordinate: item.location, tint: .accentColor)
            // (C) Custom basic annotation (it could be interactive)
            //            MapAnnotation(coordinate: item.location) {
            //                Image("logo")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 32, height: 32, alignment: .center)
            //            } //: ANNOTATION
            
            // (D) Custom advanced annotation ( it could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }) //: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12, content: {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3, content: {
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    })
                    Divider()
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    })
                }) //: VSTACK
            }) //:HSTACK
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color
                            .black
                            .cornerRadius(8)
                            .opacity(0.6))
            .padding(),
            alignment: .top
            
            
        )
        
    }
}


// MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewDevice("iPhone 12")
    }
}

//
//  ContentView.swift
//  BucketList
//
//  Created by Ryan J. W. Kim on 2021/11/01.
//

import SwiftUI
import MapKit

struct ContentView: View {
    // MARK: - Properties
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    
    @State private var showingEditScreen = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 16, height: 16)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        let newLocation = MKPointAnnotation()
                        newLocation.title = "Example loc"
                        newLocation.coordinate = self.centerCoordinate
                        locations.append(newLocation)
                        
                        // setting selectedPlace to let code know
                        selectedPlace = newLocation
                        showingEditScreen = true
                        print(locations)
                    } label: {
                        Image(systemName: "plus")
                    } //: Annotation add button
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                } //: HStack
            } //: VStack
        } //: ZStack
        .alert(isPresented: $showingPlaceDetails) {
            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
                showingEditScreen = true
            } //: EditButton
            )
        } //: Alert place details
        .sheet(isPresented: $showingEditScreen) {
            if selectedPlace != nil {
                EditView(placemark: selectedPlace!)
            }
        } //: EditView sheet
    } //: body
} //: contentview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

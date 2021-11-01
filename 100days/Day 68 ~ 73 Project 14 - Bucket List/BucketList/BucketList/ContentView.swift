//
//  ContentView.swift
//  BucketList
//
//  Created by Ryan J. W. Kim on 2021/11/01.
//

import SwiftUI
import MapKit

struct pointCircle: View {
    var body: some View {
        Circle()
            .fill(.blue)
            .opacity(0.3)
            .frame(width: 16, height: 16)
    }
} //: Center circle view

struct ContentView: View {
    // MARK: - Properties
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [CodableMKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    
    @State private var showingEditScreen = false
    
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            pointCircle()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        let newLocation = CodableMKPointAnnotation()
                        newLocation.title = ""
                        newLocation.subtitle = ""
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
                .padding(.bottom)
            } //: VStack
        } //: ZStack
        .alert(isPresented: $showingPlaceDetails) {
            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
                showingEditScreen = true
            } //: EditButton
            )
        } //: Alert place details
        .sheet(isPresented: $showingEditScreen, onDismiss: saveData) {
            if selectedPlace != nil {
                EditView(placemark: selectedPlace!)
            }
        } //: EditView sheet
        .onAppear(perform: loadData)
    } //: body
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadData() {
        let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
        
        do {
            let data = try Data(contentsOf: filename)
            locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
            
        } catch {
            print("unable to load saved data")
        }
    }
    
    func saveData() {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(locations)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    } //: SaveData func
} //: contentview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

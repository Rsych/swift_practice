//
//  ContentView.swift
//  BucketList
//
//  Created by Ryan J. W. Kim on 2021/11/01.
//

import SwiftUI
import MapKit
import LocalAuthentication

struct ContentView: View {
    // MARK: - Properties
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [CodableMKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    
    @State private var showingEditScreen = false
    
    @State private var isUnlocked = false
    // MARK: - Body
    var body: some View {
        ZStack {
            if isUnlocked {
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
                            let newLocation = CodableMKPointAnnotation()
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
            } //: isUnlocked
            else {
                Button("Unlock Please") {
                    authenticate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            } //: BIoAuth asking button
        } //: ZStack
        .onAppear(perform: loadData)
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
    } //: body
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    } //: Get directory func
    
    func loadData() {
        let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
        
        do {
            let data = try Data(contentsOf: filename)
            locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
        } catch {
            print("Unable to load saved data.")
        }
    } //: Load data func
    
    func saveData() {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(self.locations)
            try data.write(to: filename, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    } //: SaveData func
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."

            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // error
                    }
                }
            }
        } else {
            // No biometric
        }
    } //: bio Auth func
//    func authenticate() {
//        let context = LAContext()
//        var error:NSError?
//
//        // edit line - deviceOwnerAuthentication
//        guard context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) else {
//            //showAlertViewIfNoBiometricSensorHasBeenDetected()
//            return
//        }
//
//        // edit line - deviceOwnerAuthentication
//        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
//            let reason = "Please authenticate yourself to unlock your places."
//            // edit line - deviceOwnerAuthentication
//            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason, reply: { (success, error) in
//                if success {
//                    DispatchQueue.main.async {
//                        self.isUnlocked = true
//                        print("Authentication was successful")
//                    }
//                }else {
//                    DispatchQueue.main.async {
//                        //self.displayErrorMessage(error: error as! LAError )
//                        print("Authentication was error")
//                    }
//                }
//            })
//        }else {
//           // self.showAlertWith(title: "Error", message: (errorPointer?.localizedDescription)!)
//        }
//    }
} //: contentview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

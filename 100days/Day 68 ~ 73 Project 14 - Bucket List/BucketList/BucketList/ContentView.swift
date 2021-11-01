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
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MapView(centerCoordinate: $centerCoordinate, annotations: locations)
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
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)
                        print(locations)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                } //: HStack
            } //: VStack
        } //: ZStack
    } //: body
} //: contentview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

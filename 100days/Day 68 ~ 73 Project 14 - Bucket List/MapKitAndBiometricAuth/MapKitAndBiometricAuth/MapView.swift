//
//  MapKitView.swift
//  MapKitAndBiometricAuth
//
//  Created by Ryan J. W. Kim on 2021/10/31.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
        func makeUIView(context: Context) -> MKMapView {
            let mapView = MKMapView()
            return mapView
        } //: makeUIView func
    
        func updateUIView(_ view: MKMapView, context: Context) {
            
        } //: UIView update func
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

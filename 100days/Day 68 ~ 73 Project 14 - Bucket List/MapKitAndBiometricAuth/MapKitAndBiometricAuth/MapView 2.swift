//
//  MapKitView.swift
//  MapKitAndBiometricAuth
//
//  Created by Ryan J. W. Kim on 2021/10/31.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        } // this func is called when coordinates changes
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) ->
        MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        } // mapView func gets handed a map view and annotation.
        // reuseIdentifier is set nil cuz I don't want to reuse views so far.
    } //: Coordinator class
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    } //: Make Coordinator func
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        // connect MKMapView
        mapView.delegate = context.coordinator
        
        // MKPointAnnotation is a class conforms to MKAnnotation, MapKit uses to display annotations
        // Create and annotation but MKPointAnnotaition is enough
        let annotation = MKPointAnnotation()
        annotation.title = "Seoul"
        annotation.subtitle = "Capital of Korea"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.532600, longitude: 127.024612)
        mapView.addAnnotation(annotation)
        
        return mapView
    } //: makeUIView func
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
    } //: UIView update func
    
} //: MapView struct body

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

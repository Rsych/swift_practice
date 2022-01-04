//
//  MapView.swift
//  BucketList
//
//  Created by Ryan J. W. Kim on 2021/11/01.
//
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showingPlaceDetails: Bool
    var annotations: [MKPointAnnotation]
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
            
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            // Unique identifier for view reuse
            let identifier = "Placemark"
            // try finding cell we can use
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                // didn't find any, create one
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                // allot pop up info
                annotationView?.canShowCallout = true
                // attach info button on view
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                // view to reuse, give new annotation
                annotationView?.annotation = annotation
            }
            // send it back
            return annotationView
        } // custom annotations
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            guard let placemark = view.annotation as? MKPointAnnotation else { return }
            parent.selectedPlace = placemark
            parent.showingPlaceDetails = true
        } //: gets called when button is tapped
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        if annotations.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "Seoul"
        annotation.subtitle = "Capital of Korea"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.53, longitude: 127.02)
        return annotation
    }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate),
                selectedPlace: .constant(MKPointAnnotation.example), showingPlaceDetails: .constant(false),
                annotations: [MKPointAnnotation.example])
    }
}

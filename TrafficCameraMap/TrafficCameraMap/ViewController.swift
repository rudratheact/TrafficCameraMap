//
//  ViewController.swift
//  TrafficCameraMap
//
//  Created by Rudra on 15/02/21.
//
import Foundation
import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    // Call ViewMovel class
    let viewModel = ViewModel()
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        // Map set to Singapore
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(1.3521, 103.8198), latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        mapView.setRegion(region, animated: true)
        
        viewModel.callAPI(mapView: mapView)
        
    }
    
    //MARK:- MapKit Delegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        if let title = annotation.title{
            viewModel.configureAnnotationView(mapView: self.mapView, annotationView: annotationView!, title: title!)
        }
        return annotationView
    }
    
}



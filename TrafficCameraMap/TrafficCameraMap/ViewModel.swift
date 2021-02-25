//
//  ViewModel.swift
//  TrafficCameraMap
//
//  Created by Rudra on 25/02/21.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

public class ViewModel{
    
    private var camDetails = [TrafficCam]()
    
    private var imageLink = [String:String]()
    
    private var bubbleImage = UIImage()
    
    // Call API
    public func callAPI(mapView:MKMapView){
        
        TrafficCam.fetchData() { [self] (results:[TrafficCam]) in
            
            self.camDetails = results
            
            for result in results {
                print("\(result)")
                
                // Fetch Annotation Record
                let annotation = CamPoint(title: result.camera_id, coordinate: CLLocationCoordinate2DMake(result.lat, result.long))
                // Add annotation into map
                mapView.addAnnotation(annotation)
                
                self.imageLink.updateValue(result.image, forKey: result.camera_id)
                
            }
            DispatchQueue.main.async {
                // Show map Annotation
                mapView.showAnnotations(mapView.annotations, animated: true)
            }
        }
    }
    
    // Create Annotation View
    public func configureAnnotationView(mapView:MKMapView, annotationView: MKAnnotationView, title:String) {
        
        let width = 300
        let height = 200
        
        let calloutView = UIView()
        calloutView.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["calloutView": calloutView]
        
        calloutView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[calloutView(300)]", options: [], metrics: nil, views: views))
        calloutView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[calloutView(200)]", options: [], metrics: nil, views: views))
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        if let link = URL(string: imageLink[title]!){
            UIImage.loadImage(url: link) { (image) in
                // Correct image from server
                imageView.image = image
            }
        }else{
            // Default image
            imageView.image = bubbleImage
        }
        
        calloutView.addSubview(imageView)
        
        annotationView.detailCalloutAccessoryView = calloutView
    }
}

// Annotation class
class CamPoint: NSObject, MKAnnotation{
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.coordinate = coordinate
    }
}

extension UIImage {
    
    // Image download
    public static func loadImage(url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
    
}

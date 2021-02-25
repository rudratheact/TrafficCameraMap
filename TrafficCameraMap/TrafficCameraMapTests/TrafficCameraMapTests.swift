//
//  TrafficCameraMapTests.swift
//  TrafficCameraMapTests
//
//  Created by Rudra on 15/02/21.
//

import XCTest
import MapKit

@testable import TrafficCameraMap

class TrafficCameraMapTests: XCTestCase {
    
    var viewModelToText: TrafficCameraMap.ViewModel!
    
    var viewControllerToTest: TrafficCameraMap.ViewController!
    
    private func setUpViewControllers() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        self.viewControllerToTest = (storyboard.instantiateViewController(withIdentifier: "ViewController") as! TrafficCameraMap.ViewController) //
        self.viewControllerToTest.loadView()
        self.viewControllerToTest.viewDidLoad()
    }
    
    override func setUp() {
        super.setUp()
        
        self.setUpViewControllers()
        self.viewModelToText = TrafficCameraMap.ViewModel()
    }
    
    override func tearDown() {
        viewControllerToTest = nil
        viewModelToText = nil
        super.tearDown()
    }
    
    func testViewControllerIsComposedOfMapView() {
        XCTAssertNotNil(viewControllerToTest.mapView, "ViewController under test is not composed of a MKMapView")
    }
    
    func testControllerConformsToMKMapViewDelegate() {
        
        XCTAssert(viewControllerToTest.conforms(to: MKMapViewDelegate.self), "ViewController under test does not conform to MKMapViewDelegate protocol")
    }
    
    func testAPICall(){
        viewModelToText.callAPI(mapView: viewControllerToTest.mapView)
    }
    
    // MARK:- Model testing
    
    var result: TrafficCam!
    var annotation: CamPoint!
    
    private func dummyRecords(){
        self.result = TrafficCam(camera_id: "9702", image: "https://images.data.gov.sg/api/traffic-images/2021/02/6f7fee1a-343a-49d0-8fe6-675d981f187b.jpg", lat: 1.39466333, long: 103.83474601)
        self.annotation = CamPoint(title: result.camera_id, coordinate: CLLocationCoordinate2DMake(result.lat, result.long))
    }
    
    func testRecords(){
        dummyRecords()
        XCTAssertEqual(result.lat, annotation.coordinate.latitude)
        XCTAssertEqual(result.camera_id, annotation.title)
    }
    
}

/* for Testing
 TrafficCam(camera_id: "9702", image: "https://images.data.gov.sg/api/traffic-images/2021/02/61a3d1a4-0b6c-4135-851f-8f981011fb29.jpg", lat: 1.39474081, long: 103.81797086)
 */

//
//  TrafficCameraMapUITests.swift
//  TrafficCameraMapUITests
//
//  Created by Rudra on 15/02/21.
//

import XCTest

class TrafficCameraMapUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .map).element.tap()
        app.otherElements["6708"].tap()
        
        let kotaTinggiMap = app/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"Kota Tinggi").element/*[[".maps.containing(.other, identifier:\"Singapore Strait\").element",".maps.containing(.other, identifier:\"Singapore Changi Airport (SIN)\").element",".maps.containing(.other, identifier:\"Singapore\").element",".maps.containing(.other, identifier:\"Kampung Pasir Gudang\").element",".maps.containing(.other, identifier:\"Johor Bahru\").element",".maps.containing(.other, identifier:\"Pulai\").element",".maps.containing(.other, identifier:\"Tampoi\").element",".maps.containing(.other, identifier:\"Plentong\").element",".maps.containing(.other, identifier:\"Sungai Tiram\").element",".maps.containing(.other, identifier:\"Tebrau\").element",".maps.containing(.other, identifier:\"Kota Tinggi\").element"],[[[-1,10],[-1,9],[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        kotaTinggiMap.tap()
        app.otherElements["4704"].tap()
        kotaTinggiMap.tap()
        kotaTinggiMap.tap()
        
        let tebrauMap = app/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"Tebrau").element/*[[".maps.containing(.other, identifier:\"Singapore Strait\").element",".maps.containing(.other, identifier:\"Selat Pandan\").element",".maps.containing(.other, identifier:\"Singapore\").element",".maps.containing(.other, identifier:\"Selat Jurong\").element",".maps.containing(.other, identifier:\"Yio Chu Kang\").element",".maps.containing(.other, identifier:\"Tengah Air Base (TGA)\").element",".maps.containing(.other, identifier:\"Seletar Airport (XSP)\").element",".maps.containing(.other, identifier:\"Kampung Pasir Gudang\").element",".maps.containing(.other, identifier:\"Johor Bahru\").element",".maps.containing(.other, identifier:\"Johor Strait\").element",".maps.containing(.other, identifier:\"Tampoi\").element",".maps.containing(.other, identifier:\"Plentong\").element",".maps.containing(.other, identifier:\"Sungai Tiram\").element",".maps.containing(.other, identifier:\"Tebrau\").element"],[[[-1,13],[-1,12],[-1,11],[-1,10],[-1,9],[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tebrauMap.tap()
        tebrauMap.tap()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

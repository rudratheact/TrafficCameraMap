//
//  APICall.swift
//  TrafficCameraMap
//
//  Created by Rudra on 15/02/21.
//

import Foundation

extension TrafficCam{
    
    // API path
    static let basePath = "https://api.data.gov.sg/v1/transport/traffic-images"
    
    static func fetchData (completion: @escaping ([TrafficCam]) -> ()) {
        
        let request = URLRequest(url: URL(string: TrafficCam.basePath)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            var camArray = [TrafficCam]()
            
            if let data = data {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let items = json["items"] as? [[String:Any]] {
                            for item in items{
                                if let cameras = item["cameras"] as? [Any]{
                                    for camera in cameras {
                                        let cameraDetails = camera as! [String : Any]
                                        if let camid = cameraDetails["camera_id"] as? String,
                                           let img = cameraDetails["image"] as? String,
                                           let loc = cameraDetails["location"] as? [String:Double],
                                           let lat = loc["latitude"],
                                           let long = loc["longitude"]
                                        {
                                            camArray.append(TrafficCam(camera_id: camid, image: img, lat: lat, long: long))
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                }catch {
                    print(error.localizedDescription)
                }
                
                completion(camArray)
                
            }
            
        }
        
        task.resume()
    }
}

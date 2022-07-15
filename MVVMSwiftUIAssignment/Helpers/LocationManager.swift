//
//  LocationManager.swift
//  MVVMSwiftUIAssignment
//
//  Created by gnc on 15/07/2022.
//

import Foundation
import CoreLocation

class LocationManager : NSObject, CLLocationManagerDelegate {
    
    var userLocation:CLLocation? = nil
    
    public static let shared = LocationManager()
    let manager = CLLocationManager()
    override init() {
        super.init()
        manager.delegate = self
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.first {
                print("Found user's location: \(location)")
                userLocation = location
            }
        }

        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Failed to find user's location: \(error.localizedDescription)")
            userLocation = nil
        }
    
}

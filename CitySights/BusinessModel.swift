//
//  BusinessModel.swift
//  CitySights
//
//  Created by chirag arora on 28/10/24.
//

import Foundation
import SwiftUI
import CoreLocation

@Observable
class BusinessModel: NSObject, CLLocationManagerDelegate {
    // NSObject is parent class now so BusinessModel is sub class so override init has to be used
    
    var businesses = [Business]()
    var query: String = ""
    var selectedBusiness: Business?
    
    var service = DataService()
    var locationManager = CLLocationManager()
    var currentUserLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init() // Calling original init by super keyword
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func getBusinesses() {
        
        Task {
            businesses = await service.businessSearch(userLocation: currentUserLocation)
        }
        
    }
    
    func getUserLocation() {
        
        // Check for permission
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            
            currentUserLocation = nil
            locationManager.requestLocation()
        }
        else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // detect is user allowed then request location
        if manager.authorizationStatus == .authorizedWhenInUse {
            
            currentUserLocation = nil
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Most recent (last) location in array is our Location
        
        currentUserLocation = locations.last?.coordinate
        
        if currentUserLocation != nil {
            // Call BusinessSearch
            getBusinesses()
        }
        
        manager.stopUpdatingLocation()
    }
    
}

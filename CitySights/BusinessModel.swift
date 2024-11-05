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
    var selectedBusiness: Business?
    
    var service = DataService()
    var locationManager = CLLocationManager()
    var currentUserLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init() // Calling original init by super keyword
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func getBusinesses(query: String?, options: String?, category: String?) {
        
        Task {
            businesses = await service.businessSearch(userLocation: currentUserLocation,
                                                      query: query,
                                                      options: options,
                                                      category: category)
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
        
        if currentUserLocation == nil {
            
            // didUpdateLocation is fired multiple times but we dont want to call yelp api multiple times so if userLocation is nil then we will update user location and only that one time yelp api will be called
            
            currentUserLocation = locations.last?.coordinate
            
            // Call BusinessSearch
            getBusinesses(query: nil, options: nil, category: nil)
        }
        
        manager.stopUpdatingLocation()
    }
    
}

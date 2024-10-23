//
//  BusinessSearch.swift
//  CitySights
//
//  Created by chirag arora on 23/10/24.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var region = Region()
    var total = 0
    
}

struct Region: Decodable {
    
    var center: Coordinate?
    
}

struct Coordinate: Decodable {
    
    var latitude: Double?
    var longitude: Double?
    
}

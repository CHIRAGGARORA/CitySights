//
//  Business.swift
//  CitySights
//
//  Created by chirag arora on 23/10/24.
//

import Foundation


struct Business: Decodable, Identifiable {
    
    var id: String?
    var alias: String?
    var categories: [Category]
    var coordinates: Coordinate?
    var display_phone: String?
    var distance: Double?
    var image_url: String?
    var is_closed: Bool?
    var location: Location?
    var name: String?
    var phone: String?
    var price: String?
    var url: String?
    var rating: Double?
    var review_count: Int?
    
}


struct Category: Decodable {
    
    var alias: String?
    var title: String?
}

struct Location: Decodable {
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var country: String?
    var display_address: [String]?
    var state: String?
    var zip_code: String?
    
}

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
    var displayPhone: String?
    var distance: Double?
    var imageUrl: String?
    var isClosed: Bool?
    var location: Location?
    var name: String?
    var phone: String?
    var price: String?
    var url: String?
    var rating: Double?
    var reviewCount: Int?
    
    enum CodingKeys: String, CodingKey { // Have to specify all the properties mapped or not doesnt matter
        
        case displayPhone = "display_phone"
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case reviewCount = "review_count"
        
        case id
        case alias
        case categories
        case coordinates
        case distance
        case location
        case name
        case phone
        case price
        case url
        case rating
    }
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
    var displayAddress: [String]?
    var state: String?
    var zipCode: String?
    
    enum CodingKeys: String, CodingKey {
        
        case displayAddress = "display_address"
        case zipCode = "zip_code"
        
        case address1
        case address2
        case address3
        case city
        case country
        case state
    }
    
}

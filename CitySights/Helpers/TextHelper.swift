//
//  TextHelper.swift
//  CitySights
//
//  Created by chirag arora on 24/10/24.
//

import Foundation


struct TextHelper {
    
    static func distanceAwayText(meters: Double) -> String {
        // when a function is static we can directly do TextHelper.distanceAwayText
        // otherwise with normal function we have to assign TextHelper to a variable then use method
        // Use static for functions involving (input convert output)
        
        if meters > 1000 {
            return "\(Int(round(meters/1000))) km away"
        }
        else {
            return "\(Int(round(meters))) m away"
        }
        
    }
    
}

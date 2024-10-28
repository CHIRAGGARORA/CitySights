//
//  BusinessModel.swift
//  CitySights
//
//  Created by chirag arora on 28/10/24.
//

import Foundation
import SwiftUI

@Observable
class BusinessModel {
    
    var businesses = [Business]()
    var query: String = ""
    var selectedBusiness: Business?
    
    var service = DataService()
 
    
    func getBusinesses() {
        
        Task {
            businesses = await service.businessSearch()
        }
        
    }
    
}

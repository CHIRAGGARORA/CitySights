//
//  DataService.swift
//  CitySights
//
//  Created by chirag arora on 23/10/24.
//

import Foundation


struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch() async -> [Business]  {
        
        // check if API_KEY exists
        guard apiKey != nil else {
            return [Business]()
        }
        
        // 1) URL
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=35.665517&longitude=139.770398&categories=restaurants&limit=10") {
            
            
            // 2) URL Request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            // 3) URL Session
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
                // 4) Parse JSON
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data)
                return result.businesses
                
            }
            catch {
                print(error)
            }
            
            
        }
    
        return [Business]()
        
    }
    
}

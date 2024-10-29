//
//  mapView.swift
//  CitySights
//
//  Created by chirag arora on 28/10/24.
//

import SwiftUI
import MapKit

struct mapView: View {
    
    @Environment(BusinessModel.self) var businessModel
    
    @State var selectedBusinessId: String?
    
    var body: some View {
        Map(selection: $selectedBusinessId) {
            ForEach(businessModel.businesses, id: \.id) { b in
            
                Marker(b.name ?? "Restaurant", coordinate: CLLocationCoordinate2D(latitude: b.coordinates?.latitude ?? 0, longitude: b.coordinates?.longitude ?? 0))
                
                    .tag(b.id ?? "nil") // Nil Coalescing operator
            }
        }
        .onChange(of: selectedBusinessId) { oldValue, newValue in
            // find business which matches with id
            let business = businessModel.businesses.first { business in
                business.id == selectedBusinessId
            }
            
            // If business is found set it to selected one
            if let business = business {
                businessModel.selectedBusiness = business
            }
        }
        
    }
}

#Preview {
    mapView()
        .environment(BusinessModel())
}

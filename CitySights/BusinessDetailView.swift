//
//  BusinessDetailView.swift
//  CitySights
//
//  Created by chirag arora on 24/10/24.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business: Business?
    
    var body: some View {
        Text(business?.name ?? "")
    }
}

#Preview {
    BusinessDetailView()
}

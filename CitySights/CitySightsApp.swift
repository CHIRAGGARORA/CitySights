//
//  CitySightsApp.swift
//  CitySights
//
//  Created by chirag arora on 23/10/24.
//

import SwiftUI

@main
struct CitySightsApp: App {
    
    @State var businessModel = BusinessModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(businessModel)
        }
    }
}

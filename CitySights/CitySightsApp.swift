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
    @AppStorage("onboarding") var needsOnboarding = true
    // @AppStorage will store this property under the key "onboarding" on the device and it will fetch this value from device for each session in future (All under the Hood)
    
    
    var body: some Scene {
        WindowGroup {
            HomeView() // root view
                .environment(businessModel)
                .fullScreenCover(isPresented: $needsOnboarding) {
                    // on Dismiss
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                        .environment(businessModel)
                }
                .onAppear {
                    
                    // If no Onboarding is needed still get LOCATION
                    if needsOnboarding == false {
                        businessModel.getUserLocation()
                    }
                }

        }
    }
}

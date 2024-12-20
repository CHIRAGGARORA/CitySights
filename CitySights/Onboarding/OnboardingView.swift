//
//  OnboardingView.swift
//  CitySights
//
//  Created by chirag arora on 30/10/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(BusinessModel.self) var businessModel
    @Environment(\.dismiss) var dismiss
    @State var selectedViewIndex = 0
    
    var body: some View {
        
        ZStack {
            
            if selectedViewIndex == 0{
                Color(red: 111/255, green: 154/255, blue: 189/255)
            }
            else {
                Color(red: 139/255, green: 166/255, blue: 65/255)
            }
            
            TabView (selection: $selectedViewIndex) {
                
                OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255), headline: "Welcome to City Sights", subHeadline: "City Sights helps to find you Best in the city") {
                    
                    withAnimation {
                        selectedViewIndex = 1
                    }
                    
                }
                .tag(0)
                
                .ignoresSafeArea()
                
                OnboardingViewDetails(bgColor: Color(red: 139/255, green: 166/255, blue: 65/255), headline: "Discover your City", subHeadline: "We'll show you the best Restaurants, venues, and more, based on your location") {
                    
                    // Ask user for Location Premission
                    businessModel.getUserLocation()
                    dismiss()
                    
                }
                
                .tag(1)
                
                .ignoresSafeArea()
                
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                HStack (spacing: 16) {
                    Spacer()
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .gray)
                    
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 1 ? .white : .gray)
                    Spacer()
                }
                .padding(.bottom, 220)
            }
            
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    OnboardingView()
}

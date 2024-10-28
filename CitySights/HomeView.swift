//
//  ContentView.swift
//  CitySights
//
//  Created by chirag arora on 23/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(BusinessModel.self) var businessModel
    @State var selectedtab = 0
    
    var body: some View {
        
        @Bindable var businessModel = businessModel
        
        VStack {
            HStack {
                TextField("What are you looking for?", text: $businessModel.query)
                Button {
                    // TODO 
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }

            }
            
            // Show picker
            Picker("", selection: $selectedtab) {
                Text("List")
                    .tag(0)
                
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            
            // Show map or list
            if selectedtab == 1 {
                mapView()
            }
            else {
                ListView()
            }
            
        }
        .onAppear(perform: {
            businessModel.getBusinesses()
        })
        .sheet(item: $businessModel.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
}

#Preview {
    HomeView()
        .environment(BusinessModel())
}

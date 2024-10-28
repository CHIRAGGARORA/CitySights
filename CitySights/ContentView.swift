//
//  ContentView.swift
//  CitySights
//
//  Created by chirag arora on 23/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(BusinessModel.self) var businessModel
    
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
            
            List {
                ForEach(businessModel.businesses) { business in
                    VStack (spacing: 20) {
                        HStack (spacing: 0) {
                            Image("list-placeholder-image")
                                .padding(.trailing, 16)
                            VStack (alignment: .leading) {
                                Text(business.name ?? "Restaurant")
                                    .font(Font.system(size: 15))
                                    .bold()
                                Text(TextHelper.distanceAwayText(meters: business.distance ?? 0))
                                    .font(Font.system(size: 16))
                                    .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                            }
                            Spacer()
                            Image("regular_\(round(business.rating ?? 0))")
                        }
                        Divider()
                    }
                    .onTapGesture {
                        businessModel.selectedBusiness = business
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
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
    ContentView()
}

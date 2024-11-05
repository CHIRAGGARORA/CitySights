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
    
    @State var query = ""
    @FocusState var queryBoxFocused: Bool
//    @State var showOptions = false
    
    @State var dealsOn = false
    @State var popularOn = false
    @State var categorySelection = "restaurants"
    
    var body: some View {
        
        @Bindable var businessModel = businessModel
        
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                    .focused($queryBoxFocused)
                
                Button {
                    withAnimation{
//                        showOptions = false
                        queryBoxFocused = false
                    }
                        
                    
                    // perform a search
                    businessModel.getBusinesses(query: query,
                                                options: getOptionsString(),
                                                category: categorySelection)
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .frame(height: 32)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(6)
                }

            }
            .padding(.horizontal)
            
            // Show if textBox is focused
            if queryBoxFocused {
                
                // Query options
                VStack {
                    Toggle("Popular", isOn: $popularOn)
                    
                    Toggle("Deals", isOn: $dealsOn)
                    
                    HStack {
                        Text("Category")
                        Spacer()
                        Picker("Category", selection: $categorySelection) {
                            Text("Restaurants")
                                .tag("restaurants")
                            Text("Arts")
                                .tag("arts")
                        }
                    }
                }
                .padding(.horizontal, 40)
                .transition(.scale)
                
                
            }
            
            
            
            // Show picker
            Picker("", selection: $selectedtab) {
                Text("List")
                    .tag(0)
                
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            // Show map or list
            if selectedtab == 1 {
                mapView()
                    .onTapGesture {
                        withAnimation{
//                            showOptions = false
                            queryBoxFocused = false
                        }
                    }
            }
            else {
                ListView()
                    .onTapGesture {
                        withAnimation{
//                            showOptions = false
                            queryBoxFocused = false
                        }
                    }
            }
            
        }
        .onAppear(perform: {
            businessModel.getBusinesses(query: nil, options: nil, category: nil)
        })
        .sheet(item: $businessModel.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
    
    func getOptionsString() -> String {
        
        var optionsArray = [String]()
        if popularOn {
            optionsArray.append("hot_and_new")
        }
        if dealsOn {
            optionsArray.append("deals")
        }
        return optionsArray.joined(separator: ",")
        
    }
}

#Preview {
    HomeView()
        .environment(BusinessModel())
}

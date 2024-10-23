//
//  ContentView.swift
//  CitySights
//
//  Created by chirag arora on 23/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        HStack {
            TextField("What are you looking for?", text: $query)
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
        .padding()
        .task {
            let businesses = await service.businessSearch()
        }
    }
}

#Preview {
    ContentView()
}

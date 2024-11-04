//
//  ListView.swift
//  CitySights
//
//  Created by chirag arora on 28/10/24.
//

import SwiftUI

struct ListView: View {
    
    @Environment(BusinessModel.self) var businessModel
    
    
    var body: some View {
        
        List {
            ForEach(businessModel.businesses) { business in
                VStack (spacing: 20) {
                    HStack (spacing: 0) {
                        
                        if let imageUrl = business.imageUrl {
                            // Display the business image
                            AsyncImage(url: URL(string: imageUrl)!) { image in
                                // here image is the returned imageComponent which is downloaded
                                image
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                                    .padding(.trailing, 16)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 50, height: 50)
                            }

                        }
                        else {
                            Image("list-placeholder-image")
                                .padding(.trailing, 16)
                        }
                        
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
}

#Preview {
    ListView()
        .environment(BusinessModel())
}

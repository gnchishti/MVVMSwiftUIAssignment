//
//  ContentView.swift
//  MVVMSwiftUIAssignment
//
//  Created by gnc on 14/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject fileprivate var viewModel = TransportViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.features, id: \.self ) { feature in
                NavigationLink(destination: DetailedContentView(feature: feature))
                {
                    VStack (alignment: .leading)
                    {
    
                        Text("\(feature.properties.label)!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("600m Bike station")
                            .foregroundColor(.gray)
                        Spacer()
                        Spacer()
                        Spacer()
                        HStack () {
                            VStack () {
                                Image("Bike")
                                Text ("Available Bikes")
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                Text ("\(feature.properties.bikes)")
                                    .font(Font.system(size: 50))
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
    
    
                            }
                            Spacer()
                            VStack () {
    
                                Image("Lock")
                                Text ("Available Places")
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                Text ("\(feature.properties.bike_racks)")
                                    .font(Font.system(size: 50))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
    
                            }
                        }
                    }
                }
                
            }
        }
        
        
        
        
        .overlay {
            if viewModel.isFetching {
                ProgressView("Fetching data, please wait...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
            }
        }
        
        .animation(.default, value: viewModel.features)
        .task {
            await viewModel.fetchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

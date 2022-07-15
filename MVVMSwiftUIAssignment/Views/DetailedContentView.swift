//
//  DetailedContentView.swift
//  MVVMSwiftUIAssignment
//
//  Created by gnc on 15/07/2022.
//

import SwiftUI
import MapKit

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}


struct DetailedContentView: View {
    
    var feature:Feature?=nil
    @State private var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 16.911623, longitude: 52.402831), span: MKCoordinateSpan(latitudeDelta: 1.5, longitudeDelta: 1.5))
    
    var body: some View {
        VStack {
            VStack {
                Map(coordinateRegion: $coordinateRegion)
            }
            
            VStack (alignment: .leading)
            {
                Spacer()
                Spacer()
                Text("\(self.feature!.properties.label)!")
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
                        Text ("\(feature!.properties.bikes)")
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
                        Text ("\(feature!.properties.bike_racks)")
                            .font(Font.system(size: 50))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)

                    }
                }
            }
            .frame(width: UIScreen.screenWidth*0.85, height: 250, alignment: .center)
        }
        
        
    }
}

struct DetailedContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedContentView()
    }
}

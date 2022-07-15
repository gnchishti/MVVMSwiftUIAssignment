//
//  TransportNetwork.swift
//  MVVMSwiftUIAssignment
//
//  Created by gnc on 14/07/2022.
//

import Foundation

class TransportNetwork  {
    public static var shared = TransportNetwork()
    
    func getData(handler:@escaping (ApplicationData) -> Void) {
        
//        guard let url = URL(string: "http://www.poznan.pl/mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe") else {
//            print("Invalid URL")
//            return
//        }
//
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            if let decodedResponse = try? JSONDecoder().decode(ApplicationData.self, from: data) {
//                results = decodedResponse.results
//            }
//        } catch {
//            print("Invalid data")
//        }
        
        
        if let url = URL(string: "http://www.poznan.pl/mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if error == nil {
                    if let data = data {
                        if let decodedResponse = try? JSONDecoder().decode(ApplicationData.self, from: data) {
                            handler(decodedResponse)
                        }
                    }
                } else {
                    print("error \(String(describing: error))")
                }
            }
        }
        
        
    }
    
    
}

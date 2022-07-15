//
//  TransportViewModel.swift
//  MVVMSwiftUIAssignment
//
//  Created by gnc on 14/07/2022.
//

import Foundation

public class TransportViewModel : ObservableObject {
    @Published var features = [Feature]()
    @Published var isFetching  = false

    func fetchData() async {
        isFetching = true
        guard let url = URL(string: "http://www.poznan.pl/mim/plan/map_service.html?mtype=pub_transport&co=stacje_rowerowe") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(ApplicationData.self, from: data) {
                DispatchQueue.main.async {
                    self.features = decodedResponse.features
                }
            }
        } catch {
            print("Invalid data")
        }
        DispatchQueue.main.async {
            self.isFetching = false
        }
        
    }
}

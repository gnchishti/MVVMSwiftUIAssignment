//
//  Models.swift
//  MVVMSwiftUIAssignment
//
//  Created by gnc on 14/07/2022.
//

import Foundation


struct ApplicationData : Codable, Equatable {
    let features: [Feature]
    let crs : CRS
    let type : String
}

struct CRS: Codable, Equatable {
    let type: String
    let properties: CRSProperty
}

struct CRSProperty : Codable, Equatable {
    let code:String
}

struct Feature: Codable, Equatable, Identifiable, Hashable {
    let id : String
    let type: String
    let properties:FeatureProperty
    let geometry:FeatureGeometry
    
    func hash(into hasher: inout Hasher) {
        
    }
}

struct FeatureGeometry: Codable, Equatable {
    let coordinates: [Double]
    let type: String
}

struct FeatureProperty: Codable, Equatable {
    let free_racks: String
    let bikes: String
    let label: String
    let bike_racks: String
    let updated: String
}




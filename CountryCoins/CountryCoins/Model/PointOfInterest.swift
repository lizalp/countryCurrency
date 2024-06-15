//
//  PointsOfInterest.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

import Foundation

// MARK: - Internal Models
struct PointOfInterest: Codable, Hashable {
    let pais: String
    let points: [CitiesDTO]
}

struct PointsOfInterestDTO: Codable, Hashable {
    let Paises: [[String: [CitiesDTO]]]
}

struct CitiesDTO: Codable, Hashable {
    let estado: String
    let lugares: [String]
}


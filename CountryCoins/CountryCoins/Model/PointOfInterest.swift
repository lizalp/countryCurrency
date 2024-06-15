//
//  PointsOfInterest.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

import Foundation

// MARK: - PointsOfInterest
struct PointsOfInterest: Codable {
    let paises: [[String: [Paise]]]

    enum CodingKeys: String, CodingKey {
        case paises = "Paises"
    }
}

// MARK: - Paise
struct Paise: Codable {
    let estado: String
    let lugares: [String]
}

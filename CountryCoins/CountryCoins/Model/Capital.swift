//
//  Capitals.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

import Foundation

// MARK: - Capital
struct Capital: Codable {
    let estado: String
}

typealias Capitals = [[String: [Capital]]]

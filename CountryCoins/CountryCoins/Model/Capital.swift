//
//  Capitals.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

import Foundation

// MARK: - Capital
struct Capital: Codable {
    let name: String
    let estados: [String]
}

struct State: Codable, Hashable {
    let estado: String
}

// [[String: [Capital]]]

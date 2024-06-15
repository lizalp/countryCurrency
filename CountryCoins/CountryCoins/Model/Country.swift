//
//  Country.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

import Foundation

// MARK: - Country
struct Country: Codable {
    let id: Int
    let nombre: String
}

typealias Countrys = [Country]

//
//  CurrencyConversion.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

import Foundation

struct CorrencyConversion: Codable {
    let fromCurrency: String
    let rates: [String: Double]
}

typealias CurrencyConversion = [[String: [String: Double]]]

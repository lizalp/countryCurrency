//
//  Currency.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

import Foundation

// MARK: - CurrencyElement
struct CurrencyElement: Codable {
    let nombre: String
    let moneda: String
}

typealias Currency = [CurrencyElement]

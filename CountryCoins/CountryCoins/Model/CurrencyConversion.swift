//
//  CurrencyConversion.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

// MARK: - Internal Models
struct CurrencyConversion {
    let primaryCurrency: String
    let currencyConversionRates: [CurrencyValue]
}

struct CurrencyValue: Codable {
    let SecondaryCurrency: String
    let rate: Double
}

// MARK: - DTO Models
struct CurrencyDTO: Decodable, Hashable {
    let nombre: String
    let moneda: String
}

struct CurrencyConversionDTO: Codable {
    let currency: String
    let rates: [String: Double]
}


//
//  AppStorage.swift
//  CountryCoins
//
//  Created by Liz Alpizar on 12/06/24.
//

import Foundation

class AppStorage {
    var flags: [Flag] = []
    var countriesDetails: [CountryDetail] = []
    
    func fetchFlags() {
        guard let url = Bundle.main.url(forResource: "Flags", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([String: String].self, from: data) else { return }
        flags = decoded.map({ (key: String, value: String) in
            Flag(countryName: key, flagName: value)
        })
    }
    
    func fetchCountriesDetails() -> [CountryDetail]? {

        guard let url = Bundle.main.url(forResource: "CountryDetail", withExtension: "json"), let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([CountryDetail].self, from: data) else { return nil }
        return decoded
    }
    
//    func getCountryDetails() -> [CountryDetailsDTO]? {
//            guard let jsonMock = getMockData(from: CountryMockNames.CountryDetails.rawValue),
//                  let decoded = try? decodeJSON(type: [CountryDetailsDTO].self, from: jsonMock) else { return nil }
//            return decoded
//        }

}


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
    var capitals: [Capital] = []
    var pointsOfInterest: [PointOfInterest] = []
    
    
    func fetchFlags() {
        guard let url = Bundle.main.url(forResource: "Flags", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([String: String].self, from: data) else { return }
        flags = decoded.map({ (key: String, value: String) in
            Flag(countryName: key, flagName: value)
        })
    }
    
    func fetchCountriesDetails() {

        guard let url = Bundle.main.url(forResource: "CountriesDetails", withExtension: "json"), 
            let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([CountryDetail].self, from: data) else { return }
        countriesDetails = decoded //guardar info
    }
    
    func fetchCapitals() {
        guard let url = Bundle.main.url(forResource: "Capitals", withExtension: "json"),
                let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([[String: [State]]].self, from: data),
              let countryDict = decoded.first else { return }
        
        let countries = countryDict.map { (key: String, value: [State]) -> Capital in
            let estados = value.map { $0.estado }
            return Capital(name: key, estados: estados)
        }
        
        capitals = countries
    }
    
    func fetchPointsOfInterest() {
        guard let url = Bundle.main.url(forResource: "PointsOfInterest", withExtension: "json"),
                let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode(PointsOfInterestDTO.self, from: data) else { return }
        
        var pointsOfIntererst = [PointOfInterest]()
        
        for pais in decoded.Paises {
            for (key, value) in pais {
                let countryName = key
                let places = value.map { $0 }
                let poi = PointOfInterest(pais: countryName, points: places)
                pointsOfIntererst.append(poi)
            }
        }
        
        pointsOfInterest = pointsOfIntererst
    }
    
    

}


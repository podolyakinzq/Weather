//
//  DataManager.swift
//  Weather
//
//  Created by Серёня on 24.06.2022.
//

import Foundation

class CitiesDataManager {
    
    static let shared = CitiesDataManager()
    
    private init() {}
    
    let cities: [City] = [
        City(city: "Moscow", lat: "55.75", lon: "37.61"),
        City(city: "Saint-Petersburg", lat: "59.93", lon: "30.31"),
        City(city: "Ekaterinburg", lat: "56.85", lon: "60.61"),
        City(city: "Nizhniy Novgorod", lat: "56.32", lon: "44.00"),
        City(city: "Chelyabinsk", lat: "55.15", lon: "61.42"),
        City(city: "Omsk", lat: "54.99", lon: "73.36"),
        City(city: "Rostov - on - Don", lat: "47.23", lon: "39.72"),
        City(city: "Ufa", lat: "54.74", lon: "55.96"),
        City(city: "Novosibirsk", lat: "55.04", lon: "82.93"),
        City(city: "Samara", lat: "53.20", lon: "50.15"),
        City(city: "Krasnoyarsk", lat: "56.01", lon: "92.86")
    ]
    
}

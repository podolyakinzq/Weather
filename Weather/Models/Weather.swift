//
//  Weather.swift
//  Weather
//
//  Created by Серёня on 24.06.2022.
//

import Foundation

struct City {
    let city: String
    let lat: String
    let lon: String
    
    var welcomeLabel: String {
        "Weather in \(city)"
    }
}

struct OpenWeather: Decodable {
    let weather: [Conditions]?
    let main: MainWeather?
    
    var labelForecast: String {
        """
        Conditions: \(weather?.first?.description ?? "")
        Temperature:  \(main?.temp ?? 0) C
        Feels like: \(main?.feels_like ?? 0) С
        Minimum: \(main?.temp_min ?? 0) C
        Maximum: \(main?.temp_max ?? 0) C
        """
    }
}

struct Conditions: Decodable {
    let description: String?
    let icon: String?
}

struct MainWeather: Decodable {
    let temp: Double?
    let feels_like: Double?
    let temp_min: Double?
    let temp_max: Double?
}


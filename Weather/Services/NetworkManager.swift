//
//  NetworkManager.swift
//  Weather
//
//  Created by Серёня on 24.06.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init () {}
    
    func fetchData(_ lat: String, _ lon: String) async throws -> OpenWeather {
        guard let url = URL(
            string:
            Link.firstPartURL.rawValue
            + lat
            + Link.secondPartURL.rawValue
            + lon
            + Link.thirdPartURL.rawValue) else { throw NetworkError.invalidURL }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        guard let weather = try? decoder.decode(OpenWeather.self, from: data) else { throw NetworkError.decodingError }
        
        return weather
    }
    
    func fetchImage(for idIcon: String) async throws -> Data {
        guard let url = URL(
            string:
            Link.firstPartImageURL.rawValue
            + idIcon
            + Link.secondPartImageURL.rawValue
        ) else { throw NetworkError.invalidURL }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return data
    }
}

enum NetworkError: Error {
    case invalidURL
    case decodingError
    case noData
}

enum Link: String {
    case firstPartURL = "https://api.openweathermap.org/data/2.5/weather?lat="
    case secondPartURL = "&lon="
    case thirdPartURL  = "&APPID=f1962e68826f58324d0fb0d9f9cd1ce7&units=metric&lang=ru"
    
    case firstPartImageURL = "https://openweathermap.org/img/wn/"
    case secondPartImageURL = "@2x.png"
}

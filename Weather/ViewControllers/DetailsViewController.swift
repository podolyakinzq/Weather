//
//  DetailsViewController.swift
//  Weather
//
//  Created by Серёня on 24.06.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var city: City!

    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = city.welcomeLabel
        showWeather()
    }
    
    private func showWeather() {
        Task {
            do {
                let weather = try await NetworkManager.shared.fetchData(city.lat, city.lon)
                weatherLabel.text = weather.labelForecast
                let idIcon = weather.weather?.first?.icon ?? "04d"
                let image = try await NetworkManager.shared.fetchImage(for: idIcon)
                weatherImage.image = UIImage(data: image)
            }
        }
    }
}

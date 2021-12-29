//
//  WeatherViewModel.swift
//  Weather
//
//  Created by irfan on 29/12/2021.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var descriptionText: String = "--"
    @Published var temp: String = "--"
    @Published var timezone: String = "--"
    @Published var tempMin: String = "--"
    @Published var tempMax: String = "--"
    @Published var humidity: String = "--"
    @Published var windSpeed: String = "--"
    
    var query: String = "London"
    
    init() {
        fetchWeather()
    }
    
    func fetchWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(query)&appid=09a7a33b33d1e82facecdd9df1a0fef1") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async {
                    self.title = model.name
                    let celsiusTemp = model.main.temp - 273.15
                    let tempMin = model.main.temp_min - 273.15
                    let tempMax = model.main.temp_max - 273.15
                    self.temp = String(format: "%.0f", celsiusTemp) + "°C"
                    self.descriptionText = model.weather.first?.main ?? "--"
                    self.timezone = "\(model.timezone)"
                    self.tempMin = String(format: "%.0f", tempMin) + "°"
                    self.tempMax = String(format: "%.0f", tempMax) + "°"
                    self.humidity = "\(model.main.humidity)%"
                    self.windSpeed = "\(model.wind.speed)m/s"
                }
            } catch { print("failed") }
        }
        task.resume()
    }
}

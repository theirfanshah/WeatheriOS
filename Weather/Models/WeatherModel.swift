//
//  WeatherModel.swift
//  Weather
//
//  Created by irfan on 29/12/2021.
//

import Foundation

struct WeatherModel: Codable {
    let name: String
    let timezone: Int
    let weather: [CurrentWeather]
    let main: Temp
    let wind: Wind
}

struct CurrentWeather: Codable {
    let main: String
    let description: String
}

struct Temp: Codable {
    let temp: Float
    let temp_min: Float
    let temp_max: Float
    let humidity: Int
}

struct Wind: Codable {
    let speed: Float
}

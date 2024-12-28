//
//  WeatherResponse.swift
//  Weather
//
//  Created by Диас Адямов  on 27.12.2024.
//

import Foundation
struct WeatherResponse: Decodable {
    
    let current_weather: Temperature
    
    struct Temperature: Decodable {
        let temperature: Float
    }
}

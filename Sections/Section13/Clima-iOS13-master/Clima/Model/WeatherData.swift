//
//  WeatherData.swift
//  Clima
//
//  Created by Paulo Pinheiro on 11/15/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    struct Weather: Codable {
        let description: String
        let id: Int
    }
    struct Main: Codable {
        let temp: Double
    }
}

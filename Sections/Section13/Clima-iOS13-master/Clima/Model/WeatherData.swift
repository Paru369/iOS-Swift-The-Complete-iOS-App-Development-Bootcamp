//
//  WeatherData.swift
//  Clima
//
//  Created by Paulo Pinheiro on 11/15/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    struct Weather: Decodable {
        let description: String
    }
    struct Main: Decodable {
        let temp: Double
    }
}

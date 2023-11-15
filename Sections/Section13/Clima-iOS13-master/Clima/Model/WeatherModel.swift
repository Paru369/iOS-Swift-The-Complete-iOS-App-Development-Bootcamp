//
//  WeatherModel.swift
//  Clima
//
//  Created by Paulo Pinheiro on 11/15/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let temperature: Double
    let cityName: String
    var conditionName: String {
        return getConditionName(weatherId: conditionId)
    }
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    func getConditionName(weatherId: Int) -> String {
        
        switch weatherId {
        case 200...299: //ThunderStorm
            return "cloud.bolt.rain"
        case 300...399: //Drizz/e
            return "cloud.drizzle"
        case 400...499: //
            return "cloud"
        case 500...599: // Rain
            return "cloud.rain"
        case 600...699: //Snow
            return "cloud.snow"
        case 700...799: // Atmosphere
            return "smoke.fill"
        case 800: // Clear
            return "sun.max.fill"
        case 801...899: // Clouds
            return "cloud.fill"
        default:
            return "aqi.low"
            
        }
        
    }
}

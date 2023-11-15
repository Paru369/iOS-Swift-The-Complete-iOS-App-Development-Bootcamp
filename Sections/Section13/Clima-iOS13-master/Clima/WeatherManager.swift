//
//  WeatherManager.swift
//  Clima
//
//  Created by Paulo Pinheiro on 11/14/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=e9905482010a6041852ab3c965177421"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        // 1. Create a URL
        
        if let url = URL(string: urlString) {
            // 2. Create a URLSessopm
            let session = URLSession(configuration: .default)
            // 3 . Give the session a taks
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            // 4 . Start the taks
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
             let decoderData = try decoder.decode(WeatherData.self, from: weatherData)
            print("=> \(decoder.self)")
            print(decoderData.weather[0].description)
        } catch {
            print(error)
        }
        }
    
 
}

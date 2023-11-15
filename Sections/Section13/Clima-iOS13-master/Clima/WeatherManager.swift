//
//  WeatherManager.swift
//  Clima
//
//  Created by Paulo Pinheiro on 11/14/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate  {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
}

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=e9905482010a6041852ab3c965177421"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
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
                    if let weather = self.parseJSON(weatherData: safeData) {
                        //let weatherVC = WeatherViewController()
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            // 4 . Start the taks
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decoderData.weather[0].id
            let temp = decoderData.main.temp
            let name = decoderData.name
            
            let weather = WeatherModel(conditionId: id, temperature: temp, cityName: name)
            return weather
        } catch {
            print(error)
            return nil
        }
    }
    
}

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
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        // 1. Create a URL
        
        if let url = URL(string: urlString) {
            print("-> \(url)")
            // 2. Create a URLSessopm
            let session = URLSession(configuration: .default)
            // 3 . Give the session a taks
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            // 4 . Start the taks
            task.resume()
        }
        
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            print("---> \(safeData)")
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}

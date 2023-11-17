//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Paulo Pinheiro on 11/17/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//


import Foundation

protocol CoinManagerDelegate  {
    func didUpdatePrice(_ coinManager: CoinManager, price: Double)
    func didFailWithError(error: Error)
}

    
struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "5A018DA0-9B26-4A5A-BAC1-326A2BDE596A"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        let urlString = getURLString(currency: currency)
        let data = performRequest(with: urlString)
        
    }
    
    func getURLString(currency: String) -> String {
        let URLString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        return URLString
    }
    
    func parseJson(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodeData.rate
            return lastPrice
        } catch {
            delegate?.didFailWithError(error: error)
            print(error)
            return nil
        }
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, reponse, error) in
                if error != nil {
                   // self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                   
                    if let price = self.parseJson(safeData) {
                          self.delegate?.didUpdatePrice(self, price: price)
                    }
                }
            }
            
            task.resume()
            
                    }
                }
            }


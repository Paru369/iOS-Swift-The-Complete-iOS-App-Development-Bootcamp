//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "5A018DA0-9B26-4A5A-BAC1-326A2BDE596A"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        let urlString = getURLString(currency: currency)
        let data = performRequest(with: urlString)
        print(data)
    }
    
    func getURLString(currency: String) -> String {
        let URLString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        return URLString
    }
    
    func parseJson(safeData: Data){
        
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
                    print( String(data: safeData, encoding: String.Encoding.utf8) ?? "deu ruim")
                    return
                    //  if let price = self.parseJason(safeData) {
                     //   self.delegate?.didUpdatePrice(self, price: price)
                    
                }
            }
            
            task.resume()
            
                    }
                }
            }


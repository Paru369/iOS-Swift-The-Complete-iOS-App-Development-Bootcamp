//
//  CoinData.swift
//  ByteCoin
//
//  Created by Paulo Pinheiro on 11/17/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
   // let time: TimeZone
}

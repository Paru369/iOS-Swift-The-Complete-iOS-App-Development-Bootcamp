//
//  ViewController.swift
//  ByteCoin
//
//  Created by Paulo Pinheiro on 11/17/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
}

//MARK: - CoinManagerDelegate
extension ViewController: CoinManagerDelegate {
    
    func didUpdatePrice(_ coinManager: CoinManager, price: Double){
        DispatchQueue.main.async {
            var formatted = price * 10000
            formatted = formatted.rounded()
            formatted = formatted / 10000
            self.valueLabel.text = String(formatted)
        }
    }

    func didFailWithError(error: Error) {
        print("An error appear: \(error)")
    }
    
}

//MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return coinManager.currencyArray[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: currency)
        currencyLabel.text = currency
    }
}


//MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        coinManager.currencyArray.count
    }
}


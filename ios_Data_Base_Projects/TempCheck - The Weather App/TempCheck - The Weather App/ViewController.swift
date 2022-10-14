//
//  ViewController.swift
//  TempCheck - The Weather App
//
//  Created by admin on 26/09/22.
//

import UIKit

class ViewController: UIViewController {

    var weatherData : [WeatherData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        WeatherDataUtility.instance.getWeatherData { data in
            self.weatherData.append(data)
            print("weather details : \(self.weatherData.count)")
        }
    }
    


}


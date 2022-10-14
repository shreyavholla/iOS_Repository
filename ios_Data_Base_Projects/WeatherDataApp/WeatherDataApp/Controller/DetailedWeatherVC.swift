//
//  DetailedWeatherVC.swift
//  WeatherDataApp
//
//  Created by admin on 29/09/22.
//

import UIKit

class DetailedWeatherVC: UIViewController {

    
    @IBOutlet weak var cityL: UILabel!
    
    @IBOutlet weak var timezoneL: UILabel!
    
    @IBOutlet weak var tempL: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var mainL: UILabel!
    
    
    @IBOutlet weak var descriptionL: UILabel!
    
    
    @IBOutlet weak var sunriseL: UILabel!
    
    @IBOutlet weak var sunsetL: UILabel!
    
    @IBOutlet weak var windspeedL: UILabel!
    
    @IBOutlet weak var pressureL: UILabel!
    
    @IBOutlet weak var duepoint: UILabel!
    
    @IBOutlet weak var humidity: UILabel!
    
    var vc = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        self.cityL.text = vc.cityname
        
        ConnectionUtility.instance.getWeatherData { data in
            self.timezoneL.text = data.timezone
            self.mainL.text = data.current.weather[0].main
            self.descriptionL.text = data.current.weather[0].description
                
            self.tempL.text = "\(self.tempConversion(temp: data.current.temp, to: 0))"
            self.sunriseL.text = "\(self.convertUtcToTime(utc: data.current.sunrise))"
            self.sunsetL.text = "\(self.convertUtcToTime(utc: data.current.sunset))"
            self.windspeedL.text = "\(data.current.wind_speed)"
            self.pressureL.text = "\(data.current.pressure)"
            self.duepoint.text = "\(data.current.dew_point)"
            self.humidity.text = "\(data.current.humidity)"
                
            if let url = ConnectionUtility.instance.downloadIfRequired(imageName: data.current.weather[0].icon){
                    self.img.image = UIImage(contentsOfFile: url.path)
                }
        }
            
       
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  WeatherDataApp
//
//  Created by admin on 27/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var searchCityB: UITextField!
    
    
    @IBOutlet weak var placeL: UILabel!
    
    @IBOutlet weak var tempL: UILabel!
    
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBOutlet weak var weatherCollectionV: UICollectionView!
    
    
    @IBOutlet weak var cityNameL: UILabel!
    
    @IBOutlet weak var currentMainL: UILabel!
    
    
    @IBOutlet weak var currentDescL: UILabel!
    
    
    @IBOutlet weak var cimg: UIImageView!

    var dailyData : [Daily] = []
    var hourlyData : [Hourly] = []
    var cityname : String = ""
    let currentLoc = CurrentLocationUtility()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        //getting current location
        currentLoc.locUpdater = self
        getCurrentLocation()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func getCurrentLocation(){
        
        let address = currentLoc.currentLocation?.coordinate
        if let latt = address?.latitude, let longg = address?.longitude {
            
            ConnectionUtility.instance.lat = latt
            ConnectionUtility.instance.long = longg
            
            // bringWeatherData()
            
            GeoCodingUtility().getAddress(lattitude: latt, longitude: longg) { city in
                
                self.cityNameL.text = city
                self.cityname = city
            }
            
            ConnectionUtility.instance.getWeatherData { data in
                
                
                
                self.placeL.text = "\(data.timezone)"
                self.tempL.text = "\(round(10*(data.current.temp - 273.15))/10)°C"
                self.currentMainL.text = "\(data.current.weather[0].main)"
                self.currentDescL.text = "\(data.current.weather[0].description)"
                
                if let url = ConnectionUtility.instance.downloadIfRequired(imageName: data.current.weather[0].icon){
                    self.cimg.image = UIImage(contentsOfFile: url.path)
                }
            }
            
            weatherCollectionV.reloadData()
            
        }
        
        
    }
    
    
    @IBAction func refreshCLClicked(_ sender: Any) {
        
        getCurrentLocation()
        
    }
    
    @IBAction func searchCityClicked(_ sender: Any) {
        
        let city = searchCityB.text ?? ""
        cityNameL.text = city
        
        if(city.isEmpty)
        {
            self.showAlert(title: "", msg: "Please enter cityname ")
        }else{
            
            GeoCodingUtility().getCoordinate(address: city) { loc in
                
                if let loc = loc {
                    
                    let latt = loc.coordinate.latitude
                    let long = loc.coordinate.longitude
                    ConnectionUtility.instance.lat = latt
                    ConnectionUtility.instance.long = long
                   
                    
                    ConnectionUtility.instance.getWeatherData { data in
                        
                        self.placeL.text = "\(data.timezone)"
                        self.tempL.text = "\(round(10*(data.current.temp - 273.15))/10)°C"
                        self.currentMainL.text = "\(data.current.weather[0].main)"
                        self.currentDescL.text = "\(data.current.weather[0].description)"
                        
                        if let url = ConnectionUtility.instance.downloadIfRequired(imageName: data.current.weather[0].icon){
                            self.cimg.image = UIImage(contentsOfFile: url.path)
                        }
                        
                        self.weatherCollectionV.dataSource = self
                    }
                    
                    ConnectionUtility.instance.getDailyData { data in
                        self.dailyData = data
                        self.weatherCollectionV.reloadData()
                    }
                    
                    ConnectionUtility.instance.getHourlyData { hourly in
                        self.hourlyData = hourly
                        self.weatherCollectionV.reloadData()
                    }
                    
                    
                }else {
                    
                    self.showAlert(title: "INVALID COORDINATES", msg: "Please Renter the coordinates")
                }
            }
        }
    }
    
    
    
    
    fileprivate func callMethodsDHM(dhm: Int) {
        
        
        switch  dhm{
            
        case 0:
            
            //bringDailyData()
            ConnectionUtility.instance.getDailyData { data in
                
                
                self.dailyData = data
                self.weatherCollectionV.reloadData()
                self.weatherCollectionV.dataSource = self
            }
            
        case 1:
            // bringHourlyData()
            ConnectionUtility.instance.getHourlyData { data in
                
                
                self.hourlyData = data
                self.weatherCollectionV.reloadData()
                self.weatherCollectionV.dataSource = self
            }
            
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        callMethodsDHM(dhm: segment.selectedSegmentIndex)
        
        
        
    }
    
    var converto : Int = 0
    
    @IBAction func tempSegmentClicked(_ sender: UISegmentedControl) {
        
        
        ConnectionUtility.instance.getWeatherData { data in
            
            let temp = data.current.temp
            
            self.tempL.text = self.tempConversion(temp: temp, to: sender.selectedSegmentIndex)
            
            self.converto = sender.selectedSegmentIndex
            
            
        }
        
        self.weatherCollectionV.reloadData()
}
        
@IBAction func dhmSegmentCliked(_ sender: UISegmentedControl) {
            
            
            let tempId = sender.selectedSegmentIndex
            
            callMethodsDHM(dhm: tempId)
            
            
        }
        
        
}


    
extension ViewController : UICollectionViewDataSource {
    
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let dhm = segment.selectedSegmentIndex
        print("\(dhm)")
        
        switch dhm{
            
        case 0 :
            return dailyData.count
        case 1:
            return hourlyData.count
        default:
            break
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dhmweathercell", for: indexPath) as! DHMcell
        
        let dhm = segment.selectedSegmentIndex
  
        switch dhm {
            
        case 0 :
           let data = dailyData[indexPath.row]
            
            let date = convertUtcToDate(utc: data.dt)
            cell.timeL.text = "\(date)"
            cell.tempL.text = tempConversion(temp: data.temp.min, to: converto)
            
            cell.tempMaxL.isHidden = false
            cell.tempMaxL.text = tempConversion(temp: data.temp.max, to: converto)
            
            if let url = ConnectionUtility.instance.downloadIfRequired(imageName: data.weather[0].icon){
                cell.img.image = UIImage(contentsOfFile: url.path)
            }
            
           
           // print("Data fetched in daily cell")
    
        case 1:
           let data = hourlyData[indexPath.row]
            let time = convertUtcToTime(utc: data.dt)
            cell.timeL.text = time
            cell.tempL.text = tempConversion(temp: data.temp, to: converto)
            cell.tempMaxL.isHidden = true
            if let url = ConnectionUtility.instance.downloadIfRequired(imageName: data.weather[0].icon){
                cell.img.image = UIImage(contentsOfFile: url.path)
            }
            
           
           // print("Data fetched in hourly cell")
        default:
            break
        }
        
        return cell
    }
    
}

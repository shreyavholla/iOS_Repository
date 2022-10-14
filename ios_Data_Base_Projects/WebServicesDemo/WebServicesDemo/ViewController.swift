//
//  ViewController.swift
//  WebServicesDemo
//
//  Created by admin on 21/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var codeT: UITextField!
    
    @IBOutlet weak var tbl: UITableView!
    
    @IBOutlet weak var progressV: UIActivityIndicatorView!
    
    var placesArr : [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tbl.dataSource = self
        progressV.isHidden = true
    }
    
    @IBAction func searchClicked(_ sender: Any) {
        
        progressV.isHidden = false
        let pincode = codeT.text ?? ""
        
        if(pincode.isEmpty)
        {
            print("Enter pin code")
           // progressV.isHidden = true
        }else if(pincode.count > 6){
            
            print("Pincode must be under 6 digits")
            //progressV.isHidden = true
        }else {
            
            if #available(iOS 15.0, *){
                //cancellation support -- Task.cancel(()
               Task {
                    do{
                        try await Task.sleep(nanoseconds: 1_000_000_000)
                        progressV.isHidden = true
                        
                        let receivedPlaces = try await WebUtility.instance.getPlaces(postalCode:pincode)
                        print("Got places: \(receivedPlaces)")
                        self.placesArr = receivedPlaces.postalCodes
                        self.tbl.reloadData()
                    }catch HTTPError.invalidURL{
                        print("Invalid Url")
                    }catch HTTPError.internalServerError{
                        print("internalServerError")
                    }catch HTTPError.invalidRequest{
                        print("invalidRequest")
                    }catch HTTPError.decodingError{
                        print("decodingError")
                    }catch HTTPError.unknownError{
                        print("unknownError")
                    }
                    
                }
                
               // t.cancel()
            }else{
                WebUtility.instance.getPlaces(postalCode: pincode, completionHandler:{ receivedPlaces in
                    
                    print("Got places: \(receivedPlaces)")
                    
                    self.placesArr = receivedPlaces.postalCodes
                   
                    DispatchQueue.main.async {
                        self.tbl.reloadData()
                    }
                    
                       
                } )
            }
            
            
            
        }
        
       
    }
    


}

extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesArr.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)
        
        let place = placesArr[indexPath.row]
        
        cell.textLabel?.text = "\(place.placeName), \(place.adminName2 ?? "")"
        cell.detailTextLabel?.text = "\(place.adminName1 ?? ""), \(place.countryCode)"
        
        return cell
    }
    
    
    
}

//extension ViewController {
//    
//    func showAlert(title: String, msg: String ){
//        
//        let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .alert)
//        
//        let okAction = UIAlertAction(title: "OK", style: .default)
//    }
//    }
   




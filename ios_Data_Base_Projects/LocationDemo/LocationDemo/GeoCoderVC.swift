//
//  GeoCoderVC.swift
//  LocationDemo
//
//  Created by admin on 23/09/22.
//

import UIKit

class GeoCoderVC: UIViewController {

    
    @IBOutlet weak var latL: UITextField!
    
    @IBOutlet weak var longL: UITextField!
    
    @IBOutlet weak var addrT: UITextView!
    
    @IBOutlet weak var resultL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func convertClicked(_ sender: Any) {
        
        let lattitude = latL.text ?? ""
        let longitutde = longL.text ?? ""
        let address = addrT.text ?? ""
        
        if(lattitude.isEmpty || longitutde.isEmpty){
            if (address.isEmpty){
                
                showAlert(title: "EMPTY FIELDS", msg: "Please Enter Address of Coordinates")
            }else {
                
                GeoCodingUtility().getCoordinate(address: address) { loc in
                    
                    if let loc = loc {
                        self.resultL.text = """
                        Forward Geo Coding:
                        Lattitude : \(loc.coordinate.latitude)
                        Longitude : \(loc.coordinate.longitude)
                        """
                        
                    }else {
                        
                        self.showAlert(title: "INVALID COORDINATES", msg: "Please Renter the coordinates")
                    }
                }
            }
        }else {
            
            let latD = Double(lattitude) ?? 0.0
            let longD = Double(longitutde) ?? 0.0
            GeoCodingUtility().getAddress(lattitude: latD, longitude: longD) { addr in
                
            self.resultL.text = """
                Reverse Geo Coding:
                \(addr)
                """
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

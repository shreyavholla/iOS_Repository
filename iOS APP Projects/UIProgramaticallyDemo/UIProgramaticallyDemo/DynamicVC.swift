//
//  DynamicVC.swift
//  UIProgramaticallyDemo
//
//  Created by admin on 15/09/22.
//

import UIKit

class DynamicVC: UIViewController {

    //label object
    var titleL = UILabel()
    
    //button object
    var okBtn = UIButton()
    
    //image view
    var img = UIImageView(frame: CGRect(x: 150, y: 600, width: 300, height: 300))
    
    fileprivate func setupView() {
        //parent view must be ready
        view.addSubview(titleL)
        view.addSubview(okBtn)
        view.addSubview(img)
        
        view.backgroundColor = .cyan
    }
    
    fileprivate func setupLabel() {
        //changing object properties
        titleL.text = "Dynamic UI Demo"
        titleL.textAlignment = .center
        titleL.font = UIFont(name: "Times New Roman", size: 20)
        
        //enable constraint for the view
        titleL.translatesAutoresizingMaskIntoConstraints = false
        //top constraint to safe area
        titleL.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        
        //centering horizontally
        titleL.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setupButton() {
        okBtn.setTitle("OK", for: .normal)
        okBtn.backgroundColor = .purple
        okBtn.layer.cornerRadius = 10
        okBtn.layer.borderWidth = 5
        okBtn.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        okBtn.isUserInteractionEnabled = true
        okBtn.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
        
        
        
        okBtn.translatesAutoresizingMaskIntoConstraints = false
        //top anchor
        okBtn.topAnchor.constraint(equalTo: titleL.bottomAnchor, constant: 30).isActive = true
        //centering
        okBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        //width
        okBtn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //height
        okBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func buttonClick(){
      
        //okBtn.layer.backgroundColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        print("OK Button Clicked")
    }
    
    fileprivate func setupimg() {
        img.image = UIImage(systemName: "cloud")
        
        
        //constraints for image
        img.translatesAutoresizingMaskIntoConstraints = false
        img.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        img.topAnchor.constraint(equalTo: okBtn.bottomAnchor, constant: 80).isActive = true
        img.widthAnchor.constraint(equalToConstant: 200).isActive = true
        img.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        setupLabel()
        
        setupButton()
        
        setupimg()
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

//
//  ViewController.swift
//  AnimationDemo
//
//  Created by admin on 16/09/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var btn: UIButton!
    
    
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        btn.alpha = 0.0
//        //img.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        UIView.animate(withDuration: 5.0, delay: 0) {
//            self.btn.alpha = 1.0
//        }
        
        let bounds = btn.bounds
        

        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .repeat) {
            self.btn.bounds = CGRect(x: bounds.minX + 50, y: bounds.minY, width: bounds.width + 30, height: bounds.height )
        }
        
        let img1 = UIImage(named: "buffalo")!
       let img2 = UIImage(named: "camel")!
        let img3 = UIImage(named: "cow")!
        let img4 = UIImage(named: "duck")!
        let img5 = UIImage(named: "elephant")!
        let img6 = UIImage(named: "fox")!
        let img7 = UIImage(named: "hen")!
        let img8 = UIImage(named: "hippo")!
        let img9 = UIImage(named: "kaola")!
        let img10 = UIImage(named: "monkey")!
        
       let animatedImage = UIImage.animatedImage(with: [img1,img2,img3,img4,img5,img6,img7,img8,img9,img10], duration: 1)
            
        img.image = animatedImage
        
    }


}

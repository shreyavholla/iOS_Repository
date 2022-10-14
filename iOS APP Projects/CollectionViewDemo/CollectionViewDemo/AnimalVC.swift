//
//  AnimalVC.swift
//  CollectionViewDemo
//
//  Created by admin on 15/09/22.
//

import UIKit

class AnimalVC: UIViewController {

    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var animalCollectionV: UICollectionView!
    
    var animalList = domesticAnimals
    var animalType : String = ""
    var selectedAnimals : [Animal] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        animalCollectionV.dataSource = self
        animalCollectionV.delegate = selfr
        
        if animalType == "Wild"
        {
            animalList = wildAnimals
            titleL.text = "WILD ANIMALS"
        }else {
            titleL.text = "DOMESTIC ANIMALS"
            
        }
        // Do any additional setup after loading the view.
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

extension AnimalVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animalList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //render the data and populate the data in it
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "animalCell", for: indexPath) as! AnimalCell
        
        
        let animal = animalList[indexPath.row]
        cell.img.image = UIImage(named: animal.picture)
        cell.animalNameL.text = animal.name
        
        if selectedAnimals.contains(where: { anim in
            return anim.name == animal.name
        }) {
            cell.layer.borderWidth = 10.0
            cell.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else{
            cell.layer.borderWidth = 2.0
            cell.layer.borderColor = CGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
            
        }
        
        
        return cell
    }
    
    
}

extension AnimalVC : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Animal : \(animalList[indexPath.row].name)")
        
        selectedAnimals.append(animalList[indexPath.row])
        
        let selectedCell = collectionView.cellForItem(at: indexPath)
//      Border Property - layer :CALayer
       selectedCell?.layer.borderWidth = 10.0
        selectedCell?.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}

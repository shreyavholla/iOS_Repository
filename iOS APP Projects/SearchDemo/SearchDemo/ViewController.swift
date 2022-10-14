//
//  ViewController.swift
//  SearchDemo
//
//  Created by admin on 16/09/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var textL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchBar.delegate = self
    }

    

}

extension ViewController :UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("\(searchText)")
        
        textL.text = searchText
    }
}


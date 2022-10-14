//
//  FriendsVC.swift
//  SearchDemo
//
//  Created by admin on 16/09/22.
//

import UIKit

class FriendsVC: UIViewController {

    @IBOutlet weak var tbl: UITableView!
    
    var friendsList = ["John","Marry","Robert","Tom","Jerry","Mickey","Donald","Garfield","Pooh","Whiskers","Tweetie","Tim","Albert","Ross","Rachel","Chandler","Joey","Monica","Phoebe","Mike","Jake","Amy","Holt","Rossa"]
    
    let searchController = UISearchController()
    
    var filteredFriends : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tbl.dataSource = self
        
        //navigationItem.searchController = searchController
        navigationItem.searchController = searchController
        navigationItem.title = "Search Friend"
        
        searchController.searchBar.delegate = self
        
        filteredFriends = friendsList
        // Do any additional setup after loading the view.
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = true
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

extension FriendsVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //render cell and populate the data
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
        cell.textLabel?.text = filteredFriends[indexPath.row]
        return cell
    }
    
    
    
}

extension FriendsVC : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredFriends = friendsList.filter { name in
            return name.starts(with: searchText)
        }
        
        tbl.reloadData()
    }
}

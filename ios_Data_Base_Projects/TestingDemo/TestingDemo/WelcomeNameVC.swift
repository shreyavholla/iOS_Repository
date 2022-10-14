//
//  WelcomeNameVC.swift
//  TestingDemo
//
//  Created by admin on 29/09/22.
//

import UIKit

class WelcomeNameVC: UIViewController {

    @IBOutlet weak var welnameL: UILabel!
    
    var name : String?
    
    let account = ["Open Account", "Savings Account", "FD Account", "RD Account"]
    
    @IBOutlet weak var tbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        welnameL.text = "Welcome \(name ?? "")"
        tbl.dataSource = self
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

extension WelcomeNameVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return account.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        
        let acc = account[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountcell", for: indexPath)
        
        cell.textLabel?.text = acc
        
        return cell
        
    }
    
    
    
}

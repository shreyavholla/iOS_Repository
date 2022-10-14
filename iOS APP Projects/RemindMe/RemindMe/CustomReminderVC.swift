//
//  CustomReminderVC.swift
//  RemindMe
//
//  Created by admin on 14/09/22.
//

import UIKit

class CustomReminderVC: UIViewController {

   // var reminder = [NewReminder]()
    
    var msg : String? = "My Reminder"
    var reminder : [ReminderData] = []
   // var setUpStack : LoginVC
    
    @IBOutlet weak var tbl: UITableView!
    
    @IBOutlet weak var welcomeMsgL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tbl.dataSource = self
        self.tbl.delegate = self
        
        
        
        let deleteButton =  UIBarButtonItem(image: UIImage(systemName: "trash"), style: .done, target: self, action: #selector(deleteAllReminder))
        
        let addRemButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addNewReminder))
        
        navigationItem.rightBarButtonItems = [deleteButton, addRemButton]
        
        welcomeMsgL.text = msg
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        //self.tbl.delegate = self
        // Do any additional setup after loading the view.
        
        
    }
    
    
    @IBAction func logoutClicked(_ sender: Any) {
        
        deleteCredentials()
      
        let vc = storyboard?.instantiateViewController(withIdentifier: "loginvc") as! LoginVC
        
        vc.setUpStackViews()
        
        show(vc, sender: self)
    }
    
    @objc func addNewReminder() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "addNewReminder") as! AddNewReminderVC
        
        show(vc, sender: self)
        
        
    }
    
    @objc func deleteAllReminder(){
        
        reminder.forEach { remDel in
            ReminderDBUtility.instance.deleteReminder(rem: remDel)
        }
        
        reminder.removeAll()
        tbl.reloadData()
    }

    
    override func viewWillAppear(_ animated: Bool) {
      
        if let rem = ReminderDBUtility.instance.fetchReminders() {
            
            reminder = rem
            tbl.reloadData()
            
        }else {
            showAlert(msg: "Could not fetch Data", title: "FETCH ERROR", okHandler: nil)
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

extension CustomReminderVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminder.count
        //return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "displayReminder", for: indexPath) as! ReminderCell
        
        //reminder.sort(by: {$0.NewReminder.date < $1.NewReminder.cell} )
        
        let rem = reminder[indexPath.row]
        
        
        
        cell.titleL.text = rem.title
        cell.labelL.text = rem.desc
       // cell.dateL.text = "\(formatter.date(from: rem.date)!)"
        cell.dateL.text = rem.date
        cell.timeL.text = rem.time

        
        
        return cell
        
    }
    
}


extension CustomReminderVC : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let selectedRem = reminder[indexPath.row]
        
        let menuConfig = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            
            let editAction = UIAction(title: "EDIT"){ _ in
                print("Editing..")
               self.updateReminder(selectedRem)
             
                
                
            }
            
            let deleteAction = UIAction(title: "DELETE") { _ in
                print("Deleting..")
                ReminderDBUtility.instance.deleteReminder(rem: selectedRem) //-------- deleting reminder --------
                self.reminder.remove(at: indexPath.row)
                self.tbl.deleteRows(at: [indexPath], with: .automatic)
            }
            
            return UIMenu(title: "\(selectedRem.title ?? "")", image: nil, identifier: nil, options: .displayInline, children: [editAction,deleteAction])
        }
        
        return menuConfig
    }
    
    func updateReminder(_ remToEdit : ReminderData)
    {
        let editAlertVC = UIAlertController(title: "Reminder - \(remToEdit.title ?? "")", message: "", preferredStyle: .alert)
        
        editAlertVC.addTextField { titleT in
            titleT.text = remToEdit.title
            titleT.keyboardType = .asciiCapable
            titleT.placeholder = "Enter new title"
        }
        
        editAlertVC.addTextField { desc in
            desc.text = remToEdit.desc
            desc.keyboardType = .asciiCapable
            desc.placeholder = "Enter new description"
        }
        
        editAlertVC.addTextField { dateT in
            dateT.text = remToEdit.date
            dateT.keyboardType = .numberPad
            dateT.placeholder = "Enter new time"
        }
        
        editAlertVC.addTextField { timeT in
            timeT.text = remToEdit.time
            timeT.keyboardType = .numberPad
            timeT.placeholder = "Enter new time"
        }
        
        
        let updateAction = UIAlertAction(title: "UPDATE", style: .default) { _ in
            let newTitle = editAlertVC.textFields?[0].text ?? ""
            let newDesc = editAlertVC.textFields?[1].text ?? ""
            let newDate = editAlertVC.textFields?[2].text ?? ""
            let newTime = editAlertVC.textFields?[3].text ?? ""
            
            
            remToEdit.title = newTitle
            remToEdit.desc = newDesc
            remToEdit.date = newDate
            remToEdit.time = newTime
            
            try! ReminderDBUtility.instance.dbContext.save()
            
            self.tbl.reloadData()
        }
        
        editAlertVC.addAction(updateAction)
       
        present(editAlertVC, animated: false)
       
    }



}


//
//  EmpListVC.swift
//  CoreDataDemo
//
//  Created by admin on 20/09/22.
//

import UIKit

class EmpListVC: UIViewController {
    
    

    @IBOutlet weak var tbl: UITableView!
    
    var empList: [Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tbl.dataSource = self
        tbl.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func deleteAllClick(_ sender: Any) {
        
        empList.forEach { empToDelete in
            EmpDBUtility.instance.deleteEmp(emp : empToDelete)
        }
        
        empList.removeAll()
        tbl.reloadData()
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
            
        case 0:
            empList = EmpDBUtility.instance.sortEmpBySalary() ?? []
            
            
        case 1:
            empList = EmpDBUtility.instance.filterEmpByCity(cityName: "Bangalore") ?? []
            
            
        default:
            break
            
        }
        
        tbl.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let emp = EmpDBUtility.instance.getAllEmployees() {
            empList = emp
            tbl.reloadData()
            
        }else{
            showAlert(msg: "Could not fetch employee list, try later", title: "ERROR", okHandler: nil)
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

extension EmpListVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //render the cell and populate data in it
        let cell = tableView.dequeueReusableCell(withIdentifier: "empCell", for: indexPath)
        
        let emp = empList[indexPath.row]
        
        cell.textLabel?.text = emp.name
        cell.detailTextLabel?.text = "ID : \(emp.id)    Salary : \(emp.salary)   City: \(emp.city ?? "")"
        
        return cell
    }
    
    
}

extension EmpListVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        
        let selectedEmp = empList[indexPath.row]
        
        let menuConfig = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            
            let editAction = UIAction(title : "EDIT") { _ in
                print("Editing...")
                self.editEmpAlert(selectedEmp)
            }
            
            let deleteAction = UIAction(title : "DELETE") { _ in
                print("Deleting...")
                EmpDBUtility.instance.deleteEmp(emp: selectedEmp) //delete from db
                self.empList.remove(at: indexPath.row)
                self.tbl.deleteRows(at: [indexPath], with: .automatic)
                
            }
            
            return UIMenu(title: "\(selectedEmp.name ?? "")", image: nil, identifier: nil, options: .displayInline, children: [editAction,deleteAction])
        }
        return menuConfig
    }
    
    func editEmpAlert( _ empToEdit : Employee){
        
        let editAlertVC = UIAlertController(title: "Employee ID - \(empToEdit.id)", message: "", preferredStyle: .alert)
        
        editAlertVC.addTextField { nameT in
            nameT.text = empToEdit.name
            nameT.keyboardType = .asciiCapable
            nameT.placeholder = "Enter new name"
        }
        
        editAlertVC.addTextField { salaryT in
            salaryT.text = "\(empToEdit.salary)"
            salaryT.keyboardType = .numberPad
            salaryT.placeholder = "Enter new salary"
        }
        
        editAlertVC.addTextField { cityT in
            cityT.text = empToEdit.city
            cityT.isEnabled = false
        }
        
        
        let updateAction = UIAlertAction(title: "UPDATE", style: .default) { _ in
            let newName = editAlertVC.textFields?[0].text ?? ""
            let newSalary = editAlertVC.textFields?[1].text ?? ""
            
            empToEdit.name = newName
            empToEdit.salary = Float(newSalary) ?? 0.0
            
            try! EmpDBUtility.instance.dbContext.save()
            
            self.tbl.reloadData()
        }
        
        editAlertVC.addAction(updateAction)
        
        present(editAlertVC, animated: false)
    }
    
}

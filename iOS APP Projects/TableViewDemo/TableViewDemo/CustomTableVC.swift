//
//  CustomTableVC.swift
//  TableViewDemo
//
//  Created by admin on 14/09/22.
//

import UIKit

class CustomTableVC: UIViewController {

    
    @IBOutlet weak var tbl: UITableView!
    
    var empList: [Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateData()
        // Do any additional setup after loading the view.
        
        tbl.dataSource = self
        tbl.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(deleteAll))
        
        navigationItem.title = "Synchronoss"
      
        
    }
    
    @objc func deleteAll(){
        print("Deleting all...")
        empList.removeAll()
        tbl.reloadData()
        
        //navigationController?.popViewController(animated: false)
    }
    
    func populateData(){
        empList.append(Employee(empId: 1, name: "John", city: "Delhi", salary: 20000))
        empList.append(Employee(empId: 2, name: "Marry", city: "Pune", salary: 30000))
        empList.append(Employee(empId: 3, name: "Robert", city: "Surat", salary: 40000))
        empList.append(Employee(empId: 4, name: "Tom", city: "Mumbai", salary: 50000))
        empList.append(Employee(empId: 5, name: "Jerry", city: "Panjim", salary: 60000))
        empList.append(Employee(empId: 6, name: "Mike", city: "Panjim", salary: 20000))
        empList.append(Employee(empId: 7, name: "Alice", city: "Delhi", salary: 30000))
        empList.append(Employee(empId: 8, name: "Bob", city: "Bangalore", salary: 40000))
        
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

extension CustomTableVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "empCell", for: indexPath) as! EmployeeCell
        
        
        let emp = empList[indexPath.row]
        
        cell.nameL.text = emp.name
        cell.idL.text = "\(emp.empId)"
        cell.cityL.text = emp.city
        cell.salaryL.text = "\(emp.salary)"
        
        return cell
    }
    
    
}

extension CustomTableVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let emp = empList[indexPath.row]
        
        //launch the screen to display the details of the employee
        let vc = storyboard?.instantiateViewController(withIdentifier: "employeedetails") as! EmployeeDetailsVC
        
        vc.empDetails = """
ID : \(emp.empId)

Name : \(emp.name)

City : \(emp.city)

Salary : \(emp.salary)
"""
        
        show(vc, sender: self)
        //present(vc, animated: false)
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
    
        var emp = empList[indexPath.row]
        
        let menuConfig = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            
            let editAction = UIAction(title: "Edit",
                                      image: nil,
                                      identifier: nil,
                                      discoverabilityTitle: nil,
                                      attributes: .destructive,
                                      state: .off) { _ in
                print("Editing...")
                emp.name = emp.name.uppercased()
                self.empList[indexPath.row] = emp
                //self.tbl.reloadData()
                self.tbl.reloadRows(at: [indexPath], with: .bottom)
            }
            
            let deleteAction = UIAction(title: "Delete",
                                        image: nil,
                                        identifier: nil,
                                        discoverabilityTitle: nil,
                                        attributes: .destructive,
                                        state: .off) { _ in
                print("Deleting...")
                self.empList.remove(at: indexPath.row)
                //self.tbl.reloadData()
                self.tbl.deleteRows(at: [indexPath], with: .automatic)
            }
            
            let menu = UIMenu(title: "\(emp.name)",
                              image: nil,
                              identifier: nil,
                              options: .displayInline,
                              children: [editAction,deleteAction])
            
            return menu
        }
        
        return menuConfig
    }
    
    
}

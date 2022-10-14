//
//  SimpleCellVC.swift
//  TableViewDemo
//
//  Created by admin on 14/09/22.
//

import UIKit

class SimpleCellVC: UIViewController {

 
    @IBOutlet weak var tbl: UITableView!
    
    let studentList = ["John", "Marry", "Robert", "Tim", "Leena","Tom","Jerry","Henry","Rohit","Mandara","Shreya","Kailash","Harsha"]
    
    let facultyList = ["Alice","Bob","Coby","Dolby","Goldie"]
    override func viewDidLoad() {
        super.viewDidLoad()

        tbl.dataSource = self
        tbl.delegate = self
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

extension SimpleCellVC : UITableViewDataSource {
    
    //no of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0 :
            return facultyList.count
        case 1 :
            return studentList.count //so there will be 5 rows
        default :
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //return the table view cell object, and for that row what cell must be returned
        // task 1 : render the cell for a particular indexPath (section and a row)
        // task 2 : attach the data to the cell
        print(" CellForRowAt : \(indexPath.row)")
        //task 1
        var cell : UITableViewCell?
         
        
        //task 2
        
        let section = indexPath.section
        
        switch section {
        case 0 :
            //faculty data
            cell = tableView.dequeueReusableCell(withIdentifier: "facultyCell", for: indexPath)
            let faculty = facultyList[indexPath.row]
            cell?.textLabel?.text =  faculty
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
            let std = studentList[indexPath.row]
            cell?.textLabel?.text =  std
            
        }
        
       
        cell?.detailTextLabel?.text = "\(indexPath.row + 1)"
        //cell.imageView?.image
        return cell!
        
    }
    
    
}

extension SimpleCellVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let section = indexPath.section
        
        switch section {
        case 0 :
            let selectedFaculty = facultyList[indexPath.row]
            
            showAlert(title: "Faculty Data", msg: "Selected Faculty is Prof. \(selectedFaculty)") {
                print("Selected Facuty is Prof. \(selectedFaculty)")
            }
            
        default :
            let selectedStd = studentList[indexPath.row]
            
            showAlert(title: "Student Data", msg: "Selected Student: \(selectedStd)") {
                
                print("Selected Student \(selectedStd)")
            }
            
        }
        
        
        
        
    }
    
    //Header Function
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0 :
            return "Faculty"
        default :
            return "Computer Science"
            
        }
        
    }
    
    //Footer Function
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        switch section {
        case 0 :
            return "Total Faculty Count : \(facultyList.count)"
        default :
            return "Total Students : \(studentList.count) "
            
        }
        
    }
}

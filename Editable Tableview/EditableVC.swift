//
//  EditableVC.swift
//  Editable Tableview
//
//  Created by Student Account on 5/17/22.
//

import Foundation
import UIKit

class EditableVC: UITableViewController {
    
    var ds: Datastore!
    var sampleMake = ["Honda", "Nissan", "Chevrolet", "Ford", "Toyota", "Acura", "Lexus", "Tesla", "Lucid"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addCar() {
        
        if (sampleMake.count > 0) {
            let i = Int(arc4random_uniform(UInt32(sampleMake.count)))
            ds.addCar(make: sampleMake[i])
                        
            let indexPath = IndexPath(row: ds.cars.count-1, section: 0)
            tableView.insertRows(at:[indexPath], with:.automatic)
            
            sampleMake.remove(at: i)
            
        }
    }
                        
    @IBAction func editToggle( _ sender: UIButton) {
        if isEditing {
                     setEditing(false, animated: true)
                     sender.setTitle("Edit", for: .normal)
                 }
                 else {
                     setEditing(true, animated: true)
                     sender.setTitle("Done", for: .normal)
                 }
            }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                if( editingStyle == .delete) {
                    sampleMake.append(ds.cars[indexPath.row].make!)
                    ds.remove(atIndex: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
            }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ds.cars.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath)
        newCell.textLabel?.text = ds.cars[indexPath.row].make
        newCell.detailTextLabel?.text = ""
        
        return newCell
        
    }
}

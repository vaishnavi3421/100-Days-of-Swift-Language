//
//  ViewController.swift
//  Move Table View Cell
//
//  Created by Vaishnavi Wahgule on 16/01/25.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet var table:UITableView!
    
    var Model = ["First","Second","Third","Fourth","Fifth"]
    var originalModel:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        originalModel = Model
        table.delegate = self
        table.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Model[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Arial", size: 22)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        Model.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    @IBAction func didtapSort() {
        if table.isEditing {
            Model = originalModel
            table.isEditing = false
        } else {
            table.isEditing = true
        }
    }
    table.reloadData()

}


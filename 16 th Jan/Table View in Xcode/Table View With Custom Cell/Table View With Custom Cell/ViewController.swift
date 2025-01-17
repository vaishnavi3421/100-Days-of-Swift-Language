//
//  ViewController.swift
//  Table View With Custom Cell
//
//  Created by Vaishnavi Wahgule on 16/01/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   

    @IBOutlet var tableView: UITableView!
    let name: [String] = ["First", "Second", "Third", "Fourth", "Fifth","6","7","8","9"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.myLabel.text = name[indexPath.row]
        cell.myImage.backgroundColor = .green
//        cell.textLabel?.text = name[indexPath.row]
        return cell
    }

}


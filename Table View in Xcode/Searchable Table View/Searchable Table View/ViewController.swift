//
//  ViewController.swift
//  Searchable Table View
//
//  Created by Vaishnavi Wahgule on 16/01/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet var table: UITableView!
    @IBOutlet var field: UITextField!

    var countries = [String]()
    var filteredData = [String]()
    var filtered = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        table.delegate = self
        table.dataSource = self
        field.delegate = self
    }

    func setupData() {
        countries = ["United States",
            "Canada",
            "Mexico",
            "Brazil",
            "Argentina",
            "United Kingdom",
            "Germany",
            "France",
            "Italy",
            "Spain",
            "India",
            "China",
            "Japan",
            "South Korea",
            "Australia",
            "Russia",
            "South Africa",
            "Egypt",
            "Nigeria",
            "Saudi Arabia",
            "Turkey",
            "Indonesia",
            "Vietnam",
            "Thailand",
            "Malaysia",
            "Singapore",
            "New Zealand",
            "Sweden",
            "Norway",
            "Denmark",
            "Finland",
            "Poland"
        ]

    }

    func filterText(_ query: String) {
        if query.isEmpty {
            filtered = false
            filteredData.removeAll()
        } else {
            filteredData = countries.filter { $0.lowercased().starts(with: query.lowercased()) }
            filtered = true
        }
        table.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filtered {
            return filteredData.count
        } else {
            return countries.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if filtered {
            cell.textLabel?.text = filteredData[indexPath.row]
        } else {
            cell.textLabel?.text = countries[indexPath.row]
        }
        return cell
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            let newText = (text as NSString).replacingCharacters(in: range, with: string)
            filterText(newText)
        }
        return true
    }
}


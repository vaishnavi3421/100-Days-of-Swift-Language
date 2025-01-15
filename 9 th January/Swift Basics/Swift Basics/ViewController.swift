//
//  ViewController.swift
//  Swift Basics
//
//  Created by Vaishnavi Wahgule on 09/01/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lbl:UILabel!
    @IBOutlet var switch1:UISwitch!
    @IBAction func valueChanged(_ sender:UISwitch){
        if switch1.isOn {
            lbl.text = "Switch is ON"
        }else {
            lbl.text = "Switch is OFF"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        let a = addNos(no1: 30, no2: 80)
        print(a)
        let family = getFamily()
        print(family.1)
    }
    // FUNCTIONS
    func addNos(no1: Int, no2: Int) -> Int {
        let add = no1 + no2
        return add
    }
    // Multiple return types
    func getFamily() ->(String, String, String) {
        return ("Vaish","Parth","Ram")
    }
    
    
}


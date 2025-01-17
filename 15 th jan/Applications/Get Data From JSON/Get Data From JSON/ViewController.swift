//
//  ViewController.swift
//  Get Data From JSON
//
//  Created by Vaishnavi Wahgule on 15/01/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var IdTxt : UILabel!
    @IBOutlet var nameTxt : UILabel!
    @IBOutlet var emailTxt : UILabel!
    @IBOutlet var bodyTxt : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func fetchData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            (data, response, error) in
            guard let data = data, error == nil  else {
                print("Error occured while Accessing")
                return
            }
            var info: Info?
            do {
                var info = try JSONDecoder().decode(Info.self, from: data)
            }
            catch {
                print("Error while Decoding JSON into Swift Structure\(error)")
            }
            guard let sData = info else {
                return
            }
            print("Received Data\(sData)")
            
            DispatchQueue.main.async{
                self.IdTxt.text = "ID = \(info!.id)"
                self.nameTxt.text  = "Name = \(info!.name)"
                self.emailTxt.text = "Email = \(info!.email)"
                self.bodyTxt.text = "Body = \(info!.body)"
                
            }
        })
    }

}


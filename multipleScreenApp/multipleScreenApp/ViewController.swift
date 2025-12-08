//
//  ViewController.swift
//  multipleScreenApp
//
//  Created by Kutay Mehmet Ozko on 7.12.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var firstScreenLabel: UILabel!
    var firstScreenName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad Works Here")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear Works Here")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameTextField.text = ""
    }

    @IBAction func saveButton(_ sender: Any) {
        firstScreenName = nameTextField.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toSecondVC"){
            let destinationVC = segue.destination as! secondAppScreenViewController
            destinationVC.nameFromFirstScreen = firstScreenName
        }
    }
    
}


//
//  ViewController.swift
//  BirthdayNoteApp
//
//  Created by Kutay Mehmet Ozko on 7.12.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedName = UserDefaults.standard.object(forKey: "name" as String)
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday" as String)
        
        if(storedName as? String != nil && storedBirthday as? String != nil){
            nameLabel.text = "Name : \(storedName as! String)"
            birthdayLabel.text = "Birthday : \(storedBirthday as! String)"
        }
    }

    @IBAction func saveButton(_ sender: Any) {
        
        
        //hold data for next run
        UserDefaults.standard.set(nameTextField.text!, forKey:"name")
        UserDefaults.standard.set(birthdayTextField.text!, forKey:"birthday")
        
        
        nameLabel.text = "Name : \(nameTextField.text!)"
        birthdayLabel.text = "Birthday : \(birthdayLabel.text!)"
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
        
        // remove data from UserDefaults
        // we have to check isData true
        
        let storedName = UserDefaults.standard.object(forKey: "name" as String)
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday" as String)
        
        if(storedName as? String != nil && storedBirthday as? String != nil){
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.removeObject(forKey: "birthday")
        }
        
        nameLabel.text = "Name : "
        birthdayLabel.text = "Birthday : "
    }
}


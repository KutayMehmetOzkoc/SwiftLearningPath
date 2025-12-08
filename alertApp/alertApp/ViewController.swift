//
//  ViewController.swift
//  alertApp
//
//  Created by Kutay Mehmet Ozko on 8.12.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpClicked(_ sender: Any) {
        
        if (usernameField.text ?? "").isEmpty || (passwordField.text ?? "").isEmpty {
            let alert = UIAlertController(title: "Error ! 😱", message: "Username or Password Not Found !", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) { UIAction in
                print("alert ok clicked")
            }
            alert.addAction(okButton)
            self.present(alert, animated: true) {
                print("alert shown on screen")
            }
        }
        else {
            let username = usernameField.text!
            let password = passwordField.text!
            let confirmPopup = UIAlertController(title: "Confirm !✅", message: username + " " + password + " successfully signed up!", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) { UIAction in
                print("confirm ok clicked")
            }
            confirmPopup.addAction(okButton)
            self.present(confirmPopup, animated: true) {
                print("confirm shown on screen")
            }
        }
        
    }
    
}


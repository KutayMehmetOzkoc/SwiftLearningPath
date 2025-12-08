//
//  secondAppScreenViewController.swift
//  multipleScreenApp
//
//  Created by Kutay Mehmet Ozko on 7.12.2025.
//

import UIKit

class secondAppScreenViewController: UIViewController {

    @IBOutlet weak var secondViewLabel: UILabel!
    @IBOutlet weak var nameLabel2: UILabel!
    
    var nameFromFirstScreen = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel2.text = nameFromFirstScreen
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

//
//  ViewController.swift
//  FirstApp
//
//  Created by Kutay Mehmet Ozko on 3.12.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeImage(_ sender: Any) {
        
        imageView.image = UIImage(named: "met2")
    }

    
    

}


//
//  detailViewController.swift
//  simpsonsBookApp
//
//  Created by Kutay Mehmet Ozko on 9.12.2025.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var simpsonData: SimpsonChar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = simpsonData?.name
        jobLabel.text = simpsonData?.job
        imageView.image = simpsonData?.photo


        // Do any additional setup after loading the view.
    }


}

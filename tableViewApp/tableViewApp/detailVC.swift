//
//  detailVC.swift
//  tableViewApp
//
//  Created by Kutay Mehmet Ozko on 8.12.2025.
//

import UIKit

class detailVC: UIViewController {

    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var imageViewPlace: UIImageView!
    
    var selectedPlace = ""
    var selectedPlaceImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        placeNameLabel.text = selectedPlace
        imageViewPlace.image = selectedPlaceImage
        // Do any additional setup after loading the view.
    }


}

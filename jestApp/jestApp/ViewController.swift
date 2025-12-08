//
//  ViewController.swift
//  jestApp
//
//  Created by Kutay Mehmet Ozko on 8.12.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var timer = Timer()
    var counter = 0
    
    @IBOutlet weak var timer2: UILabel!
    var isBird = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counter = 10
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        imageView.addGestureRecognizer(gestureRecognizer)
        
        timer2.text = "Timer : \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
        
        
    }
    
    @objc func changePic(){
        if(isBird == true){
            imageView.image = UIImage(named: "larrybird")
            print("photoTapped")
            labelView.text = "Larry Bird"
            isBird = false
        }
        else {
            imageView.image = UIImage(named: "bird")
            print("photoTapped")
            labelView.text = "bird"
            isBird = true
        }
    }
    
    @objc func timerFunction(){
        timer2.text = "Timer : \(counter)"
        counter -= 1
        if(counter == 0){
            timer.invalidate()
            timer2.text = "Time is up !⏰"
        }
    }


}


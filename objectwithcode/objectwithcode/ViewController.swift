//
//  ViewController.swift
//  objectwithcode
//
//  Created by Kutay Mehmet Ozko on 5.12.2025.
//

import UIKit

class ViewController: UIViewController {

    
    var myLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // getApplication width and height
        let width = view.frame.width
        let height = view.frame.height
        
        
        //Label part
        myLabel.text = "Test Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width/2 - width*0.8/2, y: height/2 - 25, width: width*0.8, height: 50)
        view.addSubview(myLabel)
        
        
        let myButton = UIButton()
        myButton.setTitle("Test Button", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        myButton.frame = CGRect(x: width*0.5-100, y: height*0.7, width: 200, height: 100)
        view.addSubview(myButton)
        
        
        // target = viewController
        // action = function
        //touchUpInside when click button
        myButton.addTarget(self, action: #selector(ViewController.myAction), for: UIControl.Event.touchUpInside)
        
    }

    @objc func myAction(){
        myLabel.text = "Button Clicked"
    }
}


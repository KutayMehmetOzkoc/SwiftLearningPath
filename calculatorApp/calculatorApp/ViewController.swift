//
//  ViewController.swift
//  calculatorApp
//
//  Created by Kutay Mehmet Ozko on 4.12.2025.
//

import UIKit

class ViewController: UIViewController {

    
    // label and textfield init part
    @IBOutlet weak var firstValueField: UITextField!
    
    @IBOutlet weak var secondValueField: UITextField!

    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func sumButtonClicked(_ sender: Any) {
        
        // safe code
        
        
        var firstValue = 0
            var secondValue = 0
            
            // First value
            if let firstValueInt = Int(firstValueField.text ?? "") {
                firstValue = firstValueInt
            } else {
                resultLabel.text = "First value is invalid. Please enter an integer."
                return      // ❗ Hata varsa fonksiyon burada durur
            }
            
            // Second value
            if let secondValueInt = Int(secondValueField.text ?? "") {
                secondValue = secondValueInt
            } else {
                resultLabel.text = "Second value is invalid. Please enter an integer."
                return      // ❗ Hata varsa fonksiyon burada durur
            }
            
            // Both valid → calculate
            let result = sum(x: firstValue, y: secondValue)
        resultLabel.text = String(result)
    }
    
    
    //Button Clicks
    @IBAction func minusButtonClicked(_ sender: Any) {
        
        let firstValueInt = Int(firstValueField.text!)
        let secondValueInt = Int(secondValueField.text!)
        var result = 0

        result = minus(x: firstValueInt!, y: secondValueInt!)
        resultLabel.text = String(result)
    }
    @IBAction func mpyButtonClicked(_ sender: Any) {
        
        let firstValueInt = Int(firstValueField.text!)
        let secondValueInt = Int(secondValueField.text!)
        var result = 0

        result = multiply(x: firstValueInt!, y: secondValueInt!)
        resultLabel.text = String(result)
    }
    @IBAction func divButtonClicked(_ sender: Any) {
        
        let firstValueInt = Int(firstValueField.text!)
        let secondValueInt = Int(secondValueField.text!)
        var result = 0

        result = divide(x: firstValueInt!, y: secondValueInt!)
        resultLabel.text = String(result)
    }
    
    // Arithmetic Functions
    func sum(x:Int, y: Int) -> Int{
        return x+y
    }
    func minus(x:Int, y: Int) -> Int{
        return x-y
    }
    func multiply(x:Int, y: Int) -> Int{
        return x*y
    }
    func divide(x:Int, y: Int) -> Int{
        return x/y
    }


}


//
//  detailViewController.swift
//  ArtBookApp
//
//  Created by Kutay Mehmet Ozko on 9.12.2025.
//

import UIKit
import CoreData

class detailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageViewDetail: UIImageView!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldYear: UITextField!
    @IBOutlet weak var textFieldArtistName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Recognizers
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        imageViewDetail.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageViewDetail.addGestureRecognizer(tapGesture)
        

    }

    
    
    @objc func imageTapped(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageViewDetail.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        print("Button Clicked")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newArt = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        newArt.setValue(textFieldName.text, forKey: "name")
        newArt.setValue(textFieldArtistName.text, forKey: "artist")
        if let year = Int(textFieldYear.text!){
            newArt.setValue(year, forKey: "year")
        }
        newArt.setValue(UUID(), forKey: "id")
        let data = imageViewDetail.image!.jpegData(compressionQuality: 0.5)
        newArt.setValue(data, forKey: "image")
        do{
            try context.save()
            print("success")
        }catch {
            print("Error saving context \(error)")
        }
    }
}

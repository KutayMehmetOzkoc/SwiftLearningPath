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
    
    var chosenPaint = ""
    var chosenPaintingId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(chosenPaint != ""){
            //CoreData
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            let idString = chosenPaintingId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    for result in results as! [NSManagedObject]{
                        if let resultName = result.value(forKey: "name") as? String{
                            textFieldName.text = resultName
                        }
                        if let resultArtist = result.value(forKey: "artist") as? String{
                            textFieldArtistName.text = resultArtist
                        }
                        if let resultYear = result.value(forKey: "year") as? Int{
                            textFieldYear.text = String(resultYear)
                        }
                        if let resultImage = result.value(forKey: "image") as? Data{
                            let imageUI = UIImage(data: resultImage)
                            imageViewDetail.image = imageUI
                        }
                    }
                }
            }
            catch{
                
            }
        }
        else {
            textFieldName.text = ""
            textFieldYear.text = ""
            textFieldArtistName.text = ""
        }
        
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
            
            NotificationCenter.default.post(name: NSNotification.Name("newDataCome"), object: nil)
            
            self.navigationController?.popViewController(animated: true)
        }catch {
            print("Error saving context \(error)")
            let alert = UIAlertController(title: "Error Has Occured", message: "Error While saving Context Try Again ‼️", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

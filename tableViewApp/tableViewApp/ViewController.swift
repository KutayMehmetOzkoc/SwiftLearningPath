//
//  ViewController.swift
//  tableViewApp
//
//  Created by Kutay Mehmet Ozko on 8.12.2025.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var placesArray = ["anitkabir","kizilay","kugulu","tandogan"]
    var placeImagesArray = [
        UIImage(named: "anitkabir.jpeg"),
        UIImage(named: "kizilay.jpeg"),
        UIImage(named: "kugulu.jpeg"),
        UIImage(named: "tandogan.jpeg")
    ]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let placesArray: [String] = placesArray
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = placesArray[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailVC
            let row = tableViewList.indexPathForSelectedRow!.row
            
            destinationVC.selectedPlace = placesArray[row]
            destinationVC.selectedPlaceImage = placeImagesArray[row]!
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.placesArray.remove(at: indexPath.row)
            self.placeImagesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableViewList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewList.delegate = self
        tableViewList.dataSource = self
    }
}


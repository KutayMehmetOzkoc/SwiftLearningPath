//
//  ViewController.swift
//  ArtBookApp
//
//  Created by Kutay Mehmet Ozko on 9.12.2025.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var nameArray = [String]()
    var idArray = [UUID]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var tableViewMain: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        
        navigationController?.navigationBar.topItem?.title = "Art Book"
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addNewRow))
        
        getData()
    }
    
    func getData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            for result in results as! [NSManagedObject]{
                if let name =  result.value(forKey: "name") as? String{
                    self.nameArray.append(name)
                }
                if let id = result.value(forKey: "id") as? UUID{
                    self.idArray.append(id)
                }
            }
            self.tableViewMain.reloadData()
            print("Refresh Succes Data List")
        }
        catch{
            print("Error fetching data")
        }
        
        
    }

    @objc func addNewRow() {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
}


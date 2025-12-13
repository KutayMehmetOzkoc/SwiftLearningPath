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
    var selectedPainting = ""
    var selectedPaintingId : UUID?
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPainting = nameArray[indexPath.row]
        selectedPaintingId = idArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetailsVC" {
                let destinationVC = segue.destination as! detailViewController
                destinationVC.chosenPaint = selectedPainting
                destinationVC.chosenPaintingId = selectedPaintingId
            }
        }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name("newDataCome"), object: nil)
    }
    
    @objc func getData(){
        
        //To remove dublicate data
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
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
        }
        catch{
            print("Error fetching data")
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                self.nameArray.remove(at: indexPath.row)
                self.idArray.remove(at: indexPath.row)
                tableViewMain.deleteRows(at: [indexPath], with: .fade)
            }
    }

    @objc func addNewRow() {
        selectedPainting = ""
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
}


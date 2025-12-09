//
//  ViewController.swift
//  simpsonsBookApp
//
//  Created by Kutay Mehmet Ozko on 9.12.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var homerArray = [SimpsonChar]()
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = homerArray[indexPath.row].name
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        let hommer = SimpsonChar(name: "Homer", job: "scientist", photo: UIImage(named :"hommer.jpeg")!)
        let bart = SimpsonChar(name: "Bart", job: "student", photo: UIImage(named: "bart.jpeg")!)
        let maggie = SimpsonChar(name: "Maggie", job: "lawyer", photo: UIImage(named: "maggie.jpeg")!)
        let marge = SimpsonChar(name: "Marge", job: "teacher", photo: UIImage(named: "marge.jpeg")!)
        
        
        homerArray.append(hommer)
        homerArray.append(bart)
        homerArray.append(maggie)
        homerArray.append(marge)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! detailViewController
            destinationVC.simpsonData = homerArray[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.homerArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}


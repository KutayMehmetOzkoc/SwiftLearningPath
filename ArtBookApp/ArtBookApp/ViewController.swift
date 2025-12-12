//
//  ViewController.swift
//  ArtBookApp
//
//  Created by Kutay Mehmet Ozko on 9.12.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewMain: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.topItem?.title = "Art Book"
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addNewRow))
    }

    @objc func addNewRow() {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
}


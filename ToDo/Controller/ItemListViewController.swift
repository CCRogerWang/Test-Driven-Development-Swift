//
//  ItemListViewController.swift
//  ToDo
//
//  Created by roger on 2017/7/4.
//  Copyright © 2017年 roger. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider:  (UITableViewDataSource & UITableViewDelegate)!
    
    let itemManager = ItemManager()
    
    override func viewDidLoad() {
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        if let nextViewController =
            storyboard?.instantiateViewController(
                withIdentifier: "InputViewController")
                as? InputViewController {
            nextViewController.itemManager = ItemManager()
            present(nextViewController, animated: true, completion: nil)
        }
    }
}

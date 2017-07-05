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
    
    override func viewDidLoad() {
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }
}

//
//  ViewController.swift
//  Week01
//
//  Created by mynSoo on 2017/10/22.
//  Copyright © 2017年 mynSoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK - PROPERTY
    @IBOutlet weak var mainTableView: UITableView!
    let sections = ["RWTipCaculatorVC","RWNamesListVC"];
    
    // MARK - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self;
        mainTableView.delegate = self;
    }
    
    // MARK - TABLEVIEW DELEGATE DATASOURCE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = sections[indexPath.row];
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            navigationController?.pushViewController(RWTipCaculatorVC(), animated: true);
        }else {
            navigationController?.pushViewController(RWNameListVC(), animated: true);
        }
    }
}


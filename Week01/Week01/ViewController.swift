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
    let sections = ["RWTipCaculatorVC","RWNameListVC","RWTimerVC"];
    
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
        
        switch indexPath.row {
        case 0:do {
            navigationController?.pushViewController(RWTipCaculatorVC(), animated: true);
            }
        case 1:do {
            navigationController?.pushViewController(RWNameListVC(), animated: true);
            }
        case 2:do {
            navigationController?.pushViewController(RWTimerVC(), animated: true);
            }
        default:do {
            
            }
        }
    }
}


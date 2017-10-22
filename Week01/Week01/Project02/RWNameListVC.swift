//
//  RWNameListVC.swift
//  Project01_TipCalculator
//
//  Created by mynSoo on 2017/10/22.
//  Copyright © 2017年 mynSoo. All rights reserved.
//

import UIKit
let kCellId: String = "UITableViewCell"
class RWNameListVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    // MARK - PROPERTY
    let names = ["Bpple", "Aack","Bpple3","bpple2","D","cd","Luna","A2pple"]
    var namesDict = [String: Array<String>]();
    var keys = [String]();
    @IBOutlet weak var nameListTableView: UITableView!
    
    // MARK - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Names List"
        self.installUI();
        self.processData();
    }
    
    // MARK - FUNCTION
    func installUI() {
        nameListTableView.dataSource = self;
        nameListTableView.delegate = self;
        nameListTableView.register(UITableViewCell.self, forCellReuseIdentifier: kCellId)
    }
    func processData() {
        let sortedNames = names.sorted { (str1, str2) -> Bool in
            str1.compare(str2) == ComparisonResult.orderedAscending
        }
        for str in sortedNames {
            if let c = str.first {
                let cstr = String.init(c).uppercased();
                if namesDict[cstr] != nil {
                }else {
                    namesDict[cstr] = Array<String>()
                }
                namesDict[cstr]?.append(str);
            }
        }
        for (key,_) in namesDict {
            keys.append(key);
        }
        keys = keys.sorted { (str1, str2) -> Bool in
            str1.compare(str2) == ComparisonResult.orderedAscending
        }
    }
    
    // MARK - TABLEVIEW DELEGATE DATASOURCE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let arr = namesDict[keys[section]] {
            return arr.count;
        }
        return 0;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count;
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section];
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath);
        
        if let arr = namesDict[keys[indexPath.section]] {
            cell.textLabel?.text = arr[indexPath.row];
        }else {
            cell.textLabel?.text = "";
        }
        return cell;
    }
}

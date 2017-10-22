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
    let names = ["Bpple", "Aack","Bpple3","bpple2","D","cd","Luna","A2pple"]
    var namesDict = [String: Array<String>]();
    var keys = [String]();
    
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
    

    @IBOutlet weak var nameListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Names List"
        
        nameListTableView.dataSource = self;
        nameListTableView.delegate = self;
        nameListTableView.register(UITableViewCell.self, forCellReuseIdentifier: kCellId)

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
        
//        names.sort(by: {
//            $0.compare($1) == ComparisonResult.orderedAscending
//        })
        
//        names.sort(by: { first;: String , second:String  in
//
//        })
        // Do any additional setup after loading the view.
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  RWTipCaculatorVC.swift
//  Project01_TipCalculator
//
//  Created by mynSoo on 2017/10/22.
//  Copyright © 2017年 mynSoo. All rights reserved.
//

import UIKit

class RWTipCaculatorVC: UIViewController, UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Tip Caculator"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tipLb: UILabel!
    @IBOutlet weak var tipPercentLb: UILabel!
    @IBOutlet weak var totalLb: UILabel!
    @IBOutlet weak var baseValueTF: UITextField!
    @IBOutlet weak var tipPercentCtlSlider: UISlider!
    var lastText: String = ""
    
    func updateData() {
        // 判断是否是有效值
        let tipPercent = Double(tipPercentCtlSlider.value);
        
        tipPercentLb.text = "Tip(\(String.init(format: "%.2f", tipPercent * 100)))%";
        
        if let text = baseValueTF.text, let value = Double(text) {
            let tip = value * tipPercent;
            let total = value + tip;
            totalLb.text = String.init(format: "%.2f", total);
            tipLb.text = String.init(format: "%.2f", tip);
        }else {
            totalLb.text = "nan"
            tipLb.text = "nan"
        }
    }
    @IBAction func onEditingChanged(_ sender: UITextField) {
        if let text = sender.text {
            if(text.count <= 20){
                lastText = text;
            }else {
                sender.text = lastText;
            }
        }
        self.updateData();
    }
    
    @IBAction func onValueChangedTipPercentCtlSlider(_ sender: UISlider) {
        self.updateData();
    }
}

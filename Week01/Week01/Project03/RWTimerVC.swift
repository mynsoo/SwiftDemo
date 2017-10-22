//
//  RWTimerVC.swift
//  Week01
//
//  Created by mynSoo on 2017/10/22.
//  Copyright © 2017年 mynSoo. All rights reserved.
//

import UIKit

class RWTimerVC: UIViewController {

    @IBOutlet weak var counterLb: UILabel!
    // MARK - PROPERTY
    var _isPlay: Bool = false;
    var _counter: Double = 0.0;
    
    // MARK - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        unowned let uSelf = self;
        // Set Timer
        let timer = Timer(timeInterval: 0.1, repeats: true) { (timer) in
            uSelf.update()
        };
        RunLoop.main.add(timer, forMode: .commonModes);
    }
    
    // MARK - FUNCTION
    @IBAction func play(_ sender: UIButton) {
        _isPlay = true;
    }
    
    @IBAction func pause(_ sender: Any) {
        _isPlay = false;
    }
    
    @IBAction func reset(_ sender: Any) {
        _counter = 0;
        _isPlay = false;
        counterLb.text = "0.0"
    }
    func update() {
        if(_isPlay) {
            _counter += 0.1;
            counterLb.text = String.init(format: "%.1f", _counter);
        }
    }
}


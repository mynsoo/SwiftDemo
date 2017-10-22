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
    
    func update() {
        if(_isPlay) {
            _counter += 0.1;
            counterLb.text = String.init(format: "%.2f", _counter);
        }
    }
    func play() {
        _isPlay = true;
    }
    func pause() {
        _isPlay = false;
    }
    func reset() {
        _counter = 0;
        _isPlay = false;
    }
}


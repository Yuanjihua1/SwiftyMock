//
//  ViewController.swift
//  Mock
//
//  Created by ZhangJing on 2018/3/30.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import UIKit
import JavaScriptCore

class View : UIView {
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = touches.first?.location(in: self)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let arr = Address.json as! [[String:Any]]
        print(Address.cities(in: "河北省"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


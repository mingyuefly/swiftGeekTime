//
//  ViewController.swift
//  accessControl
//
//  Created by mingyue on 2020/2/17.
//  Copyright © 2020 Gmingyue. All rights reserved.
//

import UIKit
import OneTarget

// 需要Human是open修饰才可以在模块外继承
//class Student: Human {
//
//}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 需要Human和其构造方法是public以上修饰才可以在模块外调用
        //let human = Human(name:"zhangsan", age:20)
    }


}


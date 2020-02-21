//
//  ViewController.swift
//  swiftAndOC
//
//  Created by mingyue on 2020/2/21.
//  Copyright © 2020 Gmingyue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Swift 页面"
        view.backgroundColor = .white
        
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 30)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("点击跳转", for: UIControl.State.normal)
        button.backgroundColor = UIColor.white
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(didClickButton), for: UIControl.Event.touchUpInside)
    }

    @objc func didClickButton() {
        let myVC = OCViewController()
        myVC.myTest()
        navigationController?.pushViewController(myVC, animated: true)
    }
}


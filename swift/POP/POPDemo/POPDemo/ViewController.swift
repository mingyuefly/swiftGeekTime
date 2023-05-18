//
//  ViewController.swift
//  POPDemo
//
//  Created by gmy on 2023/5/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let bird = Bird()
        bird.fly()
        bird.wings = 4
        print(bird.wings)
        bird.overlook()
        let plane = Plane()
        plane.fly()
        plane.height = 24.0
        print(plane.height)
        plane.overlook()
    }
}


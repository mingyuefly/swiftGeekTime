//
//  Person.swift
//  swiftAndOC
//
//  Created by mingyue on 2020/2/21.
//  Copyright © 2020 Gmingyue. All rights reserved.
//

import Foundation

class Person:NSObject {
    @objc var name:String
    @objc var age:Int
    @objc init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
}

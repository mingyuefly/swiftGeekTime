//
//  Animal.swift
//  POPDemo
//
//  Created by gmy on 2023/5/17.
//

import UIKit

class Animal {
    var legs:UInt8 {
        get {
            return 0
        }
    }
    func eat() {
        print("eat food")
    }
}

class Bird: Animal, Flight {
    var height: Float {
        get {
            return Float(10.0)
        }
    }
    
    var volocity: Float {
        get {
            return Float(100.0)
        }
    }
    
    override var legs: UInt8 {
        get {
            return UInt8(2)
        }
    }
    var wings:UInt8 = 0
//    {
//    // read-only
//        get {
//            return UInt8(2)
//        }
//    }
    override func eat() {
        print("eat insect")
    }
    func fly() {
        print("bird fly")
    }
}

class Beast: Animal {
    override var legs: UInt8 {
        get {
            return UInt8(4)
        }
    }
    var teeth:UInt8 {
        get {
            return UInt8(10)
        }
    }
    override func eat() {
        print("eat meat")
    }
}

class Aircraft {
    var wheels: UInt8 {
        get {
            return UInt8(3)
        }
    }
}

class Plane:Aircraft, Flight {
    var height: Float = 0.0
//    {
//        get {
//            return Float(1000.0)
//        }
//    }
    
    var volocity: Float {
        get {
            return Float(20000.0)
        }
    }
    
    var wings:UInt8 {
        get {
            return UInt8(2)
        }
    }
    func fly() {
        print("plane fly")
    }
}

class rotorCraft:Aircraft {
    var rotor:UInt8 {
        get {
            return UInt8(2)
        }
    }
}

protocol Flight {
    var height: Float { get }
    var volocity: Float { get }
    func fly()
}

//
//  Human.swift
//  OneTarget
//
//  Created by mingyue on 2020/2/17.
//  Copyright © 2020 Gmingyue. All rights reserved.
//

import Foundation

// 报错，只有类才能用open修饰
//open struct Item {
//
//}

// 必须设置public才能在模块外调用，必须设置open才能在模块外被继承，如果是fileprivate修饰，则只能在本文件调用，如下面的Teacher继承
// public class Human {
//open class Human {
//fileprivate class Human {
private class Human {
    var name:String
    private var age:Int
    // 由于HumanSex被private修饰，所以属性必须要用private修饰
    private var sex:HumanSex
    // 必须设置public才能在模块外调用
    public init(name:String, age:Int) {
        self.name = name
        self.age = age
        self.sex = HumanSex()
    }
    // 由于HumanSex是private修饰的，所以构造方法也要private修饰
    private init(name:String, age:Int, sex:HumanSex) {
        self.name = name
        self.age = age
        self.sex = sex
    }
    
    // 若声明为private则不能被类外调用
    //private class HumanSex {
    private class HumanSex {
        
    }
}

extension Human {
    func showInfo() {
        print("name is \(name), age is \(age)")
    }
}

private let human = Human(name: "zhangsan", age: 20)
//human.name = "wangwu"
//human.age = 30//报错

// 如果父类是fileprivate修饰，子类也必须用fileprivate修饰
fileprivate class Teacher: Human {
    var salary:Int
    override init(name: String, age: Int) {
        self.salary = 5000
        super.init(name: name, age: age)
    }
}

// 若HumanSex被private修饰，则TeacherSex不能继承这个内嵌类
//fileprivate class TeacherSex: Human.HumanSex {
//
//}






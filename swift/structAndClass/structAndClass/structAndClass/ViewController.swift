//
//  ViewController.swift
//  structAndClass
//
//  Created by gmy on 2023/5/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var contract = Contract()
        contract.name = "nameA"
        contract.age = 10
        
        var contract1 = contract
        contract1.name = "nameB"
        // struct是值类型，contract1和contract是两块不同的内存地址
        print(contract)
        print(contract1)
//        Contract(name: Optional("nameA"), age: Optional(10))
//        Contract(name: Optional("nameB"), age: Optional(10))
        
        
        let student = Student()
        student.name = "nameA"
        student.age = 10
        
        let student1 = student
        student.name = "nameB"
        student.age = 11
        // class是引用类型，student和student1指向同一块儿内存地址
        print(student.name ?? "name", student.age ?? 0)
        print(student1.name ?? "name", student1.age ?? 0)
        
        var contracts:[Contract] = []
        for i in 0...2 {
//            print(i)
            var contract = Contract()
            contract.name = "name" + String(i)
            contract.age = 10 + UInt8(i)
            contracts.append(contract)
        }
        
        var students:[Student] = []
        for i in 0...2 {
            var student = Student()
            student.name = "name" + String(i)
            student.age = 10 + UInt8(i)
            students.append(student)
        }
        print(contracts)
        students.forEach { student in
            print(student.name ?? "name", student.age ?? 0)
        }
        
        var contract2 = contracts[1]
        contract2.name = "nameZ"
        // contracts中第二个元素值不会改变
        print(contracts)
        
        var student2 = students[1]
        student2.name = "nameZ"
        // students中第二个元素值会改变
        students.forEach { student in
            print(student.name ?? "name", student.age ?? 0)
        }
        
    }
}


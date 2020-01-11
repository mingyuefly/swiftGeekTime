import UIKit

var str = "Hello, playground"

/**
 循环控制
 */

//let dict = ["spider":8, "ant":6, "cat":4]
//for item in dict {
//    print(item)
//    print("\(item.key) has \(item.value) legs")
//}
//
//for (animalName, legCount) in dict {
//    print("\(animalName) has \(legCount) legs")
//}
//
//for i in stride(from: 0, to: 50, by: 5) {
//    print(i)
//}
//
//for i in stride(from: 0, to: 51, by: 5) {
//    print(i)
//}
//
//let base = 3
//let power = 5
//var result = 1
//for _ in 1...power {
//    result *= base
//}
//print(result)
//
//var count = 0
//repeat {
//    print(count)
//    count += 1
//} while count < 5


/**
 switch
 */

//let char:Character = "A"
//switch char {
//case "a", "A":
//    print("the first letter of alphabet")
//case "z":
//    print("the last letter of alphabet")
//default:
//    print("other letter")
//}
//
//// 区间匹配
//let count = 42
//var naturalCount:String
//switch count {
//case 0:
//    naturalCount = "none"
//case 1..<12:
//    naturalCount = "a few"
//case 12..<100:
//    naturalCount = "dozens of"
//case 100..<1000:
//    naturalCount = "hundreds of"
//default:
//    naturalCount = "many"
//}
//
//print(naturalCount)
//
//// 元组匹配
////let somePoint = (1, 1)
////let somePoint = (1, 0)
////let somePoint = (1, 1)
////let somePoint = (1, 0)
//let somePoint = (0, 1)
//switch somePoint {
//case (0, 0):
//    print("point of origin")
//case (_, 0):
//    print("point at x-axis")
//case (0, _):
//    print("point at y-axis")
//case (-2...2, -2...2):
//    print("point in box")
//default:
//    print("point in other place")
//}
//
//// 值绑定 where子句
//switch somePoint {
//case (0, 0):
//    print("point of origin")
//case (let x, 0):
//    print("point at x-axis, distance is \(x)")
//case (0, let y):
//    print("point at y-axis, distance is \(y)")
//case let (x, y) where x == y:
//    print("x == y")
//case (-2...2, -2...2):
//    print("point in box")
//default:
//    print("point in other place")
//}
//
//// 复合匹配
//switch somePoint {
//case (0, 0):
//    print("point of origin")
//case (let distance, 0), (0,let distance):
//    print("point at axis, distance is \(distance)")
//default:
//    print("point in other place")
//}

/**
 流程控制转移
 */

//let char:Character = "a"
//switch char {
//case "a":
//    print("the first letter of alphabet")
//    fallthrough
//case "b":
//    print("the second letter of alphabet")
//    fallthrough
//case "z":
//    print("the last letter of alphabet")
//default:
//    print("other letter")
//}
//
//var number = 10
//whileLoop: while number > 0 {
//    switch number {
//    case 9:
//        print("9")
//    case 10:
//        var sum = 0
//        for index in 1...10 {
//            sum += index
//            if index == 9 {
//                print(sum)
//                break whileLoop
//            }
//        }
//    default:
//        break
//    }
//    number -= 1
//}

/**
 guard
 */

//func isIPAdress(ipString:String) -> (Int, String) {
//    let components = ipString.split(separator: ".")
//    if components.count == 4 {
//        if let first = Int(components[0]), first >= 0 && first <= 255 {
//            if let second = Int(components[1]), second >= 0 && second <= 255 {
//                if let third = Int(components[2]), third >= 0 && third <= 255 {
//                    if let fourth = Int(components[2]), fourth >= 0 && fourth <= 255 {
//                        return (0, "ip地址合法")
//                    } else {
//                        return (4, "ip地址第四部分不对")
//                    }
//                } else {
//                    return (3, "ip地址第三部分不对")
//                }
//            } else {
//                return (2, "ip地址第二部分不对")
//            }
//        } else {
//            return (1, "ip地址第一部分不对")
//        }
//    } else {
//        return (100, "ip地址必须有四部分")
//    }
//}
//
//print(isIPAdress(ipString: "127.0.0.1"))
//print(isIPAdress(ipString: "300.0.0.1"))
//print(isIPAdress(ipString: "127.0.300.1"))
//print(isIPAdress(ipString: "127.0.1"))
//
//func isIPAdress2(ipString:String) -> (Int, String) {
//    let components = ipString.split(separator: ".")
//    guard components.count == 4 else {
//        return (100, "ip地址必须有四部分")
//    }
//    guard let first = Int(components[0]), first >= 0 && first <= 255 else {
//        return (1, "ip地址第一部分不对")
//    }
//    guard let second = Int(components[1]), second >= 0 && second <= 255 else {
//        return (2, "ip地址第二部分不对")
//    }
//    guard let third = Int(components[2]), third >= 0 && third <= 255 else {
//        return (3, "ip地址第三部分不对")
//    }
//    guard let fourth = Int(components[2]), fourth >= 0 && fourth <= 255 else {
//        return (4, "ip地址第四部分不对")
//    }
//    return (0, "ip地址合法")
//}
//
//print(isIPAdress2(ipString: "127.0.0.1"))
//print(isIPAdress2(ipString: "300.0.0.1"))
//print(isIPAdress2(ipString: "127.0.300.1"))
//print(isIPAdress2(ipString: "127.0.1"))

/**
 模式和模式匹配
 */

// 可选项模式
//let someInt:Int? = 42
////let someInt:Int? = nil
//
//if case let x? = someInt {
//    print(x)
//} else {
//    print("no value")
//}
//
//if case .some(let x) = someInt {
//    print(x)
//} else {
//    print("no value")
//}
//
//let nums:[Int?] = [nil, 1, 2, nil, 5]
//for case let x? in nums {
//    print(x)
//}

// 类型转换模式
//protocol Animal {
//    var name:String{get}
//}
//
//struct Dog:Animal {
//    var name:String = "dog"
//    var runSpeed:Int
//}
//
//struct Bird:Animal {
//    var name: String = "Bird"
//    var flightHeight:Int
//}
//
//struct Fish:Animal {
//    var name: String = "Fish"
//    var depth:Int
//}
//
//let anmimals:[Any] = [Dog(runSpeed: 50), Bird(flightHeight: 1000), Fish(depth: 800)]
//for animal in anmimals {
//    switch animal {
//    case let dog as Dog:
//        print("Dog runSpeed:\(dog.runSpeed)")
//    case let bird as Bird:
//        print("Bird fightHeight:\(bird.flightHeight)")
//    case is Fish:
//        print("Fish can swim")
//    default:
//        print("unknown animals")
//    }
//}

// 表达式模式
struct Teacher {
    var name:String
    var salary:Int
}

func ~= (pattern:Range<Int>, value:Teacher) -> Bool {
    return pattern.contains(value.salary)
}

//let teacher = Teacher(name: "zhangsan", salary: 4980)
let teacher = Teacher(name: "zhangsan", salary: 9980)
switch teacher {
case 0..<2000:
    print("温饱线")
case 2000..<5000:
    print("小康")
case 5000..<10000:
    print("活的很滋润")
default:
    print("土豪")
}

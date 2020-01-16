import UIKit

//var str = "Hello, playground"

/**
 枚举
 */

////遵守CaseIterable协议后可以遍历
////enum CompassPoint:CaseIterable {
////    case south
////    case north
////    case east
////    case west
////}
////
////let direction = CompassPoint.west
////switch direction {
////case .south:
////    print("south")
////case .north:
////    print("north")
////case .east:
////    print("east")
////case .west:
////    print("west")
////}
////
////print(CompassPoint.allCases.count)
////print(CompassPoint.allCases)
//
//// 预设值
//
////enum ControlCharactor:String {
////    case tab = "\t"
////    case line = "\n"
////}
////print(ControlCharactor.tab)
////print("begin\(ControlCharactor.tab.rawValue)end")
////print("begin\(ControlCharactor.line.rawValue)end")
////
////enum CompassPoint:Int {
////    case south = 5
////    case north
////    case east
////    case west
////}
////print(CompassPoint.north.rawValue)
////let direction = CompassPoint(rawValue: 8)
////print(direction)
//
//
//// 关联值
//enum Barcode {
//    case upc(Int, Int, Int, Int)
//    case quCode(String)
//}
//var productCode = Barcode.upc(1, 2, 3, 4)
//print(productCode)
//productCode = .quCode("abcd")
//
//switch productCode {
//case .upc(let a, let b, let c, let d):
//    print("upc-\(a)-\(b)-\(c)-\(d)")
//case .quCode(let codeString):
//    print("qrcode=\(codeString)")
//}
//
//// 递归枚举
//indirect enum ArithmetricExPression {
//    case number(Int)
//    case add(ArithmetricExPression, ArithmetricExPression)
//    case mutiply(ArithmetricExPression, ArithmetricExPression)
//}
//
//let firstExpression = ArithmetricExPression.number(5)
//let secondExpression = ArithmetricExPression.number(4)
//let addExpression = ArithmetricExPression.add(firstExpression, secondExpression)
//let third = ArithmetricExPression.number(2)
//let mutiplyExpression = ArithmetricExPression.mutiply(addExpression, third)
//print(mutiplyExpression)
//
//func eval(_ expression:ArithmetricExPression) -> Int {
//    switch expression {
//    case .number(let value):
//        return value
//    case .add(let first, let second):
//        return eval(first) + eval(second)
//    case .mutiply(let first, let second):
//        return eval(first) * eval(second)
//    }
//}
//print(eval(mutiplyExpression))

/**
 添加属性
 */

//// 存储属性和计算属性
////struct Point {
////    var x = 0
////    var y = 0
////
////}
////
////struct Size {
////    var width = 0
////    var height = 0
////}
////
////struct React {
////    var origin:Point
////    var size:Size
////    var Center:Point {
////        get {
////            //return Point(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
////            // 可以简写省掉return
////            Point(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
////        }
////        set(newCenter) {
////            origin.x = newCenter.x - size.width / 2
////            origin.y = newCenter.y - size.height / 2
////        }
////    }
////}
////
////// 属性观察器
////class StepCounter {
////    var totalSteps:Int = 0 {
////        willSet(newSteps) {
////            print("will set totalSteps to \(newSteps)")
////        }
////        didSet(oldSteps) {
////            print("did change totalSteps from \(oldSteps) to \(totalSteps)")
////        }
////    }
////}
////var counter = StepCounter()
////counter.totalSteps = 100
////counter.totalSteps = 360
////counter.totalSteps = 812
//
//var count:Int = 0 {
//    willSet {
//        print("will set count to \(newValue)")
//    }
//    didSet {
//        print("did set count from \(oldValue) to \(count)")
//    }
//}
//count = 10



/**
 添加方法
 */

//struct Point {
//    var x = 0
//    var y = 0
//    // 值类型的属性在成员方法中改变要加mutating关键词
//    mutating func moveBy(x:Int, y:Int) {
//        //self.x += x
//        //self.y += y
//        self = Point(x: self.x + x, y: self.y + y)
//    }
//    func printInfo() {
//        print("x is \(x), y is \(y)")
//    }
//    // 类的静态方法
//    static func printTypeInfo() {
//        print("A point")
//    }
//}
//
//var p = Point(x: 2, y: 2)
//p.printInfo()
//Point.printTypeInfo()
//p.moveBy(x: 2, y: 5)
//p.printInfo()

/**
 下标和下标重载
 */

//struct Matrix {
//    let rows:Int
//    let columns:Int
//    var grid:[Double]
//    init(rows:Int, columns:Int) {
//        self.rows = rows
//        self.columns = columns
//        grid = Array(repeating: 0.0, count: rows * columns)
//    }
//    subscript(rows:Int, column:Int) -> Double {
//        get {
//            return grid[rows * columns + column]
//        }
//        set {
//            grid[rows * columns + column] = newValue
//        }
//    }
//}
//
//var matrix = Matrix(rows: 2, columns: 2)
//matrix[1, 0] = 9.9
//matrix[0, 1] = 8.8
//print(matrix.grid)
//print(matrix[0, 1])
//
//enum CompassPoint:Int {
//    case south = 1
//    case north
//    case east
//    case west
//
//    static subscript(index:Int) -> CompassPoint {
//        get {
//            return CompassPoint(rawValue: index)!
//        }
//    }
//}
//
//let direction = CompassPoint[2]
//print(direction)

/**
 类的初始化和反初始化
 */

//class Person {
//    var name:String
//    var age:Int
//    init(name:String, age:Int) {
//        self.name = name
//        self.age = age
//    }
//    convenience init() {
//        self.init(name:"[Unnamed]", age:0)
//    }
//}
//
//class Teacher:Person {
//    var salary:Int
//    init(name: String, age: Int, salary:Int) {
//        self.salary = salary
//        //self.name = self.name + "老师"//报错
//        //self.test()//报错
//        super.init(name: name, age: age)
//        self.test()
//        //self.salary = salary//报错
//        self.name = self.name + "老师"
//    }
//
//    func test() {
//        print("teacher test")
//    }
//
//    convenience init(salary:Int) {
//        //self.salary = salary //报错
//        self.init(name:"zhangsan", age:30, salary:salary)
//        self.salary = salary + 1000
//    }
//}


/**
 继承
 */

//class Vehicle {
//    var currentSpeed:Int = 0
//    //final var desc:String {//不能被子类继承这个方法
//    var desc:String {
//        return "run at speed \(currentSpeed)"
//    }
//    func makeNoise() {
//
//    }
//}
//
//class Car:Vehicle {
//    var gear:Int = 0
//    override var desc: String {
//        return super.desc + "at gear \(gear)"
//    }
//}
//
//var car = Car()
//car.gear = 3
//car.currentSpeed = 30
//print(car.desc)


/**
 多态 类型转换
 */

//class MediaItem {
//    var name:String
//    init(name:String) {
//        self.name = name
//    }
//}
//
//class Movie:MediaItem {
//    var director:String
//    init(name:String, director:String) {
//        self.director = director
//        super.init(name: name)
//    }
//}
//
//class Song:MediaItem {
//    var artist:String
//    init(name:String, artist:String) {
//        self.artist = artist
//        super.init(name: name)
//    }
//}
//
//let array = [Movie(name: "1", director: "2"), Song(name: "3,", artist: "4"), Movie(name: "5", director: "6")]
//print(type(of: array))
//for item in array {
//    if let realItem = item as? Movie {
//        print(realItem.director)
//    }
//}

/**
 扩展
 */

//extension Double {
//    var km:Double {
//        return self / 1000.0
//    }
//}
//
//let speed:Double = 1200.0
//print(speed.km)
//
//extension Int {
//    func repeatTask(task:() -> ()) {
//        for _ in 0..<self {
//            task()
//        }
//    }
//}
//
//3.repeatTask {
//    print("hello")
//}
//
//extension Int {
//    subscript(digitIndex: Int) -> Int {
//        get {
//            var base = 1
//            for _ in 0..<digitIndex {
//                base *= 10
//            }
//            return (self / base % 10) // 返回digitIndex位数字
//        }
//    }
//}
//
//extension Int {
//    enum Kind {
//        case zero
//        case negative
//        case positive
//    }
//    var kind:Kind {
//        get {
//            switch self {
//            case 0:
//                return .zero
//            case let x where x > 0:
//                return .positive
//            default:
//                return .negative
//            }
//        }
//    }
//}
//
//print(0.kind)
//print(8.kind)
//print((-1).kind)


/**
 协议
 */

//var str = "Hello, playground"
//
//protocol Named {
//    var name:String {
//        get
//    }
//}
//
//protocol Aged {
//    var age:Int {
//        get
//    }
//
//}
//
//struct Person:Named, Aged {
//    var name: String
//    var age: Int
//}
//
//let p = Person(name: "zhangsan", age: 20)
//
//func wish(to:Named & Aged) {
//    print("name \(to.name) age \(to.age)")
//}
//
//wish(to: p)
//
//// 协议 + 扩展
//protocol TextRepresentable {
//    var desc:String {
//        get
//    }
//}
//
//extension Person:TextRepresentable {
//    var desc: String {
//        return "name \(name) age \(age)"
//    }
//}
//
//print(p.desc)
//
//extension Array:TextRepresentable where Element: TextRepresentable {
//    var desc: String {
//        let itemDesc = self.map{$0.desc}
//        return itemDesc.joined(separator: ",")
//    }
//}
//
//let array = [Person(name: "zhangsan", age: 20), Person(name: "lisi", age: 30)]
//print(array.desc)
////let intArray = [1, 2, 3]
////print(intArray.desc)//报错

/**
 POP
 */




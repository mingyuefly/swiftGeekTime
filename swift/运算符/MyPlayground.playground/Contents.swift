import UIKit

/**
 赋值和算术运算符
 */
//var a = 1
//var b = 1
////if b = a { //报错，= 在swift中没有返回值
//if b == a {
//    print("b equal a")
//}
//
//print(9 % 4)
//print(-9 % 4)

/**
 处理算术运算符溢出
 */
//var num1:UInt8 = 251
//var num2 = num1 &+ 20
//print(num2)

//var num1:UInt8 = 0
//var num2 = num1 &- 1
//print(num2)

//var num1:Int8 = -128
//var num2 = num1 &- 1
//print(num2)

/**
 为了optional，合并空置运算符
 */
//let a:Int? = nil
//let b = 8
//print(a ?? b)

//let a:Int? = 10
//let b = "abc"
//print(a ?? b)

//let a:Int? = nil
//let b = "abc"
//print(a ?? b)

func getNumber() -> Int{
    print("in getNumber")
    return 8
}

//let a:Int? = 10
//print(a ?? getNumber())//直接短路

//let a:Int? = nil
//print(a ?? getNumber())//直接短路

//func addTwoNumbers(num1:Int?, num2:Int?) -> Int {
//    return num1! + num2!
//}
////print(addTwoNumbers(num1: 10, num2: 20))
////print(addTwoNumbers(num1: nil , num2: 20))// 报错

//func addTwoNumbers(num1:Int?, num2:Int?) -> Int {
//    if num1 != nil {
//        if num2 != nil {
//            return num1! + num2!
//        } else {
//            return num1!
//        }
//    } else {
//        if num2 != nil {
//            return num2!
//        } else {
//            return 0
//        }
//    }
//}
//print(addTwoNumbers(num1: 10, num2: 20))
//print(addTwoNumbers(num1: nil , num2: 20))// 报错

func addTwoNumbers(num1:Int?, num2:Int?) -> Int {
    return (num1 ?? 0) + (num2 ?? 0)
}
print(addTwoNumbers(num1: 10, num2: 20))
print(addTwoNumbers(num1: nil , num2: 20))// 报错

/**
 区间运算符
 */
for i in 1...5 {
    print(i)
}

let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
for name in names[...2] {
    print(name)
}
for name in names[..<2] {
    print(name)
}

//let range = ...5
//print(range.contains(7))
//print(range.contains(4))
//print(range.contains(-1))

var welcome = "hello,world"
//let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
//welcome.removeSubrange(range)
//print(welcome)

let range2 = "a"..."z"
for char in welcome {
    if !range2.contains(String(char)) {
        print("\(char) 不是小写字母")
    }
}

/**
 位运算符
 */
//let number:UInt8 = 255
//print(~number)
//print(number & 0)
//print(number & 1)
//print(number | 0)
//print(number ^ 3)

//let number:UInt8 = 8
//print(number << 1)
//print(number >> 1)

let number:Int8 = -8
print(number << 1)
print(number >> 1)

/**
 位运算符应用举例1
 */
var a = 10
var b = 8
a = a ^ b;
b = a ^ b;
a = a ^ b;
print(a)
print(b)

// 二进制中1的位数
func countOfOnes(num: UInt) -> UInt {
    var count:UInt = 0
    var temp = num
    while temp != 0 {
        print("countOfOnes")
        count += (temp & 1)
        temp = temp >> 1
    }
    return count
}

print(countOfOnes(num: 0x11010110))

func countOfOnes2(num:Int) -> UInt {
    var count:UInt = 0
    var temp = num
    while temp != 0 {
        print("countOfOnes2")
        count += 1
        temp = temp & (temp - 1)
    }
    return count
}

print(countOfOnes2(num: 0x11010110))

// 是否2次幂
func isPowerOfTwo(num:UInt) -> Bool {
    return (num & (num - 1)) == 0
}

print(isPowerOfTwo(num: 512))
print(isPowerOfTwo(num: 511))

/**
位运算符应用举例2
*/
func findLostNum(nums:[UInt]) -> UInt {
    var lostNum:UInt = 0
    for num in nums {
        lostNum = lostNum ^ num
    }
    return lostNum
}

print(findLostNum(nums: [1, 2, 3, 4, 4, 3, 1]))

func findLostTwoNums(nums:[UInt]) -> (UInt, UInt) {
    var lostNum1:UInt = 0
    var lostNum2:UInt = 0
    var temp:UInt = 0
    
    // 获取这两个不同数字的异或结果
    for num in nums {
        temp = temp ^ num
    }
    
    // 找到第一个为1的位，也就是这两个数字第一个不同的位
    var flag:UInt = 1
    while (temp & flag) == 0 {
        flag = flag << 1
    }
    
    for num in nums {
        // 将这两个数字分在不同数组，其原理是将这一位不同的所有数字分开
        if (num & flag) == 0 {
            lostNum1 = lostNum1 ^ num
        } else {
            lostNum2 = lostNum2 ^ num
        }
    }
    return (lostNum1, lostNum2)
}
// 所有数字和0进行异或^操作结果都是自身，相同数字异或计算结果都是0
// 所有数字和0进行与&操作结果都是0

print(findLostTwoNums(nums: [1, 2, 3, 4, 5, 1, 5, 3]))

/**
 类和结构体自定义运算符实现
 */
// 类遵守Equatable协议，即便没有重载--运算符，也可以实现这个结构体的相等判断
struct Vector2D:Equatable {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left:Vector2D, right:Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

extension Vector2D {
    static prefix func - (vector:Vector2D) -> Vector2D {
        return Vector2D(x:-vector.x, y:-vector.y)
    }
}

extension Vector2D {
    static func += (left:inout Vector2D, right:Vector2D) {
        left = left + right
    }
}

// 如果重载==符号，最好遵守Equatable协议
//extension Vector2D:Equatable {
//    static func == (left:Vector2D, right:Vector2D) -> Bool{
//        return left.x == right.x && left.y == right.y
//    }
//}

var vector1 = Vector2D(x: 3.0, y: 1.0)
var vector2 = Vector2D(x: 2.0, y: 4.0)
//let newVector = Vector2D(x: vector1.x + vector2.x, y: vector1.y + vector2.y)
//let newVector = vector1 + vector2
let newVector = -vector1
print(newVector)
print("newVector: x is \(newVector.x), y is \(newVector.y)")
vector2 += vector1
print(vector2)
print("vector2: x is \(vector2.x), y is \(vector2.y)")
print(vector1 == vector2)
var vector3 = Vector2D(x: 3.0, y: 1.0)
print(vector1 == vector3)

/**
 自定义运算符
 */
prefix operator +++
extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var vector4 = Vector2D(x: 2.0, y: 4.0)
let newVector2 = +++vector4
print("vector4: x is \(vector4.x), y is \(vector4.y)")
print("newVector2: x is \(newVector2.x), y is \(newVector2.y)")

infix operator +-:AdditionPrecedence
extension Vector2D {
    static func +- (left:Vector2D, right:Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

//infix operator *^:MultiplicationPrecedence
infix operator *^:MyPredence

precedencegroup MyPredence {
    associativity: left
    lowerThan: AdditionPrecedence
}

extension Vector2D {
    static func *^ (left:Vector2D, right:Vector2D) -> Vector2D {
        return Vector2D(x: left.x * right.x, y: left.y * left.y + right.y * right.y)
    }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 7.0)
let thirdVector = Vector2D(x: 2.0, y: 2.0)
let vector = firstVector +- secondVector *^ thirdVector
print(vector)










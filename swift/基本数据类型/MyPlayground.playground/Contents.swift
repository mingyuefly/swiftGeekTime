import UIKit

/**
 定义变量和常量
 */

let maxNumberLoginAttemp = 10
var currentNumberLoginAttemp = 0

//maxNumberLoginAttemp = 9 //报错，let修饰常量
currentNumberLoginAttemp = 1

//let x = 0.0, y = 0.0, z = 0.0
//print("x = \(x), y = \(y), z = \(z)")

var x = 0.0, y = 0.0, z = "123"
print("x = \(x), y = \(y), z = \(z)")

//z = 123//报错，swift类型安全

let π = 3.14 // 特殊字符， unicode字符，甚至中文都可以做变量命名
print(π)
var 你好 = "你好世界"
print(你好)
let 🐶🐮 = "dogcow"
print(🐶🐮)

//let 1ab = "abc" // 报错，数字不能在最前边

/**
 数值类型
 */
let a = 8
//let b:UInt8 = 320// 报错，溢出
let b:UInt8 = 240
print("UInt8 min \(UInt8.min), UInt8 max \(UInt8.max)")

let i = 1
// if i { // 报错，不能用int类型代替bool类型
if i == 1 {
    print(i)
}

typealias AudioSample = UInt8
let sample:AudioSample = 32

/**
 元组类型
 */
// 非命名元组
//let error = (1, "没有权限")
//print(error)
//print(error.0)
//print(error.1)

// 命名元组
//let error = (errorCode:1, errorMessage:"没有权限")
//print(error.errorCode)
//print(error.errorMessage)

//var error = (errorCode:1, errorMessage:"没有权限")
//error.errorCode = 2
//print(error)
////error.errorMessage = 3//报错，元组类型不能修改

// Any类型修饰的类型可以修改
//var error:(errorCode:Int, errorMessage:Any) = (errorCode:1, errorMessage:"没有权限")
//error.errorCode = 2
//print(error)
//error.errorMessage = 3
//print(error)

// 元组的分解
let error = (1, "没有权限")
let (errorCode, errorMessage) = error;
print(errorCode)
print(errorMessage)

func writeFile(content:String) -> (errorCode:Int, errorMessage:String) {
    return (1, "没有权限")
}

//let error = writeFile(content: "")
//print(error)

/**
 optional
 */
// 判断展开
//let str:String? = "abc"
////let count = str.count //报错，必须先展开才能访问其属性
//if str != nil {
//    let count = str!.count
//    print(count)
//}

// 绑定
//let str:String? = "abc"
////let str:String? = nil
//if let actualStr = str {
//    let count = actualStr.count
//    print(count)
//}

//var str1:String? = "abc"
//if let actualStr = str1 {
//    let count = actualStr.count
//    print(count)
//    str1 = "abcd"
//    print(actualStr)
//    print(str1)
//}
  
// 强制展开
//let str:String? = nil
//let count = str!.count //报错，强制展开若为nil报错

//隐式展开
//let str:String! = "abc"
//let count = str.count

//可选链调用方式
//let str:String? = "abc"
//let count = str?.count
////let lastIndex = count - 1// 报错，可选项类型要先展开
//if count != nil {
//    let lastIndex = count! - 1
//    print(lastIndex)
//}

/**
 optional 原理
 */
//let str:Optional<String> = "abc"
//if let actualStr = str {
//    let count = actualStr.count
//    print(count)
//}

//let str:Optional<String> = "abc"
//if str != nil {
//    let count = str.unsafelyUnwrapped.count
//    print(count)
//}

/**
 创建和初始化字符串
 */
//let emptyString = ""
//let emptyString = String()
//if emptyString.isEmpty {
//    print("emptyString is empty")
//}

// 多行字符串字面量
//let numbers = """
//
//1
//2
//3
//4
//5
//"""
//print(numbers)

//let numbers = """
//1\
//2\
//3
//4
//5
//"""
//print(numbers)


// 缩进效果
//    let numbers = """
//    1
//    2
//        3
//    4
//    5
//    """
//print(numbers)

// 不让转义符体现出来
//let str = #"1\n2\n3"#
//print(str)

// 让部分转义符体现出来
//let str = #"1\#n2\n3"#
//print(str)

//let str = ##"1"\#n2\n3"##
//print(str)

//let str = ##"1"\#2\#n3"##
//print(str)

/**
 swift字符串的常见操作
 */
//let welcome = "hello"
//var welcome1 = "hello"
////welcome += "world" //报错，let修饰不可更改
//welcome1 += "world"
//print(welcome)
//print(welcome1)

// swift中字符串是值类型的
//var welcome = "hello"
//var welcome1 = welcome
//print(welcome1 == welcome1)
//welcome1.append(",")
//print(welcome)
//print(welcome1)
//
//// 遍历字符串
//for c in welcome {
//    print(c)
//}
//
//// 字符串插值
//let str = #"6 * 7 = \#(6 * 7)"#
//print(str)

/**
 索引访问和修改字符串
 */
//var welcome = "hello"
//print(welcome[welcome.startIndex])
//print(welcome[welcome.index(before: welcome.endIndex)])
//// 插入字符
//welcome.insert("!", at: welcome.endIndex)
//print(welcome)
//// 插入字符串
//welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
//print(welcome)
//
//welcome.remove(at: welcome.index(before: welcome.endIndex))
//print(welcome)
//
//let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
//welcome.removeSubrange(range)
//print(welcome)

/**
 获取字符串和进行字符串比较
 */
let welcome = "hello, world"
let index = welcome.index(of: ",") ?? welcome.endIndex
let subString = welcome[..<index]
print(subString)
let newString = String(subString)
print(newString)

let welcome1 = "hello"
print(welcome == welcome1)
print(welcome.hasPrefix("hello"))
print(welcome.hasSuffix("world"))
print(welcome1.hasSuffix("world"))








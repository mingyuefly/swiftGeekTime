import UIKit

var str = "Hello, playground"

/**
 定义和使用
 */
//func greet(person:String) -> String {
//    return ("Hello," + person + "!")
//}
//print(greet(person: "zhangsan"))
//
//func minMax(array:[Int]) -> (min:Int, max:Int)? {
//    if array.isEmpty {
//        return nil
//    }
//    var minValue = array[0]
//    var maxValue = array[0]
//    for value in array {
//        if value <= minValue {
//            minValue = value
//        }
//        if value >= maxValue {
//            maxValue = value
//        }
//    }
//    return (minValue, maxValue)
//}
//if let minMaxValue = minMax(array: [1, 3, 2, 5, 4]) {
//    print("min is \(minMaxValue.min), max is \(minMaxValue.max)")
//}

/**
 形式参数和返回值
 */

//////func addTwoNumber(num1:Int, num2:Int) -> Int {
//////    return num1 + num2
//////}
//////print(addTwoNumber(num1: 1, num2: 2))
////
////// 实际参数标签
//////func addTwoNumber(first num1:Int, second num2:Int) -> Int {
//////    return num1 + num2
//////}
////////print(addTwoNumber(num1: 1, num2: 2))//报错，必须使用实际参数标签
//////print(addTwoNumber(first: 1, second: 2))
////
////// 省略实际参数标签
//////func addTwoNumber(_ num1:Int, _ num2:Int) -> Int {
//////    return num1 + num2
//////}
//////print(addTwoNumber(1, 2))
////
////// 默认参数
//////func addTwoNumber(_ num1:Int, _ num2:Int = 10) -> Int {
//////    return num1 + num2
//////}
//////print(addTwoNumber(1))
////
////// 可变形式参数
//////func addNumbers(nums:Int...) -> Int {
//////    var sum = 0
//////    for num in nums {
//////        sum += num
//////    }
//////    return sum
//////}
//////print(addNumbers(nums: 3, 4, 5))
////
////// 输入输出形式参数
////var number = 10
////var anotherNumber = 8
////func swapValue(_ a:inout Int, _ b:inout Int) {
////    let temp = a
////    a = b
////    b = temp
////}
////swap(&number, &anotherNumber)
////print(number)
////print(anotherNumber)
//
///**
// 函数类型和内嵌函数
// */
//
////func swapValue(_ a:inout Int, _ b:inout Int) {
////    let temp = a
////    a = b
////    b = temp
////}
////
////let swapFunc:(inout Int, inout Int) -> Void = swapValue
////var number = 10
////var anotherNumber = 8
////swapFunc(&number, &anotherNumber)
////print(number)
////print(anotherNumber)
//
//// 返回函数类型
////func chooseStepFunction(backward:Bool) -> (Int) -> Int {
////    func stepForward(step:Int) -> Int {return step + 1}
////    func stepBackward(step:Int) -> Int {return step - 1}
////    return backward ? stepBackward : stepForward
////}
////var currentValue = -4
////let stepFunction = chooseStepFunction(backward: currentValue > 0)
////while currentValue != 0 {
////    currentValue = stepFunction(currentValue)
////}
////print(currentValue)
//
//// 将函数作为另一个函数的形参
//func printMathResult(_ mathFunction:(Int, Int) -> Int, _ a:Int, _ b:Int) {
//    print(mathFunction(a, b))
//}
//
//func addTwoNumber(_ num1:Int, _ num2:Int = 10) -> Int {
//    return num1 + num2
//}
//
//printMathResult(addTwoNumber, 3, 5)


/**
 闭包和闭包表达式
 */
////let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
//////func backward(_ s1:String, _ s2:String) -> Bool {
//////    return s1 > s2
//////}
////let sortedName = names.sorted(by: {(s1:String, s2:String) -> Bool in
////    return s1 > s2
////})
////print(sortedName)
//
//// 推断类型版本
////let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
////let sortedName = names.sorted(by: {(s1, s2) -> Bool in
////    return s1 > s2
////})
////print(sortedName)
//
//// 单一表达式直接省略return
////let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
////let sortedName = names.sorted(by: {(s1, s2) -> Bool in
////    s1 > s2
////})
////print(sortedName)
//
//// 省略参数
////let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
////let sortedName = names.sorted(by: {$0 > $1})
////print(sortedName)
//
//// 最简模式
////let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
////let sortedName = names.sorted(by: >)
////print(sortedName)
//
//// 尾随背包
//let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
//let sortedName = names.sorted{$0 > $1}
//print(sortedName)


/**
 闭包捕获值
 */

//func makeIncreamenter(amount: Int) -> () -> Int {
//    var total = 0
//    func increamenter() -> Int {
//        total += amount
//        return total
//    }
//    return increamenter
//}
//
//let increamentByTen = makeIncreamenter(amount: 10)
//print(increamentByTen())
//print(increamentByTen())
//print(increamentByTen())
//
//let increatmentBySeven = makeIncreamenter(amount: 7)
//print(increatmentBySeven())
//
//// 闭包和函数都是引用类型
//let anotherIncrementByTen = increamentByTen;
//print(anotherIncrementByTen())

/**
 逃逸闭包和自动闭包
 */

//// 延迟执行
////var names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
////let customerProvider = {names.remove(at: 0)}
////print(names)
////print(customerProvider())
////print(names)
//
//// 逃逸闭包(这个函数调用结束后再调用的，可逃逸的)
////var providers:[()->String] = []
////func collectCustormerProviders(provider: @escaping () -> String) {
////    providers.append(provider)
////}
//
//// 自动闭包 延迟执行
////var providers:[()->String] = []
////func collectCustormerProviders(provider: @autoclosure @escaping () -> String) {
////    providers.append(provider)
////}
////var names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
////collectCustormerProviders(provider: names.remove(at: 0))
////collectCustormerProviders(provider: names.remove(at: 0))
////print(names)
////for provider in providers {
////    print(provider())
////    //print(provider())
////}
////print(names)
//
////
//var names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
//var providers:[()->String] = []
//func collectCustormerProviders(provider: @autoclosure @escaping () -> String) {
//    providers.append(provider)
//}
//class SomeClass {
//    var x:String = "hello"
//    func doSomeThing() {
//        collectCustormerProviders(provider: self.x)//在逃逸闭包中引用成员变量要使用self引用
//    }
//}
//
//let sc = SomeClass()
//sc.doSomeThing()
//for provider in providers {
//    print(provider())
//    //print(provider())
//}

/**
 高阶函数
 */

//// map filter reduce
//var numbers = [1, 2, 4, 5, 10]
//print(numbers.map{$0 * 10})
//print(numbers.filter({$0 > 4}))
//print(numbers.reduce(100, {$0 + $1}))
//
//// flatMap
//var numbersArray = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
//print(numbersArray.flatMap{$0.map{$0 * 10}})
//
//// compactMap
//let names:[String?] = ["zhangsan", "lisi", nil, "wangwu", nil, "zhaoliu"]
//print(names)
//print(names.count)
//print(names.compactMap{$0})
//print(names.compactMap{$0?.count})

/**
 函数式编程1
 */

//// 命令式
////let words = """
////There are momnents in life when you miss someone so much that you just want to pick them from your dreams and hug them for real Dream what you want to dream go where you want to go be what you want to be because you have only one life and one chance to do all the things you want to do
////"""
////let NON_WORDS = ["a", "of", "and", "or", "the", "on"]
////func wordFree(words:String) -> [String:Int] {
////    var wordDict:[String:Int] = [:]
////    let wordList = words.split(separator: " ")
////    for word in wordList {
////        let lowercaseWord = word.lowercased()
////        if !NON_WORDS.contains(lowercaseWord) {
////            if let count = wordDict[lowercaseWord] {
////                wordDict[lowercaseWord] = count + 1
////            } else {
////                wordDict[lowercaseWord] = 1
////            }
////        }
////    }
////    return wordDict
////}
////
////print(wordFree(words: words))
//////print(wordFree(words: words).sorted(by: {$0 < $1}))
//
//// 函数式
//let words = """
//There are momnents in life when you miss someone so much that you just want to pick them from your dreams and hug them for real Dream what you want to dream go where you want to go be what you want to be because you have only one life and one chance to do all the things you want to do
//"""
//let NON_WORDS = ["a", "of", "and", "or", "the", "on"]
//func wordFree2(word:String) -> [String:Int] {
//    var wordDict:[String:Int] = [:]
//    let wordList = words.split(separator: " ")
//    wordList.map{$0.lowercased()}.filter{!NON_WORDS.contains($0)}.forEach{wordDict[$0] = (wordDict[$0] ?? 0) + 1}
//    return wordDict
//}
//print(wordFree2(word: words))

/**
 函数式编程2
 */

let employee = ["neal", "s", "stu", "j", "rich", "bob", "aiden", "j", "ethan", "liam", "mason", "noah", "lucas", "jacob", "jack"]
func cleanNames(names:[String]) -> String {
    var joinedNames = ""
    for name in names {
        if name.count > 1 {
            joinedNames += name.capitalized + ","
        }
    }
    joinedNames.remove(at: joinedNames.index(before: joinedNames.endIndex))
    return joinedNames
}
print(cleanNames(names: employee))

let result = employee.filter{$0.count > 1}.map{$0.capitalized}.joined(separator:",")
print(result)

extension Array where Element: Any {
    public func concurrentMap<T>(_ transform: (Element) -> T) -> [T] {
        let n = self.count
        if n == 0 {
            return []
        }
        var result = Array<T>()
        result.reserveCapacity(n)
        DispatchQueue.concurrentPerform(iterations: n) {(i) in
            result.append(transform(self[i]))
        }
        return result
    }
    
}

let result1 = employee.filter{$0.count > 1}.concurrentMap{$0.capitalized}.joined(separator:",")
print(result1)

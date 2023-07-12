import UIKit

//var str = "Hello, playground"

/**
 定义和使用
 1，函数可以没有形参，也可以没有返回值（在没有返回值的时是默认有一个Void的返回值，本质上是一个空的元组，作用相当于没有元素的元组）
 2，可以用元组作为返回值，返回多个值
 3，如果函数体是一个单一表达式，那么函数隐式返回这个表达式
 4，每一个函数的形式参数都包括实际参数参数标签和形式参数名，如果未定义实际参数标签，函数会使用形式参数名作为实际参数标签，函数参数第一个是实际参数，第二个是形式参数，可以省略实际参数标签并使用_取代
 5，可以给函数定义一个默认参数值，定义了默认参数值后可以在调用时忽略这个参数。
 6，可变形式参数在函数主体中被当做对应类型的数组。
 7，输入输出形式参数是指可以在函数中修改形式参数，需要用inout修饰，调用时需要在参数前加上&。
 8，每个函数的类型由形式参数类型和返回值类型组成，函数类型可以作为形参。
 9，可以在一个函数内部定义另一个函数，也就是内嵌函数。
 10，闭包是可以在代码中被传递和引用的功能性独立代码块，由大括号包裹，由函数类型、in关键字和实现代码部分组成。
 11，闭包可以通过语境推断类型，单表达式闭包可以省略return，可以简写实际参数名，可以通过$0和$1等名字来引用闭包的实际参数值，在一个情况还可以使用最简形式。
 12，如果函数最后一个参数是一个很长的闭包，可以使用尾随闭包增强其可读性。
 13，闭包可以从上下文捕获已被定义的常量和变量，即使这些常量和变量所在的作用域已经不存在，闭包仍可以在其函数体内引用和修改这些值。
 14，闭包是引用类型，如果分配一个闭包给类实例的属性，并且闭包通过引用实例或者它的成员来捕获实例，类似于Objective-C会产生循环引用。
 15，如果一个闭包作为一个实际参数传递给一个函数，并且在函数返回后调用，这个闭包被称为逃逸闭包，传入时需要使用@escaping修饰。
 16，通过@autoclosure标志标记它的形式参数使用了自动闭包，在调用函数时就像接收了一个String类型的参数，而不是闭包。
 17，在逃逸闭包中引用成员变量要使用self引用。
 18，所谓高级函数本质上还是一个函数，可以接收函数作为参数，或者返回函数来操作另一个函数，是函数式编程思想的基础。
 */

//func greet(person:String) -> String {
//    return ("Hello," + person + "!")
//}
//print(greet(person: "zhangsan"))

// 隐式返回参数
//func greet(person:String) -> String {
//    "Hello," + person + "!"
//}
//print(greet(person: "zhangsan"))

//func minMax(array:[Int]) -> (min:Int, max:Int)? {
//    if array.isEmpty {
//        return nil
//    }
//    var minValue = array[0]
//    var maxValue = array[0]
//    for value in array[1..<array.count] {
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

//func addTwoNumber(num1:Int, num2:Int) -> Int {
//    return num1 + num2
//}
//print(addTwoNumber(num1: 1, num2: 2))

//// 实际参数标签
//func addTwoNumber(first num1:Int, second num2:Int) -> Int {
//    return num1 + num2
//}
////print(addTwoNumber(num1: 1, num2: 2))//报错，必须使用实际参数标签
//print(addTwoNumber(first: 1, second: 2))

// 省略实际参数标签
//func addTwoNumber(_ num1:Int, _ num2:Int) -> Int {
//    return num1 + num2
//}
//print(addTwoNumber(1, 2))

// 默认参数
//func addTwoNumber(_ num1:Int, _ num2:Int = 10) -> Int {
//    return num1 + num2
//}
//print(addTwoNumber(1))

// 可变形式参数
//func addNumbers(nums:Int...) -> Int {
//    var sum = 0
//    for num in nums {
//        sum += num
//    }
//    return sum
//}
//print(addNumbers(nums: 3, 4, 5))

// 输入输出形式参数
//var number = 10
//var anotherNumber = 8
//func swapValue(_ a:inout Int, _ b:inout Int) {
//    let temp = a
//    a = b
//    b = temp
//}
//swap(&number, &anotherNumber)
//print(number)
//print(anotherNumber)

///**
// 函数类型和内嵌函数
// */
//
//func swapValue(_ a:inout Int, _ b:inout Int) {
//    let temp = a
//    a = b
//    b = temp
//}
//
//let swapFunc:(inout Int, inout Int) -> Void = swapValue
//var number = 10
//var anotherNumber = 8
//swapFunc(&number, &anotherNumber)
//print(number)
//print(anotherNumber)

// 返回函数类型，内嵌函数
//func chooseStepFunction(backward:Bool) -> (Int) -> Int {
//    func stepForward(step:Int) -> Int {return step + 1}
//    func stepBackward(step:Int) -> Int {return step - 1}
//    return backward ? stepBackward : stepForward
//}
//var currentValue = -4
//let stepFunction = chooseStepFunction(backward: currentValue > 0)
//while currentValue != 0 {
//    currentValue = stepFunction(currentValue)
//}
//print(currentValue)

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
//let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
//func backward(_ s1:String, _ s2:String) -> Bool {
//    return s1 < s2
//}
//let sortedName = names.sorted(by: backward)
//print(sortedName)
//
//let sortedName1 = names.sorted(by: {(s1:String, s2:String) -> Bool in
//    return s1 > s2
//})
//print(sortedName1)

// 推断类型版本
//let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
//let sortedName = names.sorted(by: {(s1, s2) -> Bool in
//    return s1 > s2
//})
//print(sortedName)

// 单一表达式直接省略return
//let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
//let sortedName = names.sorted(by: {(s1, s2) -> Bool in
//    s1 > s2
//})
//print(sortedName)

// 省略参数
//let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
//let sortedName = names.sorted(by: {$0 > $1})
//print(sortedName)

// 最简模式
//let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
//let sortedName = names.sorted(by: >)
//print(sortedName)

// 尾随背包
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
////// 闭包和函数都是引用类型
//let anotherIncrementByTen = increamentByTen;
//print(anotherIncrementByTen())

/**
 逃逸闭包和自动闭包
 */

// 延迟执行
//var names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
//let customerProvider = {names.remove(at: 0)} // 只是定义不会执行
//print(names)
//print(customerProvider()) // 调用才会执行
//print(names)

// 逃逸闭包(这个函数调用结束后再调用的，可逃逸的)
//var providers:[()->String] = []
//func collectCustormerProviders(provider: @escaping () -> String) {
//    providers.append(provider)
//}

// 自动闭包 延迟执行
//var providers:[()->String] = []
//func collectCustormerProviders(provider: @autoclosure @escaping () -> String) { // 使用@autoclosure修饰为自动闭包
//    providers.append(provider)
//}
//var names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
//collectCustormerProviders(provider: names.remove(at: 0)) // 修饰为自动闭包后，传入的闭包无需使用功能大括号包裹，就像传入字符串一样
//collectCustormerProviders(provider: names.remove(at: 0))
//print(names)
//for provider in providers {
//    print(provider())
//    //print(provider())
//}
//print(names)

// 在类中使用逃逸闭包
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

// map filter reduce
//var numbers = [1, 2, 4, 5, 10]
//print(numbers.map{$0 * 10})
//print(numbers.filter({$0 > 4}))
//print(numbers.reduce(100, {$0 + $1}))

// flatMap
//var numbersArray = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
//print(numbersArray.flatMap{$0.map{$0 * 10}})

// compactMap
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
        let locker = NSLock()
        DispatchQueue.concurrentPerform(iterations: n) {(i) in
            locker.lock()
            result.append(transform(self[i]))
            locker.unlock()
        }
        return result
    }
}

let result1 = employee.filter{$0.count > 1}.concurrentMap{$0.capitalized}.joined(separator:",")
print(result1)


/**
 函数式编程3
 */
//let str = "Hello World"
////let str = "Hbllb, Wbld"
//let chars = ["a", "e", "i", "o", "u"]
//
//func findFirstIndex(_ str: String) -> (Int, String) {
//    var index: Int = 0
//    for s in str {
//        if chars.contains(String(s)) {
//            return (index, String(s))
//        }
//        index += 1
//    }
//    return (-1, "NotFound")
//}
//
//print(findFirstIndex(str))
//
//zip(str, 0..<str.count).map { (char, index) in
//    if chars.contains(String(char)) {
//        print(index)
//    }
//}
//
//let source1 = "Hello world"
//let target1: [Character] = ["a","e","i","o","u"]
//zip(0..<source1.count, source1).forEach { (index, char) in
//    if target1.contains(char) {
//        print(index)
//    }
//}

// zip函数
//let titles: [String] = ["1", "2", "3", "4", "5"]
//let images: [String] = ["image1", "image2","image3","image4","image5"]
//
//struct ViewModel {
//    var title: String
//    var image: String
//}
//
//let viewModels = zip(titles, images).map(ViewModel.init)
//print(viewModels)


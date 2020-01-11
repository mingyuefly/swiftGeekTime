import UIKit

var str = "Hello, playground"
//print(str)

/**
 创建数组的N种方式
 */

//// 第一种  字面量式声明
////let array = []//报错，声明空数组必须要指定类型
////let array:Array<Int> = [1, 2, 3, 4]
////let array = [1, 2, 3, 4]
////print(array)
//
//var array = [1, 2, 3, 4]
//print(array)
//array = []//类型推断没问题
//print(array)
//array.append(2)
//print(array)
//
//// 第二种  初始化器
//let fiveZs = Array(repeating: "z", count: 5)
//print(fiveZs)
//
//let chars = Array("hello")
//print(chars)
//
//// 第三种  序列创始
//let numbers = Array(1...9)
//print(numbers)
//
//// 第四种  使用字典的某些特性
//let persons = ["zhangsan":13, "lisi":14, "wangwu":16]
//let names = Array(persons.keys)
//print(names)

/**
 遍历和索引
 */

//// forEach
////let numbers = Array(2...7)
////numbers.forEach { (num) in
////    if num == 3 {
////        //break//报错，break只能用在loop或switch中
////        //continue//同样报错
////        return//只跳出3，其他照常打印
////    }
////    print(num)
////}
//
//// enumerated 几乎等同与下边用索引遍历
////let numbers = Array(2...7)
////for (index, num) in numbers.enumerated() {
////    print("the index is \(index)")
////    print(num)
////}
////
////for i in 0..<numbers.count {
////    print("the index is \(i)")
////    print(numbers[i ])
////}
//
//// Iterator
////let numbers = Array(2...7)
////var it = numbers.makeIterator()
////while let num = it.next() {
////    print(num)
////}
//
//// 使用索引区间遍历
//let numbers = Array(2...7)
//for i in numbers.indices {
//    print("the index is \(i)")
//    print(numbers[i])
//}


/**
 查找操作
 */

////let array = [20, 45, 30, 98, 101, 30, 4]
////print(array.contains(30))
////print(array.contains(where:{$0 > 10}))a
////print(array.contains(where: {$0 < 3}))
////print(array.allSatisfy({$0 > 10}))
//
////let array = [20, 45, 30, 98, 101, 30, 4]
//////let array:Array<Int> = []//都打印nil
////print(array.first)
////print(array.last)
////print(array.first(where: {$0 > 25}))
////print(array.last(where: {$0 > 25}))
//
////let array = [20, 45, 30, 98, 101, 30, 4]
//////print(array.firstIndex(of: 9) ?? -1)
////print(array.firstIndex(of: 9))//打印nil
////print(array.lastIndex(of: 30))
////print(array.firstIndex(where: {$0 > 25}))
////print(array.lastIndex(where: {$0 > 25}))
//
//let array = [20, 45, 30, 98, 101, 30, 4]
//print(array.min())
//print(array.max())
//
//let errors = [(12, "d"), (23, "a"), (45, "c")]
//print(errors.min(by: { (a, b) -> Bool in
//    a.0 < b.0
//}))
//
//print(errors.min(by: { (a, b) -> Bool in
//    a.1 < b.1
//}))
//
//print(errors.max(by: { (a, b) -> Bool in
//    a.0 < b.0
//}))
//
//print(errors.max(by: { (a, b) -> Bool in
//    a.1 < b.1
//}))

/**
 添加和删除元素
 */

//// 尾部添加
////var numbers = [Int](2...7)
////numbers.append(100)
////print(numbers)
////numbers.append(contentsOf: 200...203)
////print(numbers)
//
//// insert中间插入
////var numbers = [Int](2...7)
////numbers.insert(-1, at: 1)
////print(numbers)
////numbers.insert(contentsOf: 100...105, at: 1)
////print(numbers)
//
//// 移除操作
////var numbers = [Int](2...7)
////let removeNum = numbers.remove(at: 1)
////print(removeNum)
////print(numbers)
//
////var numbers = [Int](2...7)
////let num = numbers.removeFirst()
////print(num)
////print(numbers)
//
////var numbers = [Int](2...7)
////let num = numbers.removeLast()
////print(num)
////print(numbers)
//
////var numbers = [Int](2...7)
////numbers.removeSubrange(1...3)
////print(numbers)
//
////var numbers = [Int](2...7)
//////numbers.removeAll()
////numbers.removeAll(keepingCapacity: true)
////print(numbers)
////print(numbers.capacity)
//
//var numbers = [Int](2...7)
//numbers.removeLast(2)
//print(numbers)
//numbers.removeFirst(2)
//print(numbers)


/**
 数组切片
 */
////drop
////var numbers = [2, 10, 15, 25, 100, 46, 99]
////var slice = numbers.dropFirst()
////print(slice)
//////var numbers2:[Int] = slice//报错，不能把ArraySlice转化为Array
//
////var numbers = [2, 10, 15, 25, 100, 46, 99]
////var slice = numbers.dropFirst(3)
////print(slice)
//
////var numbers = [2, 10, 15, 25, 100, 46, 99]
////var slice = numbers.drop(while: {$0 < 50})
////print(slice) // 输出日志[100, 46, 99]由于100在46之前，所以46没有被切除
//
//// prefix
////var numbers = [2, 10, 15, 25, 100, 46, 99]
//////var slice = numbers.prefix(4)
//////var slice = numbers.prefix(upTo: 4)
//////var slice = numbers.prefix(through: 4)
////var slice = numbers.prefix(while: {$0 < 50})
////print(slice)
//
//// suffix
////var numbers = [2, 10, 15, 25, 100, 46, 99]
//////let slice = numbers.suffix(3)
////let slice = numbers.suffix(from: 5)
////print(slice)
//
//// 区间切片
////var numbers = [2, 10, 15, 25, 100, 46, 99]
//////var slice = numbers[2...5]
//////var slice = numbers[2..<5]
//////var slice = numbers[2...]
////var slice = numbers[...]
////print(slice)
//////var numbers2:[Int] = slice//报错，验证是slice
//
//// numbers 和 slice相互独立
//var numbers = [2, 10, 15, 25, 100, 46, 99]
//var slice = numbers[...]
//numbers.append(333)
//print(slice)
//slice.append(555)
//print(numbers)
//
//// 将slice转化成Array方式，使用初始化器
//var numbers2:[Int] = Array(slice)
//print(numbers2)

/**
 数组重排
 */

//// 随机
////var array = [Int](0...8)
//////array.shuffle()
////let array2 = array.shuffled()
////print(array)
////print(array2)
//
//// 逆序
////var array = [Int](0...8)
//////array.reverse()
////let array2 = array.reversed()
////print(array)
////print(array2)
////for i in array2 {
////    print(i)
////}
//
//// 分组
////var numbers = [10, 2, 25, 30, 46, 57, 101, 30, 70]
////let index = numbers.partition(by: {$0 > 30}) //不稳定
////print(numbers)
////print(index)
////let p1 = numbers[..<5]
////let p2 = numbers[5...]
////print(p1)
////print(p2)
//
//// 排序
////var numbers = [10, 2, 25, 30, 46, 57, 101, 30, 70]
//////numbers.sort()// 不稳定排序
////let numbers2 = numbers.sorted()
////print(numbers)
////print(numbers2)
//
////交换
//var numbers = [10, 2, 25, 30, 46, 57, 101, 30, 70]
//numbers.swapAt(numbers.startIndex, numbers.endIndex - 1)
//print(numbers)



/**
 数组拼接
 */

//// join拼接
////let array = ["hello", "world"]
////print(array.joined())
////print(array.joined(separator: ","))
//
//// range 拼接
////let ranges = [0...3, 5...7, 15...16]
////for range in ranges {
////    print(range)
////}
////
////for i in ranges.joined() {
////    print(i)
////}
//
////
//
//let nestedArray = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
//let result = nestedArray.joined(separator: [-1, -2])
//print(result)
//print(Array(result))
//
//// tuple数组拼接
//let errors = [(1, "error1"), (2, "error2")]
////print(errors.j)//必须是sequence数组才能使用joined方法拼接

/**
 数组底层
 */

/**
 数组实现栈和队列
 */

//struct Stack<T> {
//    private var elements = [T]()
//    var count:Int {
//        return elements.count
//    }
//    var isEmpty:Bool {
//        return elements.isEmpty
//    }
//    mutating func push(_ element:T) {
//        elements.append(element)
//    }
//    mutating func pop() -> T? {
//        elements.popLast()
//    }
//}
//
//var stack = Stack<Int>()
//stack.push(1)
//stack.push(2)
//stack.push(3)
//print(stack.count)
//print(stack.pop() ?? 0)
//print(stack.count)
//
//struct Queue<T> {
//    private var elements = [T]()
//    var count:Int {
//        return elements.count
//    }
//    var isEmpty:Bool {
//        return elements.isEmpty
//    }
//    mutating func enqueue(_ element:T) {
//        elements.append(element)
//    }
//    mutating func dequeue() -> T? {
//        return isEmpty ? nil : elements.removeFirst()
//    }
//}
//
//var queue = Queue<Int>()
//queue.enqueue(1)
//queue.enqueue(6)
//queue.enqueue(8)
//print(queue.count)
//print(queue.dequeue() ?? 0)
//print(queue.count)

/**
 Set 的定义和创建
 */

//let course:Set = ["Math", "English", "History"]
//print(course)
//
//var chars = Set<Character>()
//chars.insert("a")
//print(chars)
//
//struct Person {
//    var name:String
//    var age:Int
//}
//extension Person:Hashable {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(age)
//        hasher.combine(name)
//    }
//}
//
//let persons:Set<Person> = [Person(name: "zhangsan", age: 20)]
//print(persons)


/**
 Set 访问和修改
 */

////let course:Set = ["Math", "English", "History"]
////for c in course {
////    print(c)
////}
////for c in course.sorted() {
////    print(c)
////}
//
//struct Person {
//    var name:String
//    var age:Int
//}
//extension Person:Hashable {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//        //hasher.combine(age)
//    }
//}
//extension Person:Equatable {
//    static func == (lth:Person, rth:Person) -> Bool {
//        return lth.name == rth.name
//    }
//}
//
//var personSet:Set<Person> = [Person(name: "zhangsan", age: 20), Person(name: "lisi", age: 29)]
//print(personSet)
//personSet.update(with: Person(name: "zhangsan", age: 35))
//personSet.update(with: Person(name: "wangwu", age: 18))
//print(personSet)
//
////let person = personSet.removeFirst()
////let person = personSet.remove(Person(name: "zhangsan", age: 33))
////print(person)
////print(personSet)
//
//print(personSet.filter({$0.age > 20}))

/**
 基本set操作，计算和判断
 */

////let a:Set<Character> = ["A", "B", "C"]
////let b:Set<Character> = ["B", "E", "F", "G"]
////print(a.intersection(b))
////print(a.union(b))
////print(a.symmetricDifference(b))
////print(a.subtracting(b))
//
//let a:Set<Character> = ["A", "B", "C"]
////let b:Set<Character> = ["A", "B", "C", "D"]
////let b:Set<Character> = ["A", "B", "C"]
//let b:Set<Character> = ["E"]
//print(a.isSubset(of: b))
//print(a.isStrictSubset(of: b))
//print(a.isDisjoint(with: b))// 有公共元素返回false


/**
 用set实现算法
 */

//// 方法1，运用位运算 ，优点使用简单，缺点：let count = 1 << set.count 使得count位有限制，假如count是Int, set就不能多于64个元素
////func getSubsets<T>(set:Set<T>) -> Array<Set<T>> {
////    let count = 1 << set.count
////    let elements = Array(set)
////    var subsets = [Set<T>]()
////    for i in 0..<count {
////        var subset = Set<T>()
////        for j in 0..<elements.count {
////            if ((i >> j) & 1) == 1 {
////                subset.insert(elements[j])
////            }
////        }
////        subsets.append(subset)
////    }
////    return subsets
////}
////
////let set:Set = ["A", "B", "C"]
////let subsets = getSubsets(set: set)
////for subset in subsets {
////    print(subset)
////}
//
//// 方法2，运用递归
//func getSubsets2<T>(_ set: Set<T>) -> Array<Set<T>> {
//    let elements = Array(set)
//    return getSubsets3(elements, index: elements.count - 1, count: elements.count)
//}
//
//func getSubsets3<T>(_ elements:Array<T>, index:Int, count:Int) -> Array<Set<T>>{
//    var subsets = Array<Set<T>>()
//    if index == 0 {
//        subsets.append(Set<T>())
//        var subSet = Set<T>()
//        subSet.insert(elements[0])
//        subsets.append(subSet)
//        return subsets
//    }
//    subsets = getSubsets3(elements, index: index - 1, count: count)
//    for subset in subsets {
//        var subsetWithCurrent = Set(subset)
//        subsetWithCurrent.insert(elements[index])
//        subsets.append(subsetWithCurrent)
//    }
//    return subsets
//}
//
//let set:Set = ["A", "B", "C"]
//let subsets = getSubsets2(set )
//for subset in subsets {
//    print(subset)
//}

/**
 底层实现
 */

/**
 字典类型
 */

//// 修改键值对
////var personDict = ["zhangsan":18, "lisi":19, "wangwu":20]
////personDict["zhaoliu"] = 21
////print(personDict)
////personDict["zhangsan"] = 33
////print(personDict)
////personDict["zhangsan"] = nil
////print(personDict)
//
//struct Person {
//    var name:String
//    var age:Int
//}
//extension Person:Hashable {
//    func hash(into hasher: inout Hasher) {
//        //hasher.combine(age)
//        hasher.combine(name)
//    }
//}
//extension Person:Equatable {
//    static func == (lth:Person, rth:Person) -> Bool {
//        return lth.name == rth.name
//    }
//}
//
//// 使用遵守Hashable协议的结构体为键值
//var personDict = [Person(name: "zhangsan", age: 18):3000, Person(name: "lisi", age: 25):8000]
//personDict.updateValue(5000, forKey: Person(name: "zhangsan", age: 23))
////personDict[Person(name: "zhangsan", age: 23)] = 5000
//print(personDict)

// merge方法
//var dict = ["a":1, "b":2]
//
//print(dict.merging(["a":2, "c":5], uniquingKeysWith: { (current, _) -> Int in
//    current
//}))
//
//print(dict.merging(["a":10, "d":11], uniquingKeysWith: { (_, new) -> Int in
//    new
//}))
//
//var dict1 = dict.merging(["a":2, "c":5], uniquingKeysWith: { (current, _) -> Int in
//    current
//})
//print(dict1)
//
//var dict2 = dict.merging(["a":10, "d":11], uniquingKeysWith: { (_, new) -> Int in
//    new
//})
//print(dict2)
//print(dict)
//
//dict.merge(["a":2, "c":5], uniquingKeysWith: { (current, _) -> Int in
//    current
//})
//print(dict)
//dict.merge(["a":10, "d":11], uniquingKeysWith: { (_, new) -> Int in
//    new
//})
//print(dict)

// first index
//var dict = ["a":1, "b":2]
//let index = dict.firstIndex { (_,  value) -> Bool in
//    value == 1
//}
//
//print(index)
//if let i =  index {
//    print(dict[i].value)
//}
//
//
////dict["c"] = 6
////dict["d"] = 6
////dict["e"] = 6
////dict["f"] = 6
////dict["g"] = 6
////dict["h"] = 6
////dict["i"] = 6
////dict["j"] = 6
////
////print(index)
////if let i =  index {
////    print(dict[i].value)//扩容后报错
////}
//
//dict["c"] = 6
//print(index)
//if let i =  index {
//    print(dict[i].value)//未扩容
//}

//KeyValuePairs保持插入顺序
let kvs:KeyValuePairs = ["a":1, "b":2, "c":3]
print(kvs)

let kvs1 = ["a":1, "b":2, "c":3]
print(kvs1)

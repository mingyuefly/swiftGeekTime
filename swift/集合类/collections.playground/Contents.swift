import Cocoa

var greeting = "Hello, playground"

// 数组
/// MARK：数组创建
// 1，字面量创建
let array = [1, 2, 3, 4 ,5]
print(array)

var array1:[Int] = []

// 2, 初始化器创建
var myArray = [String]()
var myArray1 = Array<String>()

// 3，初始化器参数
let fiveZs = Array(repeating: "z", count: 5)
print(fiveZs)
let numbers = [Int](0...7)
print(numbers)
let persons = ["zhangsan": 27, "lisi": 28, "wangwu": 29]
let names = [String](persons.keys)
print(names)
let chars = Array("hello")
print(chars)

/// MARK：数组遍历
// 1，for in
let numbers1 = [Int](0...7)

for i in 0..<numbers1.count {
    print(2 * numbers1[i])
}

// 2，forEach
// 无法使用break或continue跳出当前循环
// 使用return只能跳出当前循环体 相当于continue

numbers1.forEach { num in
    if num == 3 {
        return
//        break
    }
    print(num)
}

// 3,enumerated
for (index, num) in numbers1.enumerated() {
    print("index: " + String(index) + " num: " + String(num))
}

// 4,Iterator
var numIterator = numbers1.makeIterator()
while let num = numIterator.next() {
    print(num * 10)
}


/// MARK：数组索引
/// 1，startIndex返回0，endIndex返回count，空的时候都为0
/// 2，range

let numbers2 = [Int](2...7)
for i in numbers2.indices {
    print(numbers2[i] * 5)
}

/// MARK：数组查找元素
///
let array2 = [10, 20, 45, 30, 98, 101, 30, 4]
print(array2.contains(30))
print(array2.contains(where: { a in
    a < 3
}))
print(array2.contains(where: {$0 > 10}))

print(array2.allSatisfy({$0 > 10}))
print(array2.allSatisfy({$0 > 3}))

/// 可以在空数组中调用，但必须指定类型
print(array2.first)
print(array2.last)

print(array2.first(where: {$0 > 10}))
print(array2.last(where: {$0 > 10}))

print(array2.firstIndex(of: 9))
print(array2.lastIndex(of: 30))
print(array2.firstIndex(where: {$0 > 25}))
print(array2.lastIndex(where: {$0 > 25}))

print(array2.min())
print(array2.max())

let errors = [(12, "error12"), (23, "error23"), (45, "error45")]
print(errors.min(by: { (a, b) -> Bool in
    a.0 < b.0
}))
print(errors.max(by: { (a, b) -> Bool in
    a.0 < b.0
}))
let errors1 = [(12, "b"), (23, "a"), (45, "c")]
print(errors1.min(by: { (a, b) -> Bool in
    a.1 < b.1
}))
print(errors1.max(by: { (a, b) -> Bool in
    a.1 < b.1
}))

/// MARK：数组添加、插入和移除元素
///
var numbers3 = [Int](2...7)

/// append
///
//numbers3.append(100)
//print(numbers3)
//numbers3.append(contentsOf: 200...203)
//print(numbers3)

/// insert
///
//numbers3.insert(-1, at: 1)
//print(numbers3)
//numbers3.insert(contentsOf: 100...105, at: 1)
//print(numbers3)

/// remove
/// 不能在空数组中调用removeFirst和removeLast，可以使用popFirst和popLast
//let removeNum = numbers3.remove(at: 1)
//print(removeNum)
//print(numbers3)

//let num = numbers3.removeFirst()
//print(num)
//print(numbers3)

//let num = numbers3.removeLast()
//print(num)
//print(numbers3)

//numbers3.removeSubrange(1...3)
//print(numbers3)

//numbers3.removeAll()
////numbers3.removeAll(keepingCapacity: true)
//print(numbers3)
//print(numbers3.capacity)

//numbers3.removeFirst(2)
//print(numbers3)

numbers3.removeLast(2)
print(numbers3)

/// 数组切片
/// slice和原array共享内存，但操作独立，不会彼此影响，不能直接把slice赋值给一个array
///
var numbers4 = [2, 10, 15, 25, 100, 46, 99]

/// drop
//var slice = numbers4.dropFirst()
////var nums4[Int] = slice
//print(slice)

//var slice = numbers4.drop(while: {$0 < 50})
//print(slice) //[100, 46, 99] 到100时停止，包含46

/// prefix
//var slice = numbers4.prefix(4)
//print(slice)

//var slice = numbers4.prefix(upTo: 4)
//print(slice) //[2, 10, 15, 25]
//var slice = numbers4.prefix(through: 4)
//print(slice) // [2, 10, 15, 25, 100]
//var slice = numbers4.prefix(while: {$0 < 50})
//print(slice)

/// suffix
//var slice = numbers4.suffix(3)
//print(slice)
//var slice = numbers4.suffix(from: 5)
//print(slice)

/// range
//var slice = numbers4[..<5]
//print(slice)
var slice = numbers4[...] // 和元素组相等
print(slice)

/// slice 和 array互不影响
numbers4.append(333)
print(slice)
slice.append(555)
print(numbers4)

/// 使用构造器将slice转化为数组
var nums4: [Int] = Array(slice)
print(nums4)

/// 数组重排操作
///
/// 乱序
var array3 = [Int](1...8)
//print(array3.shuffled())
//print(array3)
//array3.shuffle()
//print(array3)

/// 逆序
//let array3Reverse = array3.reversed() // 和array3共享内存，只是迭代器有一个逆序效果
//print(array3Reverse)
//array3Reverse.forEach { num in
//    print(num)
//}
//print(array3)
//array3.reverse()
//print(array3)

/// partition
var numbers5 = [10, 2, 25, 30, 46, 57, 101, 30, 70]
//let index = numbers5.partition(by: {$0 > 30})
//print(numbers5) // [10, 2, 25, 30, 30, 57, 101, 46, 70]操作不稳定
//print(index)
//print(numbers5)
//let p1 = numbers5[..<index]
//let p2 = numbers5[index...]
//print(p1)
//print(p2)

/// 排序
//print(numbers5.sorted())
//print(numbers5)
//numbers5.sort()
//print(numbers5)

/// 交换
numbers5.swapAt(numbers5.startIndex, numbers5.endIndex - 1)
print(numbers5)

/// 拼接操作
///
//let array4 = ["hello", "world"]
//print(array4.joined())
//print(array4.joined(separator: ","))

//let ranges = [0...3, 5...7, 15...16]
//for range in ranges {
//    print(range)
//}
//
//for range in ranges.joined() {
//    print(range)
//}
//
//let nestedArray = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
//let result = nestedArray.joined(separator: [-1, -2])
//print(result)
//print(Array(result))

/// stack and queue
struct Stack<T> {
    private var myElements = [T]()
    var count: Int {
        return myElements.count
    }
    var isEmpty: Bool {
        return myElements.isEmpty
    }
    mutating func push(_ element: T) {
        myElements.append(element)
    }
    mutating func pop() -> T? {
        myElements.popLast()
    }
}

//extension Stack: Sequence {
//    /// 初始化循环迭代器
//    /// - AnyIterator<T>: 一个泛型IteratorProtocol基类型，并且它内部有一个next()方法，
//    ///   这样就不用自己去实现ArrayIterator类型的结构体了；
//    /// - IndexingIterator: 它是所有集合默认的迭代器，无需自己动手实现，其工作方式是通过下
//    ///   标来遍历集合中的每一个元素的；
//    /// - returns：返回一个基本的迭代器
//    public func makeIterator() -> AnyIterator<T> {
//        return AnyIterator(IndexingIterator(_elements: myElements.lazy.reversed()))
//    }
//}

struct ArrayIterator<T>: IteratorProtocol {
    var currentElement: [T]
    typealias Element = T
    mutating func next() -> T? {
        if (!currentElement.isEmpty) {
            return currentElement.popLast()
        }
        return nil
    }
}

extension Stack: Sequence {
    public func makeIterator() -> ArrayIterator<T> {
        return ArrayIterator<T>(currentElement: myElements)
    }
}

extension Stack: CustomStringConvertible, CustomDebugStringConvertible {
    /// 在打印栈及其元素时，输出简洁漂亮的格式
    /// 如果不实现这些代码，打印栈的结果为：ArrayStack<Int>(elements: [5, 44, 23])
    /// 实现下面这些代码之后，打印栈的结果为：[5, 44, 23]
    /// - returns: 返回栈及其元素的文本表示
    public var description: String {
        return myElements.description
    }

    /// 打印时输出简洁漂亮的格式，主要用于调试
    /// - returns: 返回栈及其元素的文本表示，适用于调试
    public var debugDescription: String {
        return myElements.debugDescription
    }
}

var stack = Stack<Int>()
stack.push(1)
stack.push(5)
stack.push(9)
for i in stack {
    print(i)
}

print(stack)
print(stack.count)
print(stack.pop() ?? 0)
print(stack.count)

struct Queue<T> {
    private var myElements = [T]()
    var count: Int {
        return myElements.count
    }
    var isEmpty: Bool {
        return myElements.isEmpty
    }
    mutating func enqueue(_ element: T) {
        myElements.append(element)
    }
    mutating func dequeue() -> T? {
        return myElements.removeFirst()
    }
}

extension Queue: Sequence {
    /// 初始化循环迭代器
    /// - AnyIterator<T>: 一个泛型IteratorProtocol基类型，并且它内部有一个next()方法，
    ///   这样就不用自己去实现ArrayIterator类型的结构体了；
    /// - IndexingIterator: 它是所有集合默认的迭代器，无需自己动手实现，其工作方式是通过下
    ///   标来遍历集合中的每一个元素的；
    /// - returns：返回一个基本的迭代器
    public func makeIterator() -> AnyIterator<T> {
        return AnyIterator(IndexingIterator(_elements: myElements))
    }
}

var queue = Queue<Int>()
queue.enqueue(7)
queue.enqueue(6)
queue.enqueue(8)
for i in queue {
    print(i)
}

print(queue.count)
print(queue.dequeue() ?? 0)
print(queue.count)

        

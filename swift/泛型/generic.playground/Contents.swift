import UIKit

var str = "Hello, playground"

/**
 泛型函数
 */

//func swapTwoValues<T>(_ a:inout T, _ b:inout T) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
//var c = 5, d = 6
//swapTwoValues(&c, &d)
//print("c = \(c), d = \(d)")


/**
 泛型类型
 */

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item:Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
print(stackOfStrings.pop())
print(stackOfStrings.pop())

/**
 类型约束
 */
//func firstIndex<T:Equatable>(of valueToFind:T, in array:[T]) -> Int? {
//    for (index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}
//
//let names = ["zhangsan", "lisi", "wangwu"]
//print(firstIndex(of: "lisi", in: names))
//let nums = [3, 5, 7]
//print(firstIndex(of: 7, in: nums))


/**
 协议关联类型
 */

//protocol Container {
//    associatedtype ItemType
//    //associatedtype ItemType:Equatable//可以增加类型约束
//
//    mutating func append(_ item:ItemType)
//    var count:Int { get }
//    subscript(i:Int) -> ItemType{get}
//}
//
//protocol SuffixableContainer:Container {
//    associatedtype Suffix:SuffixableContainer where Suffix.ItemType == ItemType
//}
//
//struct IntStack: Container {
//    var items = [Int]()
//    //typealias ItemType = Int//得益于swift的类型推断，这行可以省略
//    mutating func append(_ item: Int) {
//        items.append(item)
//    }
//    var count:Int {
//        return items.count
//    }
//    subscript(i: Int) -> Int {
//        return items[i]
//    }
//}
//
//var intStack = IntStack()
//intStack.append(1)
//intStack.append(2)
//print(intStack.count)
//print(intStack[0])


/**
 泛型   where子句
 */
//protocol Container {
//    associatedtype ItemType
//    //associatedtype ItemType:Equatable//可以增加类型约束
//
//    mutating func append(_ item:ItemType)
//    var count:Int { get }
//    subscript(i:Int) -> ItemType{get}
//}
//
//func allItemsMatch<C1:Container, C2:Container>(container:C1, anotherContainer:C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType:Equatable {
//    if container.count != anotherContainer.count {
//        return false
//    }
//    for i in 0..<container.count {
//        if container[i] != anotherContainer[i] {
//            return false
//        }
//    }
//    return true
//}

/**
 泛型下标
 */

//protocol Container {
//    associatedtype ItemType
//    //associatedtype ItemType:Equatable//可以增加类型约束
//
//    mutating func append(_ item:ItemType)
//    var count:Int { get }
//    subscript(i:Int) -> ItemType{get}
//}
//
//struct IntStack: Container {
//    var items = [Int]()
//    //typealias ItemType = Int//得益于swift的类型推断，这行可以省略
//    mutating func append(_ item: Int) {
//        items.append(item)
//    }
//    var count:Int {
//        return items.count
//    }
//    subscript(i: Int) -> Int {
//        return items[i]
//    }
//}
//
//var intStack = IntStack()
//intStack.append(1)
//intStack.append(2)
//print(intStack.count)
//print(intStack[0]);
//
//extension Container {
//    subscript<Indices:Sequence>(indices:Indices) -> [ItemType] where Indices.Iterator.Element == Int {
//        var result = [ItemType]()
//        for index in indices {
//            result.append(self[index])
//        }
//        return result
//    }
//}
//
//print(intStack[[0, 1]])

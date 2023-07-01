import Cocoa

//var greeting = "Hello, playground"
//print(greeting)

/**
 Dictionary
 */

/// 创建
/// 1，初始化器
/// 2，简写方式
/// 3，字面量方式
/// 创建时要指定型别，无法自动推断

var dict1 = Dictionary<String, Int>()
var dict2 = [String: Int]()
var dict3: Dictionary<String, Int> = [:]
var dict4 = ["zhangsan": 18, "lisi": 19, "wangwu": 20]
print(dict4)

/// 遍历字典
for (key, value) in dict4 {
    print("name: \(key) age:\(value)")
}

for key in dict4.keys.sorted() {
    print(key)
}

var dictIterator = dict4.keys.makeIterator()
while let key = dictIterator.next() {
    print("name: \(key) age:\(String(describing: dict4[key]))")
}

/// 字典操作
var personDict = ["zhangsan": 18, "lisi": 19, "wangwu": 20]
// 添加
//personDict["zhaoliu"] = 22
//print(personDict)

// 修改
personDict["zhangsan"] = 33
print(personDict)

// 删除
personDict["zhangsan"] = nil
print(personDict)

// update
struct Person {
    var name: String
    var age: Int
}

extension Person: Hashable {
    func hash(into hasher: inout Hasher) {
//        hasher.combine(age)
        hasher.combine(name)
    }
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
}

var personDict1 = [Person(name: "zhangsan", age: 18): 3000, Person(name: "lisi", age: 25): 8000]
personDict1.updateValue(5000, forKey: Person(name: "zhangsan", age: 25))
print(personDict1)

// merge
var dict5 = ["a": 1, "b": 2]
// 保持原字典中键值对
print(dict5.merging(["a": 3, "c": 5], uniquingKeysWith: { current, _ in
    current
})) //["b": 2, "a": 1, "c": 5]
// 保留新字典中的键值对
print(dict5.merging(["a": 10, "d": 11], uniquingKeysWith: { _, new in
    new
})) // ["b": 2, "a": 10, "d": 11]
// 查找
let index = dict5.firstIndex { (key: String, value: Int) in
    value == 1
}
//print(index)

dict5["c"] = 5
//dict5["d"] = 6
//dict5["e"] = 7
//dict5["f"] = 8
//dict5["g"] = 9
//dict5["h"] = 10
//dict5["i"] = 11

// 扩容后使用不能再直接使用index
if let index = index {
    print(dict5[index])
}

/// KeyValuePairs保持顺序
let kvs: KeyValuePairs = ["a": 1, "b": 2, "c": 3]
print(kvs)
let kvs1 = ["b": 1, "a": 2, "c": 3]
print(kvs)


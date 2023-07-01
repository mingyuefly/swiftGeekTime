import Cocoa

var greeting = "Hello, playground"
print(greeting)

/**
 set
 */
/// 创建set
/// 1，可以使用初始化器
/// 2，可以使用字面量，但要指明是Set类型，否则默认是数组类型
/// 3，自定义类型要实现Hashable协议

let courses: Set<String> = ["maths", "English", "History", "draw"]
print(courses)

var chars = Set<Character>()
chars.insert("a")
print(chars)

struct Person {
    var name: String
    var age: Int
}

//extension Person: Hashable {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(age)
//        hasher.combine(name)
//    }
//}
//
//let persons: Set<Person> = [Person(name: "zhangsan", age: 20)]
//print(persons)

/// 访问和修改set
///
for course in courses {
    print(course)
}

for course in courses.sorted() {
    print(course)
}

extension Person: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(age)
        hasher.combine(name)
    }
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
}

var personSet: Set<Person> = [Person(name: "zhangsan", age: 20), Person(name: "lisi", age: 29)]
personSet.update(with: Person(name: "zhangsan", age: 35))
print(personSet)
personSet.update(with: Person(name: "wangwu", age: 18))
print(personSet)

//let person = personSet.removeFirst()
//print(person)
//print(personSet)

//let person = personSet.remove(Person(name: "zhangsan", age: 33))
//print(person)
//print(personSet)

print(personSet.filter({$0.age > 20}))

/// 计算和判断
let set1: Set<Character> = ["A", "B", "C"]
let set2: Set<Character> = ["B", "E", "F", "G"]
print(set1.intersection(set2))
print(set1.union(set2))
print(set1.symmetricDifference(set2))
print(set1.subtracting(set2))

let smallSet: Set = [1, 2, 3]
let bigSet: Set = [1, 2, 3, 4]
print(smallSet.isSubset(of: bigSet))
print(bigSet.isSuperset(of: smallSet))
print(smallSet.isStrictSubset(of: bigSet))
print(bigSet.isStrictSuperset(of: smallSet))
print(smallSet.isDisjoint(with: bigSet))

//let a: Set<Character> = ["a", "b", "c"]
//let b: Set<Character> = ["b", "e", "f", "g"]
//print(a.intersection(b))
//print(a.union(b))
//print(a.symmetricDifference(b))
//print(a.subtracting(b))
//print(b.subtracting(a))

//let a: Set<Character> = ["a", "b", "c"]
//let b: Set<Character> = ["b", "a", "c"]
//print(a.isSubset(of: b))
//print(a.isStrictSubset(of: b))

let a: Set<Character> = ["a", "b", "c"]
let b: Set<Character> = ["e"]
print(a.isDisjoint(with: b))

/// 获取一个set的所有subsets
///  位运算
func getSubSets<T>(set: Set<T>) -> Array<Set<T>> {
    let count = 1 << set.count
    let eletments = Array(set)
    print(eletments)
    var subSets = Array<Set<T>>()
    for i in 0..<count {
        var subSet = Set<T>()
        for j in 0..<eletments.count {
            if ((i >> j) & 1) == 1 {
                subSet.insert(eletments[j])
            }
        }
        subSets.append(subSet)
    }
    return subSets
}

let set3: Set = ["a", "b", "c"]
for subSet in getSubSets(set: set3) {
    print(subSet)
}

/// 递归
func getSubSets1<T>(set: Set<T>) -> Array<Set<T>> {
    let elements = Array(set)
    print(elements)
    return getSubSets2(elements: elements, index: elements.count - 1, count: elements.count)
}

func getSubSets2<T>(elements: Array<T>, index: Int, count: Int) -> Array<Set<T>> {
    var subSets = Array<Set<T>>()
    if index == 0 {
        subSets.append(Set<T>())
        var subSet = Set<T>()
        subSet.insert(elements[0])
        subSets.append(subSet)
        return subSets
    }
    subSets = getSubSets2(elements: elements, index: index - 1, count: count)
    for subset in subSets {
        var subCurrentSet = Set(subset)
        subCurrentSet.insert(elements[index])
        subSets.append(subCurrentSet)
    }
    return subSets
}

let set4: Set = ["d", "e", "f"]
for subSet in getSubSets1(set: set4) {
    print(subSet)
}

/// 迭代
func getSubSets3<T>(set: Set<T>) -> Array<Set<T>> {
    let elements = Array(set)
    print(elements)
    var subSets = Array<Set<T>>()
    subSets.append(Set<T>())
    var subSet = Set<T>()
    subSet.insert(elements[0])
    subSets.append(subSet)
    for i in 1..<elements.count {
        for subSet in subSets {
            var subCurrentSet = Set(subSet)
            subCurrentSet.insert(elements[i])
            subSets.append(subCurrentSet)
        }
    }
    return subSets
}

let set5: Set = ["g", "h", "i"]
for subSet in getSubSets3(set: set5) {
    print(subSet)
}

/// 动态规划
func getSubSets4<T>(set: Set<T>) -> Array<Set<T>> {
    let elements = Array(set)
    print(elements)
    let count = elements.count
    var subSets = Array<Set<T>>()
    subSets.append(Set<T>())
    var subSet = Set<T>()
    subSet.insert(elements[0])
    subSets.append(subSet)
    
    var subSetsArray = Array<Array<Set<T>>>()
    subSetsArray.append(subSets)
    
    for i in 1..<elements.count {
        var subSets = Array<Set<T>>()
        for subSet in subSetsArray[i - 1] {
            var subCurrentSet = Set(subSet)
            subSets.append(subSet)
            subCurrentSet.insert(elements[i])
            subSets.append(subCurrentSet)
        }
        subSetsArray.append(subSets)
    }
    return subSetsArray[count - 1]
}

let set6: Set = ["j", "k", "l"]
for subSet in getSubSets4(set: set6) {
    print(subSet)
}

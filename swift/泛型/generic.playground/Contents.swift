import UIKit

var str = "Hello, playground"

func firstIndex<T:Equatable>(of valueToFind:T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let names = ["zhangsan", "lisi", "wangwu"]
print(firstIndex(of: "lisi", in: names))
let nums = [3, 5, 7]
print(firstIndex(of: 7, in: nums))

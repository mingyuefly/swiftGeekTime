import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"

/**
 创建线程 thread
 */

//for i in 0..<10 {
//    Thread.detachNewThread {
//        print(i)
//    }
//}
//
//class ObjectThread {
//    func threadTest() {
//        let thread = Thread(target: self, selector: #selector(threadWork), object: nil)
//        thread.start()
//    }
//    @objc func threadWork() {
//        print("threadWork")
//    }
//}
//
//let obj = ObjectThread()
//obj.threadTest()

/**
 Operation
 */

//class ObjectOperation {
//    func test() {
////        let operation = BlockOperation { [weak self] in
////            self?.threadWork()
////        }
//        let operation = MyOperation()
//        operation.completionBlock = { () -> Void in
//            print("completionBlock")
//        }
//
//        let queue = OperationQueue()
//        queue.addOperation(operation)
//    }
//    @objc func threadWork() {
//        print("threadWork")
//    }
//}
//
//class MyOperation:Operation {
//    override func main() {
//        sleep(1)
//        print("in MyOperation main")
//    }
//}
//
//let obj = ObjectOperation()
//obj.test()
//print("after invoke test")

/**
 dispatch
 */

//let queue = DispatchQueue(label: "myQueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
//queue.sync {
//    sleep(1)
//    print("in queue sync")
//}
//queue.async {
//    sleep(2)
//    print("in queue async")
//}
//print("after invoke queue method")
//queue.asyncAfter(deadline: DispatchTime.now() + 1) {
//    print("in asyncAfter")
//}


/**
 dispatchGroup
 */

//let queue = DispatchQueue(label: "myQueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
//let group = DispatchGroup()
//group.enter()
//queue.async {
//    sleep(1)
//    print("接口A数据请求完成")
//    group.leave()
//}
//group.enter()
//queue.async {
//    sleep(1)
//    print("接口B数据请求完成")
//    group.leave()
//}
//print("group enter 调用完成")
////group.wait()
////print("接口A和接口B的数据都已经请求完成")
//group.notify(queue: queue) {
//    print("接口A和接口B的数据都已经请求完成")
//}

/**
 dispatchSource
 */

//let queue = DispatchQueue(label: "myQueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
//var seconds = 10
//let timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
//timer.schedule(deadline: .now(), repeating: 1.0)
//timer.setEventHandler {
//    seconds -= 1
//    if seconds < 0 {
//        timer.cancel()
//    } else {
//        print(seconds)
//    }
//}
//timer.resume()

/**
 safe Array
 */

//let queue = DispatchQueue(label: "myQueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
//let queue2 = DispatchQueue(label: "myQueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
//
//
//var array = Array(0...10000)
//let lock = NSLock()
//
//func getLastItem() -> Int? {
//    //let count = array.count
//    lock.lock()
//    var temp:Int? = nil
//    if array.count > 0 {
//        temp = array[array.count - 1]
//    }
//    lock.unlock()
//    return temp
//}
//
//func removeLastItem() {
//    lock.lock()
//    array.removeLast()
//    lock.unlock()
//}
//
//queue.async {
//    for _ in 0..<10000 {
//        removeLastItem()
//    }
//}
//
//queue2.async {
//    for _ in 0..<10000 {
//        if let item = getLastItem() {
//            print(item)
//        }
//    }
//}
// 加锁的情况下，频繁读很少写的情况下会对性能造成很大损耗

// 改进版
let queue = DispatchQueue(label: "myQueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
let queue2 = DispatchQueue(label: "myQueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
let arrayQueue = DispatchQueue(label: "myQueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)



var array = Array(0...10000)

func getLastItem() -> Int? {
    return arrayQueue.sync { () -> Int in
        if array.count > 0 {
            return array[array.count - 1]
        }
        return -1
    }
}

func removeLastItem() {
    let workItem = DispatchWorkItem(qos: DispatchQoS.default, flags: DispatchWorkItemFlags.barrier) {
        array.removeLast()
    }
    arrayQueue.async(execute: workItem)
}

queue.async {
    for _ in 0..<10000 {
        removeLastItem()
    }
}

queue2.async {
    for _ in 0..<10000 {
        if let item = getLastItem() {
            print(item)
        }
    }
}


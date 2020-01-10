import UIKit
//有1个遗留问题
//https://mp.weixin.qq.com/s/GZl7Cbf1ZG83UFtInEFnyQ

var str = "Hello, playground"

//
// no bad
func updateWithView(view: UIView) {

}
updateWithView(view: UIView())

// better
func updateWith(view: UIView) {

}
updateWith(view: UIView())

func didSelectAtIndex(index: Int) {

}
didSelectAtIndex(index: 2)

func didSelect(at index: Int) {

}
didSelect(at: 3)


enum Event {
    enum Name {
        static let login = "Event.Name.login"
    }
}
print(Event.Name.login)


// no bad
let dict = ["name": "dcj"]
var name: String?

if let temp = dict["name"] {
    name = temp
} else {
    name = ""
}
// better
name = dict["name"] ?? ""
print(name)

guard let new = name else {
    fatalError()
}
print(new)


typealias Pair<T> = (T, T)
let pair = Pair(1, 2)


protocol View {
    associatedtype Model
    func update(model: Model)
}
enum SomeError: Error {
    case rejectError
}

enum State<Value> {
    case pending
    case fullfill(value: Value)
    case reject(reson: Error)
    mutating func update(to state: State) {
        guard case .pending = state else {
            return
        }
        self = state
        
    }
    
}
// 问题：怎么调用下面的方法？
extension State {
    func toString() {
        print("kdkd")
    }
}
var sta = State<Int>.pending
sta.toString()
sta.update(to: .fullfill(value: 2))
sta.update(to: .reject(reson: SomeError.rejectError))

//14. 使用 `` 来定义和关键字重名的方法和属性
//let `default` = "dcj"
func `default`() {
    print("default")
}
`default`()

//15. Strong-Weak Dance 很简单
//func test() { [weak self] in
//
//    guard let self = self else {
//        return
//    }
////     self is strong without retain cycle
//}

//18. 使用闭包做初始化
let someView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.blue
    return view
    
}()

// lazy
struct Person {
    let name: String
    let age: Int
    lazy var per = NSObject()
}


// 问题：where怎么用
//<Value> where Value == String
// https://www.avanderlee.com/swift/where-using-swift/
extension Array where Element == Int {
    func printAverageAge() -> Void {
        let total = reduce(0, +)
        let average = total / count
        print("average age is \(average)")
        
        
    }
    
}

let arr = [20,30, 40, 40,60]
arr.printAverageAge()
arr.compactMap { (some) -> Void in
    print(some)
}
let names = ["Henk", "John", "Jack"]
let firstJName = names.first { (name) -> Bool in
    return name.first == "J"
}
print(firstJName) // Returns John


let fruits = ["Banana", "Apple", "Kiwi"]
let isContainsBanna = fruits.contains { (fruit) -> Bool in
    return fruit == "Banana"
}


//extension String {
//    init(collection: T) where T.Element == String {
//        self = collection.joined(separator: ",")
//    }
//}



protocol SomeProtocol {
    
    // better
    func updateWithView(_ view:UIView)
    
}

struct SomeStruct: SomeProtocol {
    
    func updateWithView(_ view: UIView) {
        print("ldl")
    }
}



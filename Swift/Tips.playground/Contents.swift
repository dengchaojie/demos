import UIKit

var str = "Hello, playground"


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

extension State {
    func toString() {
        print("kdkd")
    }
}


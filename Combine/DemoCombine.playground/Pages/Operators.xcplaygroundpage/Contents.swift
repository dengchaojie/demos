//: [Previous](@previous)

import Foundation

import Combine

/*:
[Previous](@previous)
## Operators
- Operators are functions defined on publisher instances...
- ... each operator returns a new publisher ...
- ... operators can be chained to add processing steps
*/
let p1 = PassthroughSubject<Int, Never>()
let p2 = p1.map({ value in
    value + 100
})

let sub1 = p1.sink(receiveValue: {value in
    print("sub1 receive vlaue: \(value)")
    
})

let sub2 = p2.sink(receiveValue: {value in
    print("sub1 receive vlaue: \(value)")
    
})

p1.send(29)
p1.send(40)

//: [Next](@next)

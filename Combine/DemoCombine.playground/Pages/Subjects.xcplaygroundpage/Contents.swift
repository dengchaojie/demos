//: [Previous](@previous)

import Combine

/*:
 [Previous](@previous)
 ## Subjects
 - A subject is both a subscriber and a publisher ...
- ... relays values it receives from other publishers ...
- ... can be manually fed with new values
 */

let passSub = PassthroughSubject<String, Never>()
passSub.sink(receiveValue: {
    print("\($0)")
    
})

passSub.send("my name is dcj")

let pub = Just("hello, world")
pub.subscribe(passSub)

//: [Next](@next)

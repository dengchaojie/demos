//: [Previous](@previous)

import Foundation

import Combine
/*:
[Previous](@previous)
## Combining Publishers
Combining allows to
- Merge multiple streams into one
- Listen to multiple publishers
*/

let usernameSubject = PassthroughSubject<String, Never>()
let passwordSubject = PassthroughSubject<String, Never>()

Publishers.CombineLatest(usernameSubject, passwordSubject)
.map{ (username, password) -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count > 12 }
.replaceError(with: false)
.sink { (isValid) in
        print(" username and password is valid: \(isValid)") }
            
usernameSubject.send("dcj")
passwordSubject.send("1234")
passwordSubject.send("dkdkdkdkkdkdkdkkd")

    

    




//: [Next](@next)

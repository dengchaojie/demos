//: [Previous](@previous)
/*:
[Previous](@previous)
## The rules of a subscription
- A subscriber will receive a _single_ subscription
- _Zero_ or _more_ values can be published
- At most _one_ completion will be called
- After completion, nothing more is received
*/
import Foundation
import Combine

enum ExampleError: Swift.Error {
    case somethingWentWrong
}

let subject = PassthroughSubject<String, ExampleError>()

subject.handleEvents(receiveSubscription: { (Subscription) in
    print("receiveSubscription")
}, receiveOutput: { (value) in
    print("receiveOutput: \(value)")

}, receiveCompletion: { (_) in
    print("receiveCompletion")

}, receiveCancel: {
    print("receiveCancel")

})
.replaceError(with: "Failure")
.sink { (value) in
    print("Subscriber received value: \(value)")
}

subject.send("dcj")
subject.send("lyj")
subject.send("xuJi")
//subject.send(completion: Subscribers.Completion<ExampleError>.finished)
subject.send(completion: Subscribers.Completion<ExampleError>.failure(ExampleError.somethingWentWrong))
subject.send("tianPeng")
//: [Next](@next)

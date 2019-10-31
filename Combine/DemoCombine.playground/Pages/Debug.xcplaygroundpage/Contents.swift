//: [Previous](@previous)

import Foundation

import Combine




let subject = PassthroughSubject<String, Never>()

let pub = subject.handleEvents(receiveSubscription: { (subscription) in
    print("receiveSubscription: \(subscription)")
}, receiveOutput: { (str) in
        print("receiveSubscription: \(str)")

}, receiveCompletion: { (_) in
    print("receiveCompletion")

}, receiveCancel: {
    print("receiveCancel")

}, receiveRequest: { demand in
    print("receiveRequest: \(demand)")

    }).print("HrtLog")
.replaceError(with: "hrt error")
    .sink { (str) in
                print("sink: \(str)")

}
subject.send("dcj")
pub.cancel()



//: [Next](@next)

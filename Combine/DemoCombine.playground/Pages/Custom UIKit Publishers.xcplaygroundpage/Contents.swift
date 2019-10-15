//: [Previous](@previous)

import Foundation

import Combine
import UIKit
/*:
 [Previous](@previous)
 ## Custom UIKit Publishers
 Unfortunately, not all UIKit elements are ready to use with Combine. A UISwitch, for example, does not support KVO. Therefore, custom UIKit publishers.
 */
/// A custom subscription to capture UIControl target events.
class UIContolSubscription<SubscriberType: Subscriber, Control: UIControl>: Subscription where SubscriberType.Input == Control
{
    var subscriber: SubscriberType?
    let contro: Control
    
    init(subscriber: SubscriberType, control: Control, event: UIControl.Event) {
        self.subscriber = subscriber
        self.contro = control
        control.addTarget(self, action: #selector(touchAction), for: event)
    }
    
    @objc func touchAction() {
        _ = subscriber?.receive(contro)
    }
    
    func request(_ demand: Subscribers.Demand) {
        print("UIContolSubscription request")

    }
    
    func cancel() {
        print("UIContolSubscription cancel")

    }
    
    deinit {
        print("UIContolSubscription deinit")
    }

    
    
}


//: [Next](@next)

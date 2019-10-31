//: [Previous](@previous)

import Foundation

import Combine
import UIKit

///思路：定义一个订阅者：UIContolSubscription，在定义个发布者：UIControlPublisher。通过UIControl的sendActions()，触发action，在触发subscriberd的receive()
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
        print("先执行touchAction，在执行sink闭包")
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

struct UIControlPublisher<Control: UIControl>: Publisher
{
    typealias Output = Control
    
    typealias Failure = Never
    
    
    let control: Control
    let event: UIControl.Event
    init(control: Control, event: UIControl.Event) {
        self.control = control
        self.event = event
    }

    
    func receive<S>(subscriber: S) where S : Subscriber, UIControlPublisher.Failure == S.Failure, UIControlPublisher.Output == S.Input {
        subscriber.receive(subscription: UIContolSubscription(subscriber: subscriber, control: control, event: event))
    }
    
    
}

protocol CombineCompatible { }

extension UIControl: CombineCompatible { }

extension CombineCompatible where Self: UIControl
{
    func publisher(for event: UIControl.Event) -> UIControlPublisher<Self>
    {
        return UIControlPublisher.init(control: self, event: event)
    }
}

let btn = UIButton()
let pub = btn.publisher(for: .touchUpInside).sink { (btn) in
    print("btn is pressed")
}

btn.sendActions(for: .touchUpInside)
pub.cancel()
/*:
## Solving the UISwitch KVO problem
#### As the `UISwitch.isOn` property does not support KVO this extension can become handy.
*/
extension CombineCompatible where Self: UISwitch
{
    /// As the `UISwitch.isOn` property does not support KVO this publisher can become handy.
    /// The only downside is that it does not work with programmatically changing `isOn`, but it only responds to UI changes.
    var isOnPublished: AnyPublisher<Bool, Never> {
        return publisher(for: [UIControl.Event.touchUpInside, UIControl.Event.valueChanged]).map {
            $0.isOn
        }.eraseToAnyPublisher()
    }
}
let switcher = UISwitch()
switcher.isOn = false
let button = UIButton()
btn.isEnabled = false

switcher.isOnPublished.assign(to: \.isEnabled, on: button)

/// As the `isOn` property is not sending out `valueChanged` events itself, we need to do this manually here.
/// This is the same behavior as it would be if the user switches the `UISwitch` in-app.
switcher.isOn = true
switcher.sendActions(for: .valueChanged)
print(button.isEnabled)




//: [Next](@next)

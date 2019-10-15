//: [Previous](@previous)

import Foundation
import Combine
import UIKit
/*:
[Previous](@previous)
## Memory Management
Correct memory management using `Cancellable` makes sure you're not retaining any references.
*/

class HomeViewController: UIViewController {
    let tableView = UITableView()
    let timeLabel = UILabel()
    var foregroundSubscriber: AnyCancellable?
    
    deinit {
        print("HomeViewController deinit called")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foregroundSubscriber = NotificationCenter.default.publisher(for: .NSExtensionHostWillEnterForeground)
        .print("NSExtensionHostWillEnterForeground")
            .sink(receiveValue: { (note) in
                print("receiveValue")
                self.tableView.reloadData()
            })
    }
    
    
}

var vc: HomeViewController? = HomeViewController()
vc?.viewDidLoad()
NotificationCenter.default.post(name: .NSExtensionHostWillEnterForeground, object: nil)
vc = nil
NotificationCenter.default.post(name: .NSExtensionHostWillEnterForeground, object: nil)


//: [Next](@next)

//: [Previous](@previous)

import Foundation
import Combine
import UIKit
/*:
[Previous](@previous)
## @Published properties
A [Property Wrapper](https://www.avanderlee.com/swift/property-wrappers/) that adds a `Publisher` to any property.

_Note: Xcode Playgrounds don't support running this Playground page with the @Published property unfortunately._
*/

class FormViewModel {
    @Published var isSubmitAllowed = true
}

class FormViewController: UIViewController {
    let viewModel = FormViewModel()
    let btn = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewModel.$isSubmitAllowed
            .receive(on: DispatchQueue.main)
        .print()
            .assign(to: \.isEnabled, on: btn)
        
    }
}


let vc = FormViewController()
print("btn enable is \(vc.btn.isEnabled)")
vc.viewModel.isSubmitAllowed = false
print("btn enable is \(vc.btn.isEnabled)")


//: [Next](@next)

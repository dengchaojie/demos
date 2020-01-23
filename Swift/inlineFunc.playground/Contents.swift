import UIKit

var str = "Hello, playground"


func someMethod() {
    
    print("someMethod")
    func inlineMethod() {
        print("inlineMethod")
    }
    inlineMethod()
    
}

someMethod()

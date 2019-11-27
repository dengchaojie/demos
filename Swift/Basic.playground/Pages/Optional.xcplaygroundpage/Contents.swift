//: [Previous](@previous)

import Foundation

// 可选项
var catchPhrase: String?
catchPhrase = "Hey"
// 可选绑定
if let count = catchPhrase?.count {
    print(count)
}
// 合并操作符
// ??
let count2: Int = catchPhrase?.count ?? 0
print(count2)
// 链式操作符
// ?
let count3: Int? = catchPhrase?.count
print(count3 as Any)

// 隐士展开的可选值
// !
let forcedCatchPhrase: String! = "dcj"
let implicitCatchPhrase = forcedCatchPhrase
print(forcedCatchPhrase!)
print(implicitCatchPhrase!)
//Coercion of implicitly unwrappable value of type 'String?' to 'Any' does not unwrap optional
//Provide a default value to avoid this warning
//Force-unwrap the value to avoid this warning
//Explicitly cast to 'Any' with 'as Any' to silence this warning



//: [Next](@next)

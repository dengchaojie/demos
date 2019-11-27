//: [Previous](@previous)

import Foundation


//将多个值组合为一个复合值
let httpError = (503, "Server Error")
// 分解元组方式1
let (code, reason) = httpError
print(code)
print(reason)
// 另一种分解方式
let codeByIndex = httpError.0
print(codeByIndex)
let reasonByIndex = httpError.1
print(reasonByIndex)

let (_, justTheReason) = httpError
print(justTheReason)

//: [Next](@next)

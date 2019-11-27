//: [Previous](@previous)

import Foundation
// 带默认参数值的函数
//func sayHello(name: String = "dcj") {
//
//}
//混合默认值的参数和常规参数的函数
func sayHellp(name: String = "dcj", age: Int) {
    print("\(name) is \(age) years old!")
}
sayHellp(age: 29)

//如果函数只有一个表达式，则可以省略 return
func multiply(x: Int, y: Int) -> Int {
    x + y
}

//指定参数的 label
//func add(x xVal: Int, y yVal: Int) -> Int {
//    xVal + yVal
//}

//省略一些参数的参数 label
//func add(_ xVal: Int, y yVal: Int) -> Int {
//    xVal + yVal
//}
//add(9, y: 8)
//接受函数作为参数的函数
func doMath(operation: (Int, Int) -> Int, a: Int, b: Int) -> Int {
    return operation(a, b)
}
let result = doMath(operation: { (i, j) -> Int in
    return i + j
}, a: 4, b: 9)
print(result)//写法奇特1



//: [Next](@next)

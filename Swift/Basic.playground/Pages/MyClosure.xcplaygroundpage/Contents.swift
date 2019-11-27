//: [Previous](@previous)

import Foundation


// 闭包
let adder: (Int, Int) -> Int = { (x, y) in
    return x + y
}
let res = adder(3, 2)//写法奇特2

//带有速记参数名的闭包
let square: (Int) -> Int = { $0 * $0 }
let sq = square(3)
print(sq)

//将一个闭包传递给函数
let addWithClosure = doMath(operation: adder, a: 3, b: 9)
print(addWithClosure)


//: [Next](@next)

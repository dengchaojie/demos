//: [Previous](@previous)

import Foundation

//while
var x = 1
while x < 10 {
    x = x + 1
    
}

repeat {
    x = x - 1
} while (x > 0)

// 三元操作符
let height = 100
let isTall = height > 200 ? true : false

// 如果不满足一个或者多个条件，请使用guard将程序控制权转移出一个范围
for n in 1...30 {
    guard n % 2 == 0 else {
        continue
    }
    print("\(n) is even")
}

let year = 2012
switch year {
case 2003, 2004:
    print("kdw;w")
case 2010:
    print("oewow")
case 2012...2015:
    print("oqll")
default:
    print("im")
}


//: [Next](@next)

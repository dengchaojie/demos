//: [Previous](@previous)

import Foundation

//迭代枚举
enum Food: CaseIterable {
    case pasta, pizza, hamburger
    
}
for food in Food.allCases {
    print(food)
}

//带有 String 原始值的枚举
enum Currency: String {
    case euro = "EUR"
    case dollar = "USD"
    case pound = "GBP"
}
//打印原始值 rawValue
let euroString = Currency.euro.rawValue
print(euroString)
//带有关联值的枚举
enum Content {
    case empty
    case text(String)
    case number(Int)
}
let con = Content.text("dcj")
switch con {
case .empty:
    print("empty")
case .text(let str):
    print(str)
case .number(let num):
    print(num)
}

//: [Next](@next)

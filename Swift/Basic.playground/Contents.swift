import UIKit


//使用多行字符串字面量来跨越多行
let helloWorldProgram = """
A "Hello, World!" program generally is a computer program
that outputs or displays the message "Hello, World!"
"""
print(helloWorldProgram)

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

//结构体
//结构体自动创建一个逐一构造器，该构造器接收与所有属性匹配的参数

//类
// 定义一个计算属性




//链接：https://juejin.im/post/5ddb580451882573520fb182

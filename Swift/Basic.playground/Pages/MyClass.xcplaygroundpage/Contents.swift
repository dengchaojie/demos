//: [Previous](@previous)

import Foundation

//结构体
//结构体自动创建一个逐一构造器，该构造器接收与所有属性匹配的参数

//类
// 定义一个计算属性
class Person {
    
    var numberOfLaugh = 0
    var isHappy: Bool {
        
        return numberOfLaugh > 0
    }
    func laugh() -> Void {
        numberOfLaugh += 1
    }
    
}
let p = Person.init()
p.laugh()
print(p.isHappy)

final class Student: Person {
    
}

//class Pupillo: Student {
//
//}
//: [Next](@next)

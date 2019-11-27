//: [Previous](@previous)

import Foundation
//指定构造器和便捷构造器
class Transportation {
    let name: String
//    指定构造器
    init(name: String) {
        self.name = name
        
    }
//    便捷构造器
    // 为什么不能写从initWithDefaultName
//    convenience init() {
//        //    指定构造器
//        self.init(name: "dkdk")
//    }
    // 可以写成init(withDefaultName: String = "lsl") {}
    convenience init(withDefaultName: String = "lsl") {
        self.init(name: withDefaultName)
    }
    convenience init(name: String ,b: String) {
        self.init(name: name)
    }
}
let tra = Transportation.init()
let t2 = Transportation.init(withDefaultName: "lwlw")
let t3 = Transportation.init(name: "keo", b: "a")

class Vehicle: Transportation {
    let wheels: Int
    //    指定构造器
    init(name: String, wheels: Int) {
        self.wheels = wheels
        // 委托给父类指定构造器 super
        super.init(name: name)
    }
    convenience override init(name: String) {
        self.init(name: name, wheels: 4)
    }
    
    
    
}

class Person {
    var name: String?
    var age: Int?
    
    init(name: String?, age: Int?) {
        self.name = name
        self.age = age
        
    }
    // convinence可以理解成快速或者快捷构建对象方法。
    // 1 传入参数很多时，不想调用指定的构造方法
    // 2 创建一个默认的对象
    convenience init() {
        self.init(name: "keke", age: 38)
    }
    
    
}

let p = Person.init()
print(p.name as Any)
print(p.age as Any)




//: [Next](@next)

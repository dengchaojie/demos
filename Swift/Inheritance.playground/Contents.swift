import UIKit
// final阻止类继承和属性重写

//final class Instrument {}
//
//class someClass: Instrument {
//
//}


// method。在enum中加入方法
enum Beatle: String {
    case john = "d"
    case paul = "e"
    case george = "n"
    case ringo = "g"
    
    func introduce() -> Void {
        print("kdkdk \(rawValue)")
    }
}


let d = Beatle.john
d.introduce()


///Mutating instance methods
///Because structs are value types, an instance method that modifies its instance must be marked as mutating:
struct Player {
    var name: String
    var level: Int
    // 如果没有mutating，编译报错，不能改变不可变的实例
    mutating func levelUp() {
        self.level = self.level + 1
    }
    static func introduce() {
        print("a struct static method")
    }
}

var p = Player.init(name: "dcj", level: 3)
p.levelUp()
print(p.level)

//Static/class methods
//Static and class methods (also known as type methods) belong to a struct/class type itself, rather than an instance of a struct/class. They are declared with static for a struct or class for a class:
Player.introduce()

class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
         
    }
    
    static func introduce() {
        print("a class static method")
    }
}
Person.introduce()

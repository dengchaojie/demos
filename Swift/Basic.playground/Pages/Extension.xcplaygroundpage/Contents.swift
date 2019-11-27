//: [Previous](@previous)

import Foundation

//扩展可以给已存在的类、结构体、枚举或协议类型添加新的功能
extension String {
    // 计算属性
    var boolValue: Bool {
        if self == "1" {
            return true
            
        }else {
            return false
        }
        
    }
    
}

let resBoolValue = "0".boolValue

//: [Next](@next)

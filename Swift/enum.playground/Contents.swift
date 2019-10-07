import UIKit
import Foundation

var str = "kdkdked"
str.dropFirst(2)

/// 关联值
enum Trade: CustomStringConvertible {
    case Buy(stock: String, amount: Int)
    case Sell(stock: String, amount: Int)
    
    var description: String {
        switch self {
        case .Buy(_, _):
            return "Buy"
        case .Sell(_, _):
        return "Sell"
        }
    }
}


let tra = Trade.Buy(stock: "3100", amount: 100)
print(tra.description)

switch tra {
case .Buy(let stock, let amount):
    print("stock: \(stock), amount: \(amount)")
case .Sell(let stock, let amount):
    print("stock: \(stock), amount: \(amount)")
    
}

/// 添加属性和方法，还有协议和extension
enum Device: CustomStringConvertible {
    case iPhone, iPad, AppleWatch
    var year: Int {
        switch self {
        case .iPhone:
            return 2007
        case .iPad:
            return 2010
        case .AppleWatch:
            return 2012

        }
    }
    
    var description: String {
        switch self {
        case .iPhone:
            return "iPhone"
        case .iPad:
            return "iPad"
        case .AppleWatch:
            return "AppleWatch"
        }
    }
}

extension Device {
    func introduced() -> String {
        switch self {
        case .iPhone:
            return "iPhone"
        case .iPad:
            return "iPad"
        case .AppleWatch:
            return "AppleWatch"
        }
    }
    
    static func fromSlang(term: String) -> Device? {
        if term == "iWatch" {
            return .AppleWatch
        }
        return nil
    }
    
    
}

print(Device.iPhone.year)
print(Device.iPhone.description)

print(Device.iPhone.introduced())
print(Device.fromSlang(term: "iWatch") as Any)


/// 泛型
enum Rubbish<T> {
    case price(T)

    func getPrice() -> T {
        switch self {
        case .price(let value):
            return value

        }
    }
    
}

print(Rubbish<Int>.price(100).getPrice())



enum CompassPoint: String {
case north = "north1"
case south = "south1"
case west = "west1"
case east = "east1"
}

let com = CompassPoint.north
print(com)


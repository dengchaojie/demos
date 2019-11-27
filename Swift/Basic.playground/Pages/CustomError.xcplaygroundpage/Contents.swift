//: [Previous](@previous)

import Foundation

//错误处理
enum BeverageMachineError: Error {
    case invalidSelection
    case insufficentFunds
    case outOfStock
}

func selectBeverage(selection: Int) throws -> String {
    
    return "waiting a Beverage"
}

let message: String
do {
    let messageMaybeNil = try? selectBeverage(selection: 10)
    print(messageMaybeNil as Any)
    message = try selectBeverage(selection: 20)
} catch BeverageMachineError.insufficentFunds {
    print("insufficentFunds")
} catch BeverageMachineError.invalidSelection {
    print("invalidSelection")

} catch BeverageMachineError.outOfStock {
    print("outOfStock")

} catch {
    print("general error")

}

//: [Next](@next)

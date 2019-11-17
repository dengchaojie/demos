import UIKit

let numbers: [Int] = [1,2,3,4]

let numbersSquared = numbers.map { $0 * $0 }
//    numbers.map { (num) -> Int in
//    num * num
//}

print(numbersSquared)


let players = ["Kek","dIi","pwP"]
let lower = players.map { $0.lowercased() }
print(lower)


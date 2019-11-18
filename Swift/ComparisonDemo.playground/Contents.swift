import UIKit
// map
//let numbers: [Int] = [1,2,3,4]
//
//let numbersSquared = numbers.map { $0 * $0 }
////    numbers.map { (num) -> Int in
////    num * num
////}
//
//print(numbersSquared)
//
//
//let players = ["Kek","dIi","pwP"]
//let lower = players.map { $0.lowercased() }
//print(lower)
// compactMap
//let numbersStrings = ["1","2", "3", "four"]
//let numberArray = numbersStrings.compactMap { Int($0)}
//print(numberArray)
//
//let numberArrayOption = numbersStrings.map { Int($0)}
//print(numberArrayOption)
// flatMap
//let eachNumber3Times = numbers.flatMap { Array.init(repeating: $0, count: 3)}
//print(eachNumber3Times)
//let eachNumber3TimesArray = numbers.map { Array.init(repeating: $0, count: 3)}
//print(eachNumber3TimesArray)

// filter
//let numbers = [1,2,3,4,5,6,7]
//let newNumbers = numbers.filter { $0 < 5 }
//print(newNumbers)
//
//let words = ["pineapple", "grapple", "banana", "applet"]
//let newWords = words.filter { $0.contains("apple") }
//print(newWords)

// reduce
let numberReduce: [Int] = [1,2,3,4]
let numberSum = numberReduce.reduce(11) { (sum, item) -> Int in
    return sum + item
}
print(numberSum)






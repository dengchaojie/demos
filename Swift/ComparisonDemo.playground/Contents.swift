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

///// reduce
//let numberReduce: [Int] = [1,2,3,4]
//let numberSum = numberReduce.reduce(11, +)
////    numberReduce.reduce(11) { (sum, item) -> Int in
////    return sum + item
////}
//print(numberSum)
//
//let numberProduct = numberReduce.reduce(1, *)
////    numberReduce.reduce(1) {
////    $0 * $1
////}
////    numberReduce.reduce(1) { (result, item) -> Int in
////    return result * item
////}
//
//print(numberProduct)

/// sorted
//let numbers = [4, 200, 75, 0]
//let numbersAscending = numbers.sorted(by: <)
//let numbersDescending = numbers.sorted(by: >)
//print(numbersAscending)
//print(numbersDescending)
//
//struct Player {
//    let name: String
//    let score: Int
//}
//
//let newPlayers = [
//    Player.init(name: "xj", score: 30),
//    Player.init(name: "dcj", score: 20),
//    Player.init(name: "tp", score: 59)
//]
//
////let sortedPlayers = newPlayers.sorted { (item0, item1) -> Bool in
////    return item0.score < item1.score
////}
//let sortedPlayers = newPlayers.sorted() {
//    $0.score < $1.score
//}
//print(sortedPlayers)

/// forEach
/// forEach does not return anything
let birds = ["Owl", "Crane"]
//birds.forEach { (item) in
//    print(item)
//}
for item in birds {
    print(item)
}

func findFirstNegativeNumber(nums: [Int]) -> Int? {
    
//    for item in nums {
//        if item < 0 {
//            return item
//        }
//    }
//    return nil
    var result: Int?
    nums.forEach { (item) in
        if item < 0 {
            if result == nil {
                result = item

            }
            
        }
    }
    return result
    
}
let numbers = [82, 5, -25, 10, -99]
if let result = findFirstNegativeNumber(nums: numbers) {
    print(result)
}




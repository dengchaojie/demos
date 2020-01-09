//: [Previous](@previous)

import Foundation

enum Either<A: Codable, B: Codable> {
    case left(A)
    case right(B)
}

enum EitherCodingKey: CodingKey {
    case leftKey
    case rightKey
}

extension Either: Codable {

    
    init(from decoder: Decoder) throws {
//        self.init(from: decoder)
        let container = try decoder.container(keyedBy: EitherCodingKey.self)
//        do {
            let leftValue = try container.decode(A.self
                , forKey: .leftKey)
            self = .left(leftValue)
            
            let rightValue = try container.decode(B.self, forKey: .rightKey)
            self = .right(rightValue)

//        } catch  {
//            print(error.localizedDescription)
//        }
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: EitherCodingKey.self)
        try container.encode(self, forKey: .leftKey)
        
        try container.encode(self, forKey: .rightKey)
        
        
    }
    
    
    
}

let case1: [Either<String, Int>] = [.left("dcj"), .right(28)]
//let case2: [Either<String, Int>] = [.left("zxx"), .right(18)]
let encoder = JSONEncoder()
let valueEncoded = try encoder.encode(case1)
let str = String.init(decoding: valueEncoded, as: UTF8.self)
print(str)

let decoder = JSONDecoder()
let case3 = try decoder.decode(Either<String, Int>.self, from: valueEncoded)
print(case3)






//: [Next](@next)

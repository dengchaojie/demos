//: [Previous](@previous)

import Foundation
import Combine
import UIKit

/*:
##### KeyPath binding to NSObject instances
*/

var ageLabel = UILabel()
Just(28)
    .map { print("age is \($0)") }
//    .assign(to: \.text, on: ageLabel)

/*:
##### A URLSessionTask publisher and a JSON Decoding operator
*/

//struct DecodeableExample: Decodable {}
//
//URLSession.shared.dataTaskPublisher(for: URL.init(string: "https://merchmobile.hybunion.cn/HrtApp/phone/phoneMicroMerchantInfo_listAgentMccid.action")!)
//    .map{ $0.data
////        print($0)
//}
//.decode(type: DecodeableExample.self, decoder: JSONDecoder())
//    .receive(on: DispatchQueue.main)
//
//.sink(receiveCompletion: { (_) in
//    print("receiveCompletion")
//
//},
//receiveValue:{ (value) in
//    print(value)
//})
/*:
##### A Publisher for notifications
*/
NotificationCenter.default.publisher(for: .NSSystemClockDidChange)


//: [Next](@next)

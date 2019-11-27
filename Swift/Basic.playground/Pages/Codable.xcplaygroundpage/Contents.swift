//: [Previous](@previous)

import Foundation

// 协议 Codalbe
struct UserInfo: Codable {
    let userName: String
    let loginCount: Int
}

extension UserInfo: CustomStringConvertible {
    var description: String {
        return "\(userName) has tried to login \(loginCount)"
    }
}
let myUser = UserInfo.init(userName: "dcj", loginCount: 39)
print(myUser)

let json = """
{
    "userName": "dcj",
    "loginCount": 13,
}
"""
let decoder = JSONDecoder.init()
let data: Data? = json.data(using: .utf8)

if data != nil {
    do {
        let myUser2 = try decoder.decode(UserInfo.self, from: data!)
        print(myUser2)
        let encoder = JSONEncoder.init()
        do {
            let newData = try encoder.encode(myUser2)
            let str = String.init(data: newData, encoding: .utf8)
            print(str as Any)
        } catch {
            print("encoder error")
        }
    } catch {
        print("decoder error")
    }
} else {
    print("utf8 error")

}


//: [Next](@next)

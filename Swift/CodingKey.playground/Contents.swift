import UIKit

//https://juejin.im/post/5dab0bc16fb9a04e01663cd8

struct Person {
    var name: String
    var favoriteColor: UIColor
}

enum CodingKeys: String, CodingKey {
    case name
    case favoriteColor
}

extension Person: Codable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        // 获取到原始数据
        let colorData = try container.decode(Data.self, forKey: .favoriteColor)
        // 进行解码
        favoriteColor = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? UIColor ?? UIColor.black
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        // 转化为 原始数据
        let colorData = try NSKeyedArchiver.archivedData(withRootObject: favoriteColor, requiringSecureCoding: false)
        // 进行编码
        try container.encode(colorData, forKey: .favoriteColor)
    }
}


let taylor = Person(name: "Swift", favoriteColor: .blue)
let encoder = JSONEncoder()

do {
    let encoded = try encoder.encode(taylor)
    let str = String(decoding: encoded, as: UTF8.self)
    print(str)
    let decoder = JSONDecoder()
    let result = try! decoder.decode(Person.self, from: encoded)
    print(result)
    
} catch {
    print(error.localizedDescription)
}

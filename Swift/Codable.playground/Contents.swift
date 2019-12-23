import UIKit

struct Person {
    let name: String
    let favirateColor: UIColor
}

enum PersonCodingKeys: String, CodingKey {
    case nameKey
    case favirateColorKey
}

extension Person: Codable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PersonCodingKeys.self)
        
        name = try container.decode(String.self, forKey: .nameKey)
        
        let colorData = try container.decode(Data.self, forKey: .favirateColorKey)
        favirateColor = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? UIColor ?? UIColor.black
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: PersonCodingKeys.self)
        try container.encode(name, forKey: .nameKey)
        
        let colorData = try NSKeyedArchiver.archivedData(withRootObject: favirateColor, requiringSecureCoding: false)
        try container.encode(colorData, forKey: .favirateColorKey)
        
    }
    

}

let per = Person.init(name: "dcj", favirateColor: .blue)
let encoder = JSONEncoder()

do {
    let encoded = try encoder.encode(per)
    let str = String(decoding: encoded, as: UTF8.self)
    print(str)
    let decoder = JSONDecoder()
    let perDecoded = try decoder.decode(Person.self, from: encoded) as Person
    print(perDecoded)

} catch {
    print(error.localizedDescription)
}


let someJson = """
{
    "name": "dcj"
    "age": "18"

}
"""









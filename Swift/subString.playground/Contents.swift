import UIKit

var str = "Hello, playground"
let index = str.firstIndex(of: Character("p"))
str.substring(from: str.index(index!, offsetBy: 1))

import UIKit
import Foundation



//extension CGSize {
//
//    static func *(ls: CGSize, n: CGFloat) -> CGSize {
//        return CGSize.init(width: ls.width * n, height: ls.height * n)
//    }
//
//}
//// 上面这个static方法和类方法的区别？
//let oriSize = CGSize.init(width: 10, height: 20)
//let newSize = oriSize * 2

enum InterError: Error {
    case invalidFile(error: String)
    case invalidData(error: String)
    case decodingFailed(error: String)
        
}

struct C {
    let fileName: String
    init(fileName: String) {
        self.fileName = fileName
    }
    func display(named: String) throws -> String {
        if fileName != "web" {
            
            throw InterError.decodingFailed(error: "decodingFailed")
        }
        return self.fileName
    }
}

struct B {
    let fileName: String
    init(fileName: String) {
        self.fileName = fileName
    }
    func read() throws -> C  {
        if fileName != "ipa" {
            
            throw InterError.invalidData(error: "invalidData")
        } else {
            let c = C.init(fileName: "web")
            return c
        }
        
    }
}

struct A {
    
    func loadFile(fileName: String) throws -> B {
        if fileName != "team" {
            
            throw InterError.invalidFile(error: "invalidFile")
        } else {
            let b = B.init(fileName: "ipa")
            return b
        }
        
    }
}
/// 写法1
class NoteManager {
    func loadNote(fileName: String) throws -> String? {
        do {
            let a = A.init()
            let b = try a.loadFile(fileName: fileName)
            do {
                let c = try b.read()
                do {
                    return try c.display(named: c.fileName)

                } catch {

                    throw LoadingError.decodingFailed(error)
                }

            } catch {
                throw LoadingError.invalidData(error)
            }

        } catch {
            throw LoadingError.invalidFile(error)
//完成LoadingError对InterError的包装和抛出
//            Playground execution terminated: An error was thrown and was not caught:
//            ▿ LoadingError
//              ▿ invalidFile : InterError
//                ▿ invalidFile : 1 element
//                  - error : "invalidFile"
        }
    }
}
///写法2
//infix operator ~>
//
//func ~><T>(expression: @autoclosure () throws -> T,
//           errorTranform: (Error) -> Error) throws -> T {
//    do {
//        return try expression()
//    } catch  {
//        throw errorTranform(error)
//    }
//
//}
//
//class NoteManager {
//    func loadNote(fileName: String) throws -> String? {
//        let a = A.init()
//        let b = try a.loadFile(fileName: "code") ~> LoadingError.invalidFile
//        let c = try b.read() ~> LoadingError.invalidFile
//        let str = try c.display(named: c.fileName) ~> LoadingError.invalidFile
//
//        return str
//    }
//}
extension NoteManager {
    enum LoadingError: Error {
        case invalidFile(Error)
        case invalidData(Error)
        case decodingFailed(Error)
            
    }
}

let manager = NoteManager.init()
if let result = try manager.loadNote(fileName: "team") {// 改成"code"，抛出异常
    print(result)
}

///下面MyError和MyError2是等价的
enum MyError3: Error {
    case err1
    case err2
}

let e3 = MyError3.err1
print(e3)///e is a string

enum MyError: Error {
    case err1(MyError3)
    case err2(MyError3)
}
//
//let e = MyError.err1
//print(e)///e is a func

enum MyError2: Error {
    case err1(err: MyError3)
    case err2(err: MyError3)
}
let e2 = MyError2.err1
print(e2)///e is a func




//class Person: NSObject {
//
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//    override class func description() -> String {
//        return "i am \(self)"
//    }
//    override var description: String {
//        return "my name is \(self.name)"
//    }
//
//
//}
//
//let p = Person.init(name: "dcj")
//print(p)
//print(Person.description())



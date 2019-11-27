import Foundation


// public internal fileprivate private
public class AccessLevelShowCase {// 可以被其他模块（其他.swift文件）访问
    
    public var somePublicProperty = 0// 可以被其他模块（其他.swift文件）访问
    internal var someInternalProperty = 1// 可以在包含该类的块（这个.swift文件）中访问该属性
    
    public init() {
        
    }
    
    // 可以在包含该类的块（这个.swift文件）中访问该属性
    fileprivate func someFileprivateMethod() -> String {
        print(somePublicProperty)
        print(someInternalProperty)
        return "someFileprivateMethod"
    }
    // 只能在这个class内部访问
    private func somePrivateMethod() -> String {
        print(somePublicProperty)
        print(someInternalProperty)
        return "somePrivateMethod"
        
    }
    
    func someFunc() -> Void {
        print(somePrivateMethod())
        print(someFileprivateMethod())

    }

}

//let obj = AccessLevelShowCase.init()
//print(obj.somePublicProperty)
//print(obj.someInternalProperty)
//print(obj.someFileprivateMethod())
//obj.someFunc()
//print(obj.somePrivateMethod())// 不能被访问private


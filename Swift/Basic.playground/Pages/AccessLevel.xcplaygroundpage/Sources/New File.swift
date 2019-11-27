import Foundation


var str = "Hello, playground"

// public internal fileprivate private
public class AccessLevelShowCase {// 可以被其他模块（其他.swift文件）访问
    
    public var somePublicProperty = 0// 可以被其他模块（其他.swift文件）访问
    internal var someInternalProperty = 1// 可以在包含该类的块（这个.swift文件）中访问该属性
    // 文件内私有，只能在当前源文件中使用
    fileprivate func someFileprivateMethod() -> String {
        print(somePublicProperty)
        print(someInternalProperty)
        return "someFileprivateMethod"
    }
    // 只能在类中访问，离开了这个类或者结构体的作用域外面就无法访问。
    private func somePrivateMethod() -> String {
        print(somePublicProperty)
        print(someInternalProperty)
        return "somePrivateMethod"
        
    }
    // 默认是internal
    func someFunc() -> Void {
        print(somePrivateMethod())
        print(someFileprivateMethod())

    }

}

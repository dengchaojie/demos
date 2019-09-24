//
//  DefensiveCopy.swift
//  SwiftUIPractice
//
//  Created by hrt03 on 2019/9/23.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import Foundation


@propertyWrapper
public struct DefensiveCopying<Value: NSCopying> {
    
    private var storage: Value
    
    public init(wrappedValue value: Value) {
        storage = value.copy() as! Value
    }
    
    public var wrappedValue: Value {
        get {
            storage
        }
        set {
            storage = newValue.copy() as! Value
        }
    }
    
    public var projectedValue: DefensiveCopying<Value> {
        get { self }
    }
    
    
    
}

public struct Person {
    
    @DefensiveCopying(wrappedValue: "")
    public var name: NSString
}

extension Person {
    public func visitName() -> Void {
        print("name: \(name)")
        print("name: \($name.projectedValue)")
    }
}

//
//  Publishable.swift
//  DemoCombineUIKit
//
//  Created by hrt03 on 2019/9/24.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import Foundation
import Combine

@propertyWrapper

public struct Publishable<Value: Equatable> {
    
    private var storage: Value
    var publisher: PassthroughSubject<Value?, Never>
    
    public init(wrappedValue value: Value) {
        storage = value
        publisher = PassthroughSubject<Value?, Never>.init()
//        Publishers.AllSatisfy<<#Upstream: Publisher#>>
    }
    
    public var wrappedValue: Value {
        get {
            storage
        }
        set {
            if newValue != storage {
                storage = newValue
                publisher.send(storage)
            }
        }
    }
    
    public var projectedValue: Publishable<Value> {
        get { self }
    }
    
}

//
//  ArrayFiltering.swift
//  CombineMVVM
//
//  Created by chao jie deng on 2019/10/4.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import Foundation

public extension Array where Element: Hashable {
    static func removeDuplicates(_ elements: [Element]) -> [Element] {
        var seen = Set<Element>()
        return elements.filter{ seen.insert($0).inserted }
        
    }
    
}

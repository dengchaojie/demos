//
//  Formatters.swift
//  CombineMVVM
//
//  Created by hrt03 on 2019/9/30.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import Foundation

let dayFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd"
    return formatter
}()

let monthFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM"
    return formatter
}()

//
//  WeatherError.swift
//  CombineMVVM
//
//  Created by hrt03 on 2019/9/30.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import Foundation

enum WeatherError: Error {
    case parsing(description: String)
    case network(description: String)
    
}

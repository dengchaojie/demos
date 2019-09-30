//
//  Parsing.swift
//  CombineMVVM
//
//  Created by hrt03 on 2019/9/30.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import Foundation
import Combine


func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, WeatherError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
            .parsing(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
    
    
}

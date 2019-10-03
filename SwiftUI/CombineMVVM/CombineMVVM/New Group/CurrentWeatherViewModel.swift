//
//  CurrentWeatherViewModel.swift
//  CombineMVVM
//
//  Created by chao jie deng on 2019/10/3.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import Foundation


class CurrentWeatherViewModel: ObservableObject {
    
    let city: String
    private let weatherFetch: WeatherFetcher
    
    init(city: String, weatherFetch: WeatherFetcher) {
        self.city = city
        self.weatherFetch = weatherFetch
    }
    
}

//
//  WeaklyWeatherViewModel.swift
//  CombineMVVM
//
//  Created by hrt03 on 2019/9/30.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import Foundation
import Combine

class WeaklyWeatherViewModel: ObservableObject {
    
    @Published var city: String = ""
    @Published var dataSource: [DailyWeatherRowViewModel] = []
    
    private let weatherFetcher: WeatherFetchable
    private let disposables = Set<AnyCancellable>()
    
    init(weatherFetcher: WeatherFetchable,
         scheduler: DispatchQueue = DispatchQueue(label: "WeatherViewModel")
         ) {
        self.weatherFetcher = weatherFetcher
    }
    
}

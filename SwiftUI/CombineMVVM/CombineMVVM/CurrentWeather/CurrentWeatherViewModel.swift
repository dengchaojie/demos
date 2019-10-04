//
//  CurrentWeatherViewModel.swift
//  CombineMVVM
//
//  Created by chao jie deng on 2019/10/3.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import Foundation
import Combine


class CurrentWeatherViewModel: ObservableObject {
    @Published var dataSource: CurrentWeatherRowViewModel?
    let city: String
    private let weatherFetch: WeatherFetcher
    private var disposables = Set<AnyCancellable>()
    
    init(city: String, weatherFetch: WeatherFetcher) {
        self.city = city
        self.weatherFetch = weatherFetch
    }
    
    func refresh() -> Void {
        weatherFetch.currentWeatherForecast(forCity: city)
            .map(CurrentWeatherRowViewModel.init)
            .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { [weak self] value in
            guard let self = self else {return}
            switch value {
            case .finished:
                break
            case .failure:
                self.dataSource = nil
            }
            
            },
            receiveValue: { [weak self] weather in
                guard let self = self else {return}
                self.dataSource = weather
                
        })
        .store(in: &disposables)
    }
}

//
//  WeaklyWeatherViewModel.swift
//  CombineMVVM
//
//  Created by hrt03 on 2019/9/30.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import SwiftUI
import Combine


class WeaklyWeatherViewModel: ObservableObject {
    
    @Published var city: String = ""
    @Published var dataSource: [DailyWeatherRowViewModel] = []
    
    private let weatherFetcher: WeatherFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(weatherFetcher: WeatherFetchable,
         scheduler: DispatchQueue = DispatchQueue(label: "WeatherViewModel")
         ) {
        self.weatherFetcher = weatherFetcher
        _ = $city
        .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
        .sink(receiveValue: fetchWeather(forCity:))
    }
    
    func fetchWeather(forCity city: String) -> Void {
        weatherFetcher.weaklyWeatherForecast(forCity: city)
            .map{ response in
                response.list.map(DailyWeatherRowViewModel.init)
        }
        .map(Array.removeDuplicates)
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { [weak self] value in
                guard let self = self else {return}
                switch value {
                    case .finished: break
                    case .failure: self.dataSource = []
                }
            },
            receiveValue: { [weak self] weather in
                guard let self = self else {return}
                self.dataSource = weather
                })
        .store(in: &disposables)
    }
    
}

extension WeaklyWeatherViewModel {
    
    var currentWeatherView: some View {
        return WeeklyWeatherBuilder.makeCurrentWeatherView(withCity: self.city, weatherFetcher: self.weatherFetcher as! WeatherFetcher)
    }
     
    
}

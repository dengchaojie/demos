//
//  WeatherFetchable.swift
//  CombineMVVM
//
//  Created by hrt03 on 2019/9/30.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import Foundation
import Combine

protocol WeatherFetchable {
    func weaklyWeatherForecast(forCity city: String) ->
    AnyPublisher<WeeklyForecastResponse, WeatherError>
    
    func currentWeatherForecast(forCity city: String) ->
    AnyPublisher<CurrentWeatherForecastResponse, WeatherError>

}

class WeatherFetcher {
    private let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
}

private extension WeatherFetcher {
    struct OpenWeatherApi {
        static let scheme = "https"
        static let host = "api.openweathermap.org"
        static let path = "data/2.5"
        static let key = "12b2817fbec86915a6e9b4dbbd3d9036"
    }
    
    func makeWeeklyForecastComponents(withCity city: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = OpenWeatherApi.scheme
        components.host = OpenWeatherApi.host
        components.path = OpenWeatherApi.path + "/forecast"
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: OpenWeatherApi.key)
        ]
        return components
        
    }
    
    func makeCurrentDayForecastComponents(withCity city: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = OpenWeatherApi.scheme
        components.host = OpenWeatherApi.host
        components.path = OpenWeatherApi.path + "/weather"
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: OpenWeatherApi.key)
        ]
        return components
    }
    
}


extension WeatherFetcher: WeatherFetchable {
    func weaklyWeatherForecast(forCity city: String) -> AnyPublisher<WeeklyForecastResponse, WeatherError> {
        return forecast(with: makeWeeklyForecastComponents(withCity: city))
    }
//
    func currentWeatherForecast(forCity city: String) -> AnyPublisher<CurrentWeatherForecastResponse, WeatherError> {
        return forecast(with: makeCurrentDayForecastComponents(withCity: city))
    }
    
    func forecast<T>(with components: URLComponents) ->
        AnyPublisher<T, WeatherError> where T: Decodable {
            guard let url = components.url else {
                let error = WeatherError.network(description: "Could not create url")
                return Fail(error: error).eraseToAnyPublisher()
            }
            return session.dataTaskPublisher(for: URLRequest.init(url: url))
            .mapError { error in
                WeatherError.network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
            
    }
    
    
    
}

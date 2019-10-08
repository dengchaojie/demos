//
//  WeeklyWeatherBuilder.swift
//  CombineMVVM
//
//  Created by chao jie deng on 2019/10/3.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import Foundation
import SwiftUI

enum WeeklyWeatherBuilder {
    static func makeCurrentWeatherView(
        withCity city: String,
        weatherFetcher: WeatherFetcher
    ) -> some View {
        let viewModel = CurrentWeatherViewModel.init(city: city, weatherFetch: weatherFetcher)
        return CurrentWeatherView.init(viewModel: viewModel)
    }
}

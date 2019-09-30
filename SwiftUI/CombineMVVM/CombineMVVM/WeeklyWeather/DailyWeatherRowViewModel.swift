//
//  DailyWeatherRowViewModel.swift
//  CombineMVVM
//
//  Created by hrt03 on 2019/9/30.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import Foundation
import SwiftUI

class DailyWeatherRowViewModel: Identifiable {
    private let item: WeeklyForecastResponse.Item
    
//    let id: String {
//        return day + temperature + title
//    }
    var day: String {
        return dayFormatter.string(from: item.date)
    }
    
    var month: String {
        return monthFormatter.string(from: item.date)
    }
    
    var temperature: String {
        return String(format: "%.1f", item.main.temp)
    }
    
    var title: String {
        guard let title = item.weather.first?.main.rawValue else {
            return ""
        }
        return title
    }
    
    var fullDescription: String {
        guard let description = item.weather.first?.weatherDescription else {
            return ""
        }
        return description
    }
    init(item: WeeklyForecastResponse.Item) {
        self.item = item
    }
    
}

extension DailyWeatherRowViewModel: Hashable {
    static func == (lhs:DailyWeatherRowViewModel, rhs: DailyWeatherRowViewModel) -> Bool {
        return lhs.day == rhs.day
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.day)
    }
}

//
//  WeeklyWeatherView.swift
//  CombineMVVM
//
//  Created by hrt03 on 2019/9/30.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import SwiftUI

struct WeeklyWeatherView: View {
    @ObservedObject var viewModel: WeaklyWeatherViewModel
    
    var body: some View {
        NavigationView {
            List {
                seachField
                if viewModel.dataSource.isEmpty {
                    emptySection
                }else
                {
                    cityHourlyForecastSection
                    forecastSection
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Weathter ⛅️")
            
        }

    }
}

private extension WeeklyWeatherView {
    var seachField: some View {
        HStack(alignment: .center, spacing: 0) {
            TextField("e.g. Cupertino", text: $viewModel.city)
        }
    }
    var forecastSection: some View {
        Section {
            ForEach(viewModel.dataSource, content: DailyWeatherRow.init(viewModel:))
        }
    }
    
    var cityHourlyForecastSection: some View {
        Section {
            NavigationLink(destination: viewModel.currentWeatherView) {
                VStack(alignment: .leading) {
                    Text(viewModel.city)
                    Text("Weather today").font(.caption).foregroundColor(.gray)
                }
            }
            
        }
    }
    
    var emptySection: some View
    {
        Section{
            Text("No results").foregroundColor(.gray)
        }
    }
    
    
}




//struct WeeklyWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeeklyWeatherView()
//    }
//}

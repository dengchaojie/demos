//
//  CurrentWeatherRow.swift
//  CombineMVVM
//
//  Created by chao jie deng on 2019/10/4.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import SwiftUI
import MapKit

struct CurrentWeatherRow: View {
    private let viewModel: CurrentWeatherRowViewModel
    init(viewModel: CurrentWeatherRowViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            MapView(coordinate: viewModel.coordinate)
            .cornerRadius(25)
            .frame(height: 300)
            .disabled(true)
            
            VStack {
                HStack {
                    Text("☀️ Temperature:")
                    Text("\(viewModel.temperature)°").foregroundColor(.gray)
                }
                HStack {
                    Text("📈 Max temperature:")
                    Text("\(viewModel.maxTemperature)°").foregroundColor(.gray)
                }
                HStack {
                    Text("📉 Min temperature:")
                    Text("\(viewModel.minTemperature)°").foregroundColor(.gray)
                }
                HStack {
                    Text("💧 Humidity")
                    Text("\(viewModel.humidity)°").foregroundColor(.gray)
                }
            }
            
        }
    }
}

//struct CurrentWeatherRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentWeatherRow()
//    }
//}

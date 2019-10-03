//
//  CurrentWeatherView.swift
//  CombineMVVM
//
//  Created by chao jie deng on 2019/10/3.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import SwiftUI
//import Combine

struct CurrentWeatherView: View {
    @ObservedObject var viewModel: CurrentWeatherViewModel
    init(viewModel: CurrentWeatherViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        Text("Hello World!")
    }
}
//
//struct CurrentWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        let
//        CurrentWeatherView.init(viewModel: <#T##CurrentWeatherViewModel#>)
//    }
//}

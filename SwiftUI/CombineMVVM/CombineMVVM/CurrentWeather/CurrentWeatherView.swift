//
//  CurrentWeatherView.swift
//  CombineMVVM
//
//  Created by chao jie deng on 2019/10/3.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import SwiftUI
import Combine

struct CurrentWeatherView: View {
    @ObservedObject var viewModel: CurrentWeatherViewModel
    init(viewModel: CurrentWeatherViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        List(content: content)
            .onAppear(perform: viewModel.refresh)
        .listStyle(GroupedListStyle())
            .navigationBarTitle(viewModel.city)
    }
}

extension CurrentWeatherView {
    
    func content() -> some View {
        if let data = viewModel.dataSource {
            return AnyView(details(for: data))
        }else {
            return AnyView(loading)
        }
    }
    
    func details(for viewModel: CurrentWeatherRowViewModel) -> some View {
        CurrentWeatherRow(viewModel: viewModel)
    }
    
    var loading: some View {
        Text("Loading \(viewModel.city)'s weahter "
        ).foregroundColor(.gray)
    }
    
}


//
//struct CurrentWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        let
//        CurrentWeatherView.init(viewModel: <#T##CurrentWeatherViewModel#>)
//    }
//}

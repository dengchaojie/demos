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
            }
            
        }
        
        
        
    }
}

private extension WeeklyWeatherView {
    var seachField: some View {
        HStack(alignment: .center, spacing: 0) {
            Text("todo")
//            TextField("e.g. Cupertino", text: @viewModel.city)
        }
    }
}




//struct WeeklyWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeeklyWeatherView()
//    }
//}

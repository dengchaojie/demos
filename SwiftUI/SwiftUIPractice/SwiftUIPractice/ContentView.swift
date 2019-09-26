//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by hrt03 on 2019/9/23.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import SwiftUI

struct ContentView: View {

//    var person: Person
    static let formatter: DateFormatter = {
        let forma = DateFormatter()
        forma.dateStyle = .long
        return forma
    }()
    let now = Date()

    
    public var body: some View {

        VStack() {
            LoginView()
//            Text("Hello ") + Text("World ") + Text("What time is it?: \(now, formatter: Self.formatter)")
//            Text("Hello\nWorld!").multilineTextAlignment(.center)
//                .padding(.bottom, 20)
//            Image(systemName: "clock.fill").padding(.bottom, 20)
//            Image(systemName: "cloud.heavyrain.fill")
//                .foregroundColor(.red).font(.title)
//            Image(systemName: "clock").foregroundColor(.red)
//                .font(Font.largeTitle.bold()).padding(.top, 20)
//            Button(action: {}, label: {Text("Click Me")})

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

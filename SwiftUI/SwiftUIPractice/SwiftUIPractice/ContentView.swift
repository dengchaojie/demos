//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by hrt03 on 2019/9/23.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var password: String = ""
//    var person: Person
    static let formatter: DateFormatter = {
        let forma = DateFormatter()
        forma.dateStyle = .long
        return forma
    }()
    let now = Date()

    
    public var body: some View {

        VStack(spacing: 0.0) {
            Text("Hello World")
                .bold().italic().underline()
                .padding(.bottom, 20)
            LogoView().padding(.bottom, 100)
            TextField("Enter name", text: $name)
                .font(Font.system(size: 14))
                .foregroundColor(.purple)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 25)
                .padding(.bottom, 15)

            TextField("Enter password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 25)
                .padding([.bottom], 30)
            Button(action: {
//                print("name: \(self.$name)")
//                print("password: \(self.$password)")

            },
                   label: {
                Text("Sign In")
            })
                .frame(width: 120, height: 40)
                .background(Color.blue)
            Text("Hello ") + Text("World ") + Text("What time is it?: \(now, formatter: Self.formatter)")
            Text("Hello\nWorld!").multilineTextAlignment(.center)
                .padding(.bottom, 20)
            Image(systemName: "clock.fill").padding(.bottom, 20)
            Image(systemName: "cloud.heavyrain.fill")
                .foregroundColor(.red).font(.title)
            Image(systemName: "clock").foregroundColor(.red)
                .font(Font.largeTitle.bold()).padding(.top, 20)
            Button(action: {}, label: {Text("Click Me")})

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

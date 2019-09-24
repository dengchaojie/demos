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
    public var body: some View {

        VStack(spacing: 0.0) {
            
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
                print("name: \(self.$name)")
                print("password: \(self.$password)")

            }) {
                Text("Sign In")
                    .foregroundColor(.white)
                }
                .frame(width: 120, height: 40)
                .background(Color.blue)
            

        }
//        .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

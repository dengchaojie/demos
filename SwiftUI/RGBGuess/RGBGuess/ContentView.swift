//
//  ContentView.swift
//  RGBGuess
//
//  Created by hrt03 on 2019/9/27.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)

    @State var rGuess: Double;
    @State var gGuess: Double;
    @State var bGuess: Double;
    @State var isShowAlert: Bool = false

    var body: some View {
        VStack {
            HStack {
                VStack {
                    // 为什么这个地方不加$???怎么调用方法？
                    Rectangle().foregroundColor(Color.init(red: rTarget, green: gTarget, blue: bTarget))
                    Text("Match this color")
                }
                VStack {
                    Rectangle().foregroundColor(Color.init(red: rGuess, green: gGuess, blue: bGuess))
                    HStack {
                        Text("R: \(Int(rGuess*255.0))")
                        Text("G: \(Int(gGuess*255.0))")
                        Text("B: \(Int(bGuess*255.0))")
                    }
                }
            }
            Button(action: {
                self.isShowAlert = true
            }, label: {
                Text("Hit Me")
            }).alert(isPresented: $isShowAlert) { () -> Alert in
                Alert(title: Text("Your score"), message: Text("kdkdkdkd"))
            }
        }
        
    }
    
//    func buttonAction() -> Void {
//
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}

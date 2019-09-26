//
//  ContentView.swift
//  iOS
//
//  Created by hrt03 on 2019/9/25.
//

import SwiftUI

struct ContentView: View {
    @State var isShowing = true
    @State var password: String = ""
    var body: some View {
        VStack() {
            Text("Hello World")
            Text("my name is dcj")
            SecureField("input your pwd", text:$password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
            Button(action: {
                self.buttonAction()
            }, label: {
                Image(systemName: "clock")
                Text("Click Me")
                Text("Subtitle")
                
            })
            .foregroundColor(.white).background(Color.blue)
                .cornerRadius(5).padding()
            Toggle(isOn: $isShowing, label: {
                Text("Hello")
            })
        }
    }
    
    func buttonAction() -> Void {
        print("button action")
//        NavigationView {
//            NavigationLink(destination:
//                Text("Detail")
//                .navigationBarTitle(Text("Detail"))
//            ) {
//                Text("Push")
//            }.navigationBarTitle(Text("Master"))
//        }
        NavigationView {
            NavigationLink(destination: SecondView()) {
                Text("Push")
            }.navigationBarTitle(Text("Master"))
        }
//        NavigationLink("Detail", destination: Text("Detail").navigationBarTitle(Text("Detail")))

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import SwiftUI

class MyViewController : UIViewController {

    @State var name: String = ""
    @State var password: String = ""

    public var body: some View {
        VStack {
            
            TextField("Enter name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading, .trailing], 25)
                .padding([.bottom], 15)
            TextField("Enter password", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding([.leading, .trailing], 25)
            .padding([.bottom], 30)
            Button(action: {}) {
                            Text("Sign In")
                                .foregroundColor(.white)
                            }.frame(width: 120, height: 40)
                            .background(Color.blue)


        }


    }
    
    override func loadView() {
        self.view = self.body
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

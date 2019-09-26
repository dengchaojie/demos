import UIKit
import SwiftUI
import Combine
import PlaygroundSupport

public struct LoginView: View {
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

}

//class MainView: UIView {
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = UIColor.purple
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//PlaygroundPage.current.liveView = MainView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))






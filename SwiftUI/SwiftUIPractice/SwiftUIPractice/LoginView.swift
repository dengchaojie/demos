//
//  LoginView.swift
//  SwiftUIPractice
//
//  Created by hrt03 on 2019/9/26.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var name: String = ""
    @State var password: String = ""
    private var signInSuccessed: ((Bool) -> Void)? = nil
//    init(onSignedIn: @escaping (Bool) -> Void) {
//        self.signInSuccessed = onSignedIn
//    }
    var body: some View {
        VStack {
            LogoView()
            TextField("Enter name", text: $name)
                .font(Font.system(size: 14))
                .foregroundColor(.purple)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 25)
                .padding(.bottom, 15)

            TextField("Enter password", text: $password)
                .font(Font.system(size: 14))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 25)
                .padding([.bottom], 30)
            Button(action: {
//                print("name: \(self.$name)")
//                print("password: \(self.$password)")
                self.didCompleteWithAuthorization()
            },
                   label: {
                Text("Sign In")
            })
                .frame(width: 120, height: 40)
                .background(Color.blue)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    func didCompleteWithAuthorization() -> Void {
        guard let block = self.signInSuccessed else {
            return
        }
        block(true)

    }
    
    func didCompleteWithError() -> Void {
        guard let block = self.signInSuccessed else {
            return
        }
        block(false)

    }
    
}

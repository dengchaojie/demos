/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import SwiftUI
import AuthenticationServices

struct ContentView: View {
  @State var appleSignInDelegates: SignInWithAppleDelegates! = nil
  @Environment(\.window) var window: UIWindow?
  
  var body: some View {
    ZStack {
      Color.green.edgesIgnoringSafeArea(.all)

      VStack {
        Image("razeware")

        UserAndPassword()
          .padding()

        // Add Sign in with Apple UI View here
        SignInWithAppleButton()
        .frame(width: 60, height: 60)
        .onTapGesture(perform: showAppleLogin)
      }
    }
    .onAppear {
        self.performExistingAccountSetupFlows()
    }
  }
  
  private func showAppleLogin() {

     let request = ASAuthorizationAppleIDProvider().createRequest()
     request.requestedScopes = [.fullName, .email]
//    let request = ASAuthorizationPasswordProvider().createRequest()
//    request.requestedScopes
    performSignIn(using: [request])

   }
  
  private func performExistingAccountSetupFlows() {
    // 1
    #if !targetEnvironment(simulator)

    // 2
    let requests = [
      ASAuthorizationAppleIDProvider().createRequest(),
      ASAuthorizationPasswordProvider().createRequest()
    ]

    // 2
    performSignIn(using: requests)
    #endif
  }
  
  private func performSignIn(using requests: [ASAuthorizationRequest]) {
    appleSignInDelegates = SignInWithAppleDelegates(window: window) { success in
      if success {
        // update UI
        print("SignInWithAppleDelegates success")
      } else {
        // show the user an error
        print("SignInWithAppleDelegates failure")

      }
    }

    let controller = ASAuthorizationController(authorizationRequests: requests)
    controller.presentationContextProvider = appleSignInDelegates as! ASAuthorizationControllerPresentationContextProviding
    controller.delegate = appleSignInDelegates
    controller.performRequests()
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif

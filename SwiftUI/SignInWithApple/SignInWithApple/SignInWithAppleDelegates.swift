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
import AuthenticationServices

class SignInWithAppleDelegates: NSObject {
  private let signInSucceeded: (Bool) -> Void
  private weak var window: UIWindow!

  init(window: UIWindow?, onSignedIn: @escaping (Bool) -> Void) {
    self.window = window

    self.signInSucceeded = onSignedIn
  }
}

extension SignInWithAppleDelegates: ASAuthorizationControllerDelegate {
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    print("didCompleteWithAuthorization")

    switch authorization.credential {
    case let appleIdCredential as ASAuthorizationAppleIDCredential:
      // 1
      if let _ = appleIdCredential.email, let _ = appleIdCredential.fullName {
        // 2
        registerNewAccount(credential: appleIdCredential)
      } else {
        // 3
        signInWithExistingAccount(credential: appleIdCredential)
      }
      break

    case let passwordCredential as ASPasswordCredential:
      signInWithUserAndPassword(credential: passwordCredential)
      break

    default:
      break
    }
  }

  private func signInWithExistingAccount(credential: ASAuthorizationAppleIDCredential) {
    // You *should* have a fully registered account here.  If you get back an error
    // from your server that the account doesn't exist, you can look in the keychain
    // for the credentials and rerun setup

    // if (WebAPI.login(credential.user,
    //                  credential.identityToken,
    //                  credential.authorizationCode)) {
    //   ...
    // }
    print("signInWithExistingAccount")

    self.signInSucceeded(true)
  }
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    // Handle error.
    print("didCompleteWithError")
  }
  
  private func registerNewAccount(credential: ASAuthorizationAppleIDCredential) {
    print("registerNewAccount")

    // 1
    let userData = UserData(email: credential.email!,
                            name: credential.fullName!,
                            identifier: credential.user)

    // 2
    let keychain = UserDataKeychain()
    do {
      try keychain.store(userData)
    } catch {
      print("UserDataKeychain failure")

      self.signInSucceeded(false)
    }

    // 3
    do {
      let success = try WebApi.Register(
        user: userData,
        identityToken: credential.identityToken,
        authorizationCode: credential.authorizationCode
      )
      print("WebApi.Register")

      self.signInSucceeded(success)
    } catch {
      print("registerNewAccount")

      self.signInSucceeded(false)
    }
  }
  
  
  
  private func signInWithUserAndPassword(credential: ASPasswordCredential) {
    // if (WebAPI.login(credential.user, credential.password)) {
    //   ...
    // }
    print("signInWithUserAndPassword")
    self.signInSucceeded(true)
  }
}

extension SignInWithAppleDelegates:
    ASAuthorizationControllerPresentationContextProviding {
  func presentationAnchor(for controller: ASAuthorizationController)
      -> ASPresentationAnchor {
    return self.window
  }
}

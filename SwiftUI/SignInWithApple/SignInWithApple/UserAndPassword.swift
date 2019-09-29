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

import SwiftUI
import AuthenticationServices

struct UserAndPassword: View {
  @State var username: String = "15510771051"
  @State var password: String = "123apple"
  @State var showingAlert = false
  @State var alertText: String = ""

  var body: some View {
    VStack {
      TextField("Username", text: $username)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .textContentType(.username)
        .autocapitalization(.none)
        .disableAutocorrection(true)

      SecureField("Password", text: $password)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .textContentType(.password)

      Button(action: signInTapped) {
        Text("Log In")
          .foregroundColor(Color.white)
      }
      .alert(isPresented: $showingAlert) {
        Alert(title: Text(alertText))
      }
      

    }
    .padding()
  }

 
  
  private func signInTapped() {
    let ws = CharacterSet.whitespacesAndNewlines

    let account = username.trimmingCharacters(in: ws)
    let pwd = password.trimmingCharacters(in: ws)

    guard !(account.isEmpty || pwd.isEmpty) else {
      alertText = "Please enter a username and password."
      showingAlert = true
      return
    }

    // Putting the user/pwd into the shared web credentials ensures that
    // it's available for your browser based logins if you haven't implemented
    // the web version of Sign in with Apple but also then makes it available
    // for future logins via Sign in with Apple on your iOS devices.
    // idmsa.apple.com secure2.store.apple.com
    SharedWebCredential(domain: "hybmpos.com")
      .store(account: username, password: password) { result in
        guard case .failure = result else { return }

        self.alertText = "Failed to store password."
        self.showingAlert = true
    }
  }
}

#if DEBUG
struct UserAndPassword_Previews: PreviewProvider {
  static var previews: some View {
    UserAndPassword()
  }
}
#endif

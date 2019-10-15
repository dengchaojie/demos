//: [Previous](@previous)

import Foundation
import UIKit
import Combine

enum RequestError: Error {
    case sessionError(error: Error)
}

let urlPublisher = PassthroughSubject<URL, RequestError>()
let subscription = urlPublisher.flatMap { url in
    URLSession.shared.dataTaskPublisher(for: url)
        .mapError { (err) -> RequestError in
            print(err)
            return RequestError.sessionError(error: err)
    }
}
.assertNoFailure()
    .sink { (data: Data, response: URLResponse) in
        print("receive vlaue")
        UIImage.init(data: data)
}

urlPublisher.send(URL.init(string: "https://httpbin.org/image/jpeg")!)
//: [Next](@next)

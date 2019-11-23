//: [MainPage](@previous)

import Foundation
//import XCPlayground
import PlaygroundSupport
import UIKit

let imgView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
//let img = UIImage.init(named: "kvo")
//http://httpbin.org/image/png
do {
    let data = try Data.init(contentsOf: URL.init(string: "http://httpbin.org/image/png")!)
    let img = UIImage.init(data: data)
    imgView.image = img

} catch {
    print("url error")
}




PlaygroundPage.current.liveView = imgView











//: [Markup](@next)

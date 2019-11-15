import Foundation
import UIKit

func didTapOnGenerateImageButton() {
    
    DispatchQueue.global(qos: .background).async {
        do {
            let data = try Data.init(contentsOf: URL.init(string: "https://b-gold-cdn.xitu.io/v3/static/img/45.b99ea03.svg")!)
            
            
            DispatchQueue.main.async {
                let image = UIImage.init(data: data)
                print(image as Any)
                print("main")

            }
        } catch  {
            print("error")
        }
        
    }
}

didTapOnGenerateImageButton()

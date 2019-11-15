//
//  ViewController.swift
//  DemoDispatchStoryboard
//
//  Created by chao jie deng on 2019/11/15.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imgV = UIImageView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(imgV)
        
        do {
             imgV.image = UIImage.init(data: try Data.init(contentsOf: URL.init(string: "https://b-gold-cdn.xitu.io/v3/static/img/45.b99ea03.svg")!))
            print("main111")
        } catch  {
            print("error")
        }
//        didTapOnGenerateImageButton()

        
    }


}

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

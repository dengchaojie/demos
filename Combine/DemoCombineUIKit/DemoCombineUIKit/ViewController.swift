//
//  ViewController.swift
//  DemoCombineUIKit
//
//  Created by hrt03 on 2019/9/24.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @Publishable(wrappedValue: "")
    var text: String
    
    let textLabel = UILabel.init(frame: CGRect.init(x: 100, y: 120, width: 120, height: 40))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textLabel.bind(text: $text)
        let button = UIButton.init(frame: CGRect.init(x: 100, y: 180, width: 120, height: 40))
        button.addTarget(self, action: #selector(tapped(button:)), for: .touchUpInside)
        button.setTitle("random text", for: .normal)
        button.backgroundColor = .blue
        
        view.addSubview(textLabel)
        view.addSubview(button)

        
    }
    
    @objc func tapped(button: UIButton) {
        text = String(arc4random() % 101)
    }

}


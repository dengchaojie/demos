//
//  ViewController.swift
//  DemoCombine
//
//  Created by hrt03 on 2019/9/24.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {
        
    let signInPublisher = NotificationCenter.Publisher(center: .default, name: HrtConstraint.nameNote).map {
        return ($0 as? SignInInfo)?.userName ?? "unknown"
    }
    
    let nameLabel = UILabel.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 40))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(nameLabel)
        self.registerSignInHandle()
//        let info = SignInInfo.init(userName: "dcj", password: "123")
    }
    
    func registerSignInHandle() {
        let signInSubscriber = Subscribers.Assign.init(object: self.nameLabel, keyPath: \.text)
//        signInPublisher.subscribe(signInSubscriber)
        
    }

}


//
//  ExtLabel.swift
//  DemoCombineUIKit
//
//  Created by hrt03 on 2019/9/24.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import UIKit
import Combine

extension UILabel {
    
    func bind(text: Publishable<String>) -> Void {
        let subscriber = Subscribers.Assign.init(object: self, keyPath: \.text)
        text.publisher.subscribe(subscriber)
        self.text = text.wrappedValue
        
    }
}

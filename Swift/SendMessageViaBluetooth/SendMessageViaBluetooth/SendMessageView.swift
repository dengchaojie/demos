//
//  SendMessageView.swift
//  SendMessageViaBluetooth
//
//  Created by chao jie deng on 2019/10/31.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

import Foundation
import UIKit

class SendMessageView: UIView {
    
    var blockTouch: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tf = UITextField.init(frame: CGRect.init(x: 0, y: 0, width: frame.width, height: 50))
        self.addSubview(tf)
        tf.placeholder = "请输入信息"
        
        
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: 60, width: frame.width, height: 50))
        self.addSubview(btn)
        btn.addTarget(self, action: #selector(touchBtn), for: .touchUpInside)
        btn.setTitle("发送", for: .normal)
    }
    
    @objc func touchBtn() {
        if let block = self.blockTouch  {
            block()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

//
//  SecondVC.swift
//  Learn
//
//  Created by chao jie deng on 2020/3/9.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

import Foundation
import UIKit

class SecondVC: UIViewController {
    
    typealias BlockDismissed = (_ isDismissed: Bool) -> Void
    var block: BlockDismissed?
    
    override func viewDidLoad() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let block = self.block {
            block(true)
        }
        self.dismiss(animated: true, completion: nil);
    }
}

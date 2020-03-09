//
//  ViewController.swift
//  Learn
//
//  Created by chao jie deng on 2019/10/7.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = SecondVC()
        vc.block = { (isDismissed) in
            print("dismissed")
        }
        self.present(vc, animated: true, completion: nil)
    }
}


//
//  ViewController.swift
//  DemoMoya
//
//  Created by hrt03 on 2019/10/22.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import UIKit
//import Moya
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        
        
        // Do any additional setup after loading the view.
        Networking.provider.request(.someFunc) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
                if let json = try? moyaResponse.mapJSON() as? [String: Any] {
                    print(data)
                    print(statusCode)

                    print(json)
                }
                // do something with the response data or statusCode
            case .failure(_): break
                // this means there was a network failure - either the request
                // wasn't sent (connectivity), or no response was received (server
                // timed out).  If the server responds with a 4xx or 5xx error, that
                // will be sent as a ".success"-ful response.
            }
        }
        
        let parameters = ["body": ["phoneNumber": "15510771051"]]
        Networking.request(API.isActiveOneMonth(parameters: parameters), successCallback: { (json) in
            print(json)
        }) { (msg) in
            print(msg)
        }
        
//        let parameters2 = ["body": ["phoneNum": "15510771051"]]
//        Networking.request(API.getMerByPhoneNumForJiSuBan(parameters: parameters2), successCallback: { (json) in
//            print(json)
//        }) { (msg) in
//            print(msg)
//        }
        
    }
    
    
    

}


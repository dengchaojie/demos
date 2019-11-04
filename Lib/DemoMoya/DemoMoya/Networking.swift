//
//  Networking.swift
//  DemoMoya
//
//  Created by hrt03 on 2019/10/23.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import Foundation
import Moya

private var requestTimeout: Double = 30

private let myEndpointClosure = { (target: API) -> Endpoint in
    
    let url = target.baseURL.absoluteString + target.path
    
    let endpoint = Endpoint.init(url: url, sampleResponseClosure: { () -> EndpointSampleResponse in
        return EndpointSampleResponse.networkResponse(200, target.sampleData)
    }, method: target.method, task: target.task, httpHeaderFields: target.headers)
//    endpoint.adding(newHTTPHeaderFields: ["appName":"极速版"])
    switch target {
    case .getMerByPhoneNumForJiSuBan:
        requestTimeout = 15
        return endpoint
    default:
        requestTimeout = 30
        return endpoint
    }
}

struct Networking {
    static let provider = MoyaProvider<API>.init(endpointClosure: myEndpointClosure)
    static func request(_ target: API, successCallback: @escaping ([String: Any]) -> Void, failure failureCallback: @escaping (String) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case . success(let response):
                if let json = try? response.mapJSON() as? [String: Any] {
                    successCallback(json)
                }else {
                    print("服务器连接成功,数据获取失败")
                }
            case .failure(let error):
                failureCallback(error.errorDescription!)
            }
            
        }
        
        
    }
    
    static func cancelAllRequest() {
        provider.manager.session.getAllTasks { (tasks) in
            tasks.forEach { (task) in
                print("取消网络请求一次")
                task.cancel()
            }
        }
        
    }
}

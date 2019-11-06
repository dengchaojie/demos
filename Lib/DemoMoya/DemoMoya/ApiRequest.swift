//
//  ApiRequest.swift
//  DemoMoya
//
//  Created by hrt03 on 2019/10/23.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import Foundation
import Moya
import Result


enum API {
    case someFunc
    case isActiveOneMonth(parameters: [String: Any])
    case getMerByPhoneNumForJiSuBan(parameters: [String: Any])
    case qrLogin(appname: String, nonce: String, address: String)

}

extension API: TargetType {
    var path: String {
        switch self {
        case .someFunc:
            return "someFunc"
        case .isActiveOneMonth:
            return "/CubeMPOSConsole/merchant/isActiveOneMonth.do"
        case .getMerByPhoneNumForJiSuBan:
            return "/CubeMPOSConsole/merchant/getMerByPhoneNumForJiSuBan.do"
        case .qrLogin:
            return "/qrlogin"
        }
        
    }
    
    var getParameters: [String: Any] {
        switch self {
        case .someFunc:
            return [:]
        case .isActiveOneMonth(let parameters):
            return parameters
        case .getMerByPhoneNumForJiSuBan(let parameters):
            return parameters
        case .qrLogin(let appname, let nonce, let address):
            var paramsDict: [String : Any] = [:]
            paramsDict["appname"] = appname
            paramsDict["nonce"] = nonce
            paramsDict["address"] = address
            return paramsDict
        }
    }
    
    var baseURL: URL {
        return URL.init(string: "https://mpos.hybunion.cn")!
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: getParameters, encoding: JSONEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}


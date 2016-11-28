//
//  NetworkTool.swift
//  SwiftOne
//
//  Created by chenmengjia on 16/8/11.
//  Copyright © 2016年 MuLeZhang. All rights reserved.
//

import UIKit
import Alamofire
class NetworkTool: NSObject {
    typealias SuccessBlock = (_ backMsg: AnyObject) ->()
    typealias FailBlock = (_ error: AnyObject) ->()
    
    func requestHomeContentByIndex(_ index: Int,successBlock: @escaping SuccessBlock,failBlock: @escaping FailBlock) {
        
        let parameters = self.parametersWithIndex(index)
        print(parameters)
        Alamofire.request(kAPI_URL_GET_HOME_CONTENT, method: .get, parameters: parameters as? Parameters, encoding: URLEncoding(destination: .methodDependent), headers: nil)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["text/html"])
//            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    successBlock(response.result.value! as AnyObject)
                case.failure(let error):
                
                    failBlock(error as AnyObject)
        
                }
        }
    }
    //计算时间日期
    func parametersWithIndex(_ index: Int) -> NSDictionary {
        if index > 9 {
            let date = ZDBaseFunction.stringDateBeforeTodaySeveralDays(index)
            let parameters = ["strDate":date, "strRow":"1"]
            print("LAD,-------\(date)")
            return parameters as NSDictionary
        }else {
            let index1 = index + 1
            
            let date = ZDBaseFunction.stringDateFromCurrent()
            let parameters = ["strDate":date, "strRow":index1] as [String : Any]
             print("LAD,ASDASDA\(date)")
            return parameters as NSDictionary
        
        }
    }
//    
//    class func parametersWithIndex(_ index:Int) -> NSDictionary {
//        if index > 9 {
//            let date = ZDBaseFunction.stringDateBeforeTodaySeveralDays(index)
//            let parameters = ["strDate":date,"strRow":"1"]
//            return parameters as NSDictionary
//            
//        }else {
//            let index1 = index + 1
//            let date = ZDBaseFunction.stringDateFromCurrent()
//            let parameters = ["strDate":date,"strRow":"\(index1)"] as [String : Any]
//            
//            return parameters as NSDictionary
//            
//        }
//        
//    }

    
}

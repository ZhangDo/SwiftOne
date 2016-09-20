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
    typealias SuccessBlock = (backMsg: AnyObject) ->()
    typealias FailBlock = (error: AnyObject) ->()
    
    func requestHomeContentByIndex(index: Int,successBlock: SuccessBlock,failBlock: FailBlock) {
        
        let parameters = self.parametersWithIndex(index)
        Alamofire.request(.GET, kAPI_URL_GET_HOME_CONTENT,parameters: parameters as? [String : AnyObject],encoding: .URL,headers:nil)
        .validate()
        .responseJSON { (respons) in
            switch respons.result {
            case .Success:
                successBlock(backMsg: respons.result.value!)
            case.Failure(let error):
                failBlock(error: error)
            }
        }
        
    }
    //计算时间日期
    func parametersWithIndex(index: Int) -> NSDictionary {
        if index > 9 {
            let date = ZDBaseFunction.stringDateBeforeTodaySeveralDays(index)
            let parameters = ["strDate":date, "strRow":"1"]
            print("LAD,-------\(date)")
            return parameters
        }else {
            let index1 = index + 1
            
            let date = ZDBaseFunction.stringDateFromCurrent()
            let parameters = ["strDate":date, "strRow":index1]
             print("LAD,ASDASDA\(date)")
            return parameters
        
        }
    }
    
    class func parametersWithIndex(index:Int) -> NSDictionary {
        if index > 9 {
            let date = ZDBaseFunction.stringDateBeforeTodaySeveralDays(index)
            let parameters = ["strDate":date,"strRow":"1"]
            return parameters
            
        }else {
            let index1 = index + 1
            let date = ZDBaseFunction.stringDateFromCurrent()
            let parameters = ["strDate":date,"strRow":"\(index1)"]
            
            return parameters
            
        }
        
    }

    
}

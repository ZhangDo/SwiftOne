//
//  NetworkResponse.swift
//  SwiftOne
//
//  Created by chenmengjia on 16/8/11.
//  Copyright © 2016年 MuLeZhang. All rights reserved.
//

import UIKit

class NetworkResponse: NSObject {
     var result: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        result = dict["result"] as? String
        
    }
    
    
}

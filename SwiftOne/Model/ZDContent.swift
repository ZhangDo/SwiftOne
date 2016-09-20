//
//  ZDContent.swift
//  SwiftOne
//
//  Created by chenmengjia on 16/8/12.
//  Copyright © 2016年 MuLeZhang. All rights reserved.
//

import Foundation

class ZDContent: NSObject {
    var strLastUpdateDate: String?//最后更新时间
    var strDayDiffer: String?//日期xxx年-xx月-xx日
    var strHpId: String?//
    var strHpTitle: String?
    var strThumbnailUrl: String?
    var strOriginalImgUrl: String?
    var strAuthor: String?
    var strContent: String?
    var strMarketTime: String?
    var sWebLk: String?
    var strPn: String?
    var wImgUrl: String?
    
    override var description: String {
        
        return "strLastUpdateDate = \(strLastUpdateDate),strDayDiffer = \(strDayDiffer)"
    
    
    }
    
}

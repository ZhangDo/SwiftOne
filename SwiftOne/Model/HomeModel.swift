//
//  HomeModel.swift
//  SwiftOne
//
//  Created by chenmengjia on 16/8/11.
//  Copyright © 2016年 MuLeZhang. All rights reserved.
//

import Foundation
/*
 NSString *strLastUpdateDate;
 NSString *strDayDiffer;
 NSString *strHpId;
 NSString *strHpTitle;
 NSString *strThumbnailUrl;
 NSString *strOriginalImgUrl;
 NSString *strAuthor;
 NSString *strContent;
 NSString *strMarketTime;
 NSString *sWebLk;
 NSString *strPn;
 NSString *wImgUrl;
 
 
 */
class HomeModel: NSObject {
    var strLastUpdateDate: String?
    var strDayDiffer: String?
    var strHpId: String?
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
        return "strLastUpdateDate = \(strLastUpdateDate),strDayDiffer = \(strDayDiffer),strHpId = \(strHpId),strHpTitle = \(strHpTitle),strThumbnailUrl = \(strThumbnailUrl),strOriginalImgUrl = \(strOriginalImgUrl),strAuthor = \(strAuthor),strContent = \(strContent),strMarketTime = \(strMarketTime),sWebLk = \(sWebLk),strPn = \(strPn),wImgUrl = \(wImgUrl)"
    
    }
  
    
    
    
    
}

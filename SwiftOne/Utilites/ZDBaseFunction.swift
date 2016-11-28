//
//  ZDBaseFunction.swift
//  SwiftOne
//
//  Created by chenmengjia on 16/8/11.
//  Copyright © 2016年 MuLeZhang. All rights reserved.
//

import UIKit

class ZDBaseFunction: NSObject {
    
    
  class func homeENMarketTimeWithOriginalMarketTime(_ originalMarketTime: NSString) -> NSString {
        let marketTime = self.dateFromString(originalMarketTime)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd&MMM , yyyy"
        let readingENMarketTime = dateformatter.string(from: marketTime)
        
        
        
      return readingENMarketTime as NSString
        
    }
    
   class func dateFromString(_ dateStr:NSString) -> Date {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        inputFormatter.timeZone = TimeZone.current
        return inputFormatter.date(from: dateStr as String)!
        
    }
    class func stringDateBeforeTodaySeveralDays(_ days: Int) -> NSString {
        var stringdate = ""
        let now = Date()
        print("现在时间是：\(now)")
        var theDate: Date?
        if days != 0 {
            theDate = Date.init(timeIntervalSinceNow: -24 * 60 * 60 * Double(days))
            
        }else {
            theDate = now
        }
        
        stringdate = self.stringDateFromDate(theDate!) as String
        return stringdate as NSString
    
    
    }
   class func stringDateFromDate(_ date: Date) -> NSString {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let dateString = dateFormatter.string(from: date)
    
    return dateString as NSString
    
    }
    class func stringDateFromCurrent() -> NSString {
        let currentDate = Date()
        let dateformatter = DateFormatter()
        
        dateformatter.dateFormat = "yyyy-MM-dd"
        let currDateString = dateformatter.string(from: currentDate)
        
         print("现在时间是：\(currDateString)")
        return currDateString as NSString
    
    }

}

//
//  ZDBaseFunction.swift
//  SwiftOne
//
//  Created by chenmengjia on 16/8/11.
//  Copyright © 2016年 MuLeZhang. All rights reserved.
//

import UIKit

class ZDBaseFunction: NSObject {
    
    
  class func homeENMarketTimeWithOriginalMarketTime(originalMarketTime: NSString) -> NSString {
        let marketTime = self.dateFromString(originalMarketTime)
        let dateformatter = NSDateFormatter()
        dateformatter.dateFormat = "dd&MMM , yyyy"
        let readingENMarketTime = dateformatter.stringFromDate(marketTime)
        
        
        
      return readingENMarketTime
        
    }
    
   class func dateFromString(dateStr:NSString) -> NSDate {
        let inputFormatter = NSDateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        inputFormatter.timeZone = NSTimeZone.defaultTimeZone()
        return inputFormatter.dateFromString(dateStr as String)!
        
    }
    class func stringDateBeforeTodaySeveralDays(days: Int) -> NSString {
        var stringdate = ""
        let now = NSDate()
        print("现在时间是：\(now)")
        var theDate: NSDate?
        if days != 0 {
            theDate = NSDate.init(timeIntervalSinceNow: -24 * 60 * 60 * Double(days))
            
        }else {
            theDate = now
        
        }
        
        stringdate = self.stringDateFromDate(theDate!) as String
        
        return stringdate
    
    
    }
   class func stringDateFromDate(date: NSDate) -> NSString {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let dateString = dateFormatter.stringFromDate(date)
    
    return dateString
    
    }
    class func stringDateFromCurrent() -> NSString {
        let currentDate = NSDate()
        let dateformatter = NSDateFormatter()
        
        dateformatter.dateFormat = "yyyy-MM-dd"
        let currDateString = dateformatter.stringFromDate(currentDate)
        
         print("现在时间是：\(currDateString)")
        return currDateString
    
    }

}

//
//  NSDate-Extension.swift
//  XMGTV
//
//  Created by 蒋俊 on 17/4/5.
//  Copyright © 2017年 coderwhy. All rights reserved.
//

import Foundation

extension NSDate {
    
    //给NSDate扩充一个方法，计算当前时间和1970年的时间间隔
    class func getCurrentTime() -> String {
        let nowDate = NSDate()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        //把这个时间间隔包装成字符串返回
        return "\(interval)"
        
        
    }
    
    
    
    
    
}
